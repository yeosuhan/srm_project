package com.oti.team2.member.controller;

import java.io.IOException;
import java.util.UUID;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.oti.team2.institution.dto.Institution;
import com.oti.team2.institution.service.IInstitutionService;
import com.oti.team2.member.dto.EmployeeList;
import com.oti.team2.member.dto.File;
import com.oti.team2.member.dto.Member;
import com.oti.team2.member.dto.MemberDto;
import com.oti.team2.member.dto.ProfileImg;
import com.oti.team2.member.service.IJoinService;
import com.oti.team2.member.service.IMemberService;
import com.oti.team2.srresource.service.ISrResourceService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/member")
public class MemberController {
	@Autowired
	private IMemberService memberService;
	@Autowired
	private IJoinService joinService;
	@Autowired
	private ISrResourceService srResourceService;
	@Autowired
	private IInstitutionService institutionService;
	@Autowired
	private JavaMailSender mailSender;

	/**
	 * 멤버의 내 정보 조회
	 * 
	 * @author : 신정은
	 * @param session
	 * @param model
	 * @return
	 */
	@GetMapping("/myinfo")
	public String getMember(HttpSession session, Model model, Authentication auth) {
		// session 에서 사용자 정보 가져오기
		String role = auth.getAuthorities().stream().findFirst().get().toString();
		Member member = memberService.getMember(auth.getName(), role);
		Institution inst = institutionService.getInst(auth.getName());
		log.info(inst);
		log.info(member);
		model.addAttribute("inst", inst);
		model.addAttribute("member", member);
		return "member/myinfo";
	}

	/**
	 * 모든 사용자의 자신의 정보 수정
	 * 
	 * @author : 신정은
	 * @param member
	 * @return
	 */
	@PostMapping("/myinfo")
	public String updateMember(Member member) {
		log.info(member);
		memberService.updateMember(member);
		return "redirect:/member/myinfo";
	}

	/**
	 * 
	 * 멤버의 프로필 사진 조회
	 * @author : 신정은
	 * @param memberId
	 * @return
	 */
	@GetMapping("/profile/{memberId}")
	public ResponseEntity<byte[]> getProfile(@PathVariable String memberId) {
		ProfileImg profileImg = memberService.getProfileImg(memberId);
		log.info(profileImg);
		HttpHeaders headers = new HttpHeaders();
		String mtypes[] = profileImg.getFileType().split("/");
		headers.setContentType(new MediaType(mtypes[0], mtypes[1]));			
		

		return new ResponseEntity<byte[]>(null, headers, HttpStatus.OK);
	}

	/**
	 * 개발자 목록 조회
	 * 
	 * @author : 안한길
	 * @param deptCd
	 * @return List<developer>
	 */
	@ResponseBody
	@GetMapping("/department")
	public EmployeeList getEmployeeList(@RequestParam() String deptCd) {
		log.info(deptCd);
		EmployeeList employeeList = new EmployeeList();
		employeeList.setDevelopers(memberService.getEmployeeNameList(deptCd));
		employeeList.setSchedule(
				srResourceService.getSrResourceListByEmpId(employeeList.getDevelopers().get(0).getEmpId()));
		log.info(employeeList.getSchedule());
		return employeeList;
	}

	/**
	 * 프로필 사진 등록(수정)
	 * 
	 * @author : 여수한
	 * @param File
	 * @return
	 * @throws IOException
	 */
	@ResponseBody
	@PostMapping("/profile")
	public void addFile(@RequestParam("file") MultipartFile multi, File file, Authentication auth) throws Exception {
		String memberId = auth.getName();
		log.info("컨트롤러 들어옴 : memberId = " + memberId);
		if (multi != null && !multi.isEmpty()) {
			file.setFileContentType(multi.getContentType());
			file.setFileData(multi.getBytes());
			log.info("fileData: " + file.getFileData());
			joinService.addFile(file, memberId);
		}
	}

	/**
	 * 비밀번호 찾기 (이메일로 임시 비밀번호 발급)
	 * 
	 * @author 최은종
	 * @param request, model, memberDto, eml, telNo
	 * @return 로그인 폼
	 * 
	 */
	@PostMapping("/findPswd")
	public String getPswd(HttpServletRequest req, Model model, MemberDto memberDto,
			@RequestParam(required = true, value = "eml") String eml,
			@RequestParam(required = true, value = "telNo") String telNo) {
		log.info("비번찾기 컨트롤러");

		// 매개변수로 사용할 dto에 뷰를 통해 받은 검증을 위한 이메일과 전화번호 담아서 보내기
		memberDto.setEml(eml);
		memberDto.setTelNo(telNo);
		String joinedMember = memberService.getPswd(memberDto);
		memberDto.setMemberId(joinedMember);
		log.info(joinedMember);
		model.addAttribute("joinedMember", joinedMember);

		if (joinedMember == null) {
			// 회원정보가 없다면 비밀번호 찾기로 리다이렉트
			log.info("회원정보 없음");
			return "redirect:/loginForm";
		} else {
			// 회원정보가 있다면 임시 비밀번호 생성
			log.info("회원정보 있음");
			String randomPswd = UUID.randomUUID().toString().replaceAll("-", "");
			randomPswd = randomPswd.substring(0, 10);
			// 비밀번호 암호화
			String randomPswdforDb = joinService.getEncodedPassword(randomPswd);
			memberDto.setPswd(randomPswdforDb);
			log.info("randomPswd: " + randomPswd);
			// 임시 비밀번호로 DB 업데이트
			memberService.updateNewPswd(memberDto);

			// 발신인 정보
			String fromEmail = "otiteam2@gmail.com"; // 받는 사람 메일에 표시됨
			String fromName = "오티아이"; // 발신인 이름
			String title = "[OTI 오티아이] OTI-SRM 임시 비밀번호 입니다.";
			String content = memberDto.getMemberId()
					+ "님 안녕하세요. 로그인 후 비밀번호를 변경하여 사용 부탁드립니다. 본인이 새로운 비밀번호를 요청하지 않았다면 이 이메일은 무시해 주세요.";
			content += "OTI-SRM 임시 비밀번호 : " + randomPswd;

			// 수신인 정보
			String toEmail = memberDto.getEml();

			// 이메일 발송
			MimeMessage msg = mailSender.createMimeMessage();
			try {
				MimeMessageHelper helper = new MimeMessageHelper(msg, true, "utf-8");
				helper.setFrom(fromEmail);
				helper.setTo(toEmail);
				helper.setSubject(title);
				helper.setText(content, true);
				mailSender.send(msg);
			} catch (Exception e) {
				log.info("이메일 발송 실패: " + e);
			}

			// 회원정보가 있다면 로그인 폼으로 리턴
			return "redirect:/loginForm";
		}

	}

}
