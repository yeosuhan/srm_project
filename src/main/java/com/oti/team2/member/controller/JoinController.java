package com.oti.team2.member.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.department.dto.Department;
import com.oti.team2.department.dto.DeptFilterDto;
import com.oti.team2.department.service.IDepartmentService;
import com.oti.team2.institution.dto.Institution;
import com.oti.team2.institution.service.IInstitutionService;
import com.oti.team2.jobgrade.dto.JobGrade;
import com.oti.team2.jobgrade.service.IJobGradeService;
import com.oti.team2.member.dto.Join;
import com.oti.team2.member.service.IJoinService;

import lombok.extern.log4j.Log4j2;
@Log4j2
@Controller
public class JoinController {
	
	@Autowired
	private IJoinService joinService;
	
	@Autowired
	private IInstitutionService institutionService;
	
	@Autowired
	private IDepartmentService departmentService;
	
	@Autowired
	private IJobGradeService jobGradeService;
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-01
	 * @return join-client로 이동
	 */
	@GetMapping("/join-client")
	public String getJoinClient(Model model) {
		List<Institution> instList = institutionService.getAllInst();
		model.addAttribute("instList", instList);
		return "member/join-client";
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-01
	 * @return join-employee로 이동
	 */
	@GetMapping("/join-employee")
	public String getJoinEmployee(Model model) {
		Department deptFilter = new Department();
		List<Department> dept = departmentService.getDepartmentList(deptFilter);
		List<JobGrade> grade = jobGradeService.getJobGradeList();
		model.addAttribute("dept", dept);
		model.addAttribute("grade", grade);
		return "member/join-employee";
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-01
	 * @return join
	 * @throws IOException 
	 */
	@PostMapping("/join")
	public String getJoin(Join join) throws IOException {
		log.info("join 입력값 : " + join);
		if(join.getJbgdCd().equals("CXFC") || join.getJbgdCd().equals("ASEC") ||
				join.getJbgdCd().equals("DPHD") || join.getJbgdCd().equals("ASDR")) {
			join.setMemberType("ROLE_ADMIN");
		} else if(join.getJbgdCd().equals("DPTC") || join.getJbgdCd().equals("ASMA") || join.getJbgdCd().equals("CLRK")) {
			join.setMemberType("ROLE_DEVELOPER");
		}
		if(join.getMemberId().length()<8) {
			return "redirect:/member/join-client";
		}
		
		/* 파일 추가
		 * MultipartFile mfile = join.getFile();
		log.info("join의 mfile : " + mfile);
		if(mfile!=null && !mfile.isEmpty()) {
			join.setFileType(mfile.getContentType());
			join.setFileData(mfile.getBytes());
			log.info("파일 넣고 join 입력값 : " + join);
			joinService.getJoin(join);
		}else {
			log.info("파일 안넣은 join 입력값 : " + join);
			joinService.getJoin(join);

		}*/
		joinService.getJoin(join);
		return "redirect:/member/login";
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-02
	 * @return ID 중복확인
	 */
	@ResponseBody
	@GetMapping("/join/check/{memberId}")
	public Integer checkId(@PathVariable("memberId") String memberId) {
		log.info("입력한 memberId : " + memberId);
		log.info("입력한 memberId의 길이 : " + memberId.length());
		int check = 0;
		if(memberId.equals("공백")) {
			log.info("멤버 입력해");
			check =2;
			return check;
		}
		if(memberId.length()<8) {
			check = 4;
		} else if(memberId.length()>15) {
			check = 3;
		} else {
			check = joinService.checkId(memberId);
		}
		return check;
	}
}
