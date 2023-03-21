 package com.oti.team2.srdemand.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.institution.service.IInstitutionService;
import com.oti.team2.member.service.IMemberService;
import com.oti.team2.progress.service.IProgressService;
import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrFilterDto;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.SrdemandDetail;
import com.oti.team2.srdemand.dto.SrdemandPrgrsrt;
import com.oti.team2.srdemand.dto.WriteSdBaseDto;
import com.oti.team2.srdemand.dto.WriterDto;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.srinformation.dto.SrDmndRowNum;
import com.oti.team2.srinformation.service.ISrinformationService;
import com.oti.team2.system.dto.SrSystem;
import com.oti.team2.system.service.ISystemService;
import com.oti.team2.task.dto.SystemTask;
import com.oti.team2.task.service.ITaskService;
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/srdemand")
public class SrDemandController {

	@Autowired
	private IInstitutionService institutionService;

	@Autowired
	private ISrDemandService srdemandService;

	@Autowired
	private IMemberService memberService;

	@Autowired
	private ISystemService systemService;

	@Autowired
	private ITaskService taskService;

	@Autowired
	private IProgressService progressService;

	@Autowired
	private ISrinformationService srinformationService;

	/**
	 * sr요청 작성 시 , 작성자의 아이디, 이름, 소속기관 이름을 세팅하기 위함
	 * 
	 * @author 신정은
	 * 
	 */
	@ResponseBody
	@GetMapping("/add")
	public WriteSdBaseDto addSrDemand(Authentication auth) {
		log.info("기본정보 세팅" + auth.getName());
		// 세션에서 사용자의 이름을 가져와야 됨.
		String memberId = auth.getName();
		String flnm = memberService.getFlnm(memberId);

		// 시스템 목록의 첫 시스템과, 해당 시스템의 업무구분 데이터를 기본적으로 세팅한다.
		SrSystem system = systemService.getFirstSystem();
		log.info("system" + system);
		List<SystemTask> taskList = taskService.getTaskList(system.getSysCd());
		log.info("taskList" + taskList);

		String instName = institutionService.getInst(memberId).getInstNm();
		WriterDto writerDto = new WriterDto(memberId, flnm, instName);
		WriteSdBaseDto wbDto = new WriteSdBaseDto(writerDto, system, taskList);
		log.info(wbDto);
		return wbDto;
	}

	/**
	 * sr요청 등록
	 * 
	 * @author 신정은
	 */
	@PostMapping("/add")
	public String postSrDemand(SrRequestDto srRequest) throws IllegalStateException, IOException {
		log.info(srRequest);
		srdemandService.addSrDemand(srRequest);
		return "redirect:/srdemand/list";
	}

	/**
	 * 고객요청 목록 조회 기능 **
	 * 
	 * @author 신정은
	 */
	@GetMapping("/list")
	public String getSrDemandList(Authentication auth, Model model,
			@RequestParam(required = false, name = "dmndno") String dmndno,
			@RequestParam(required = true, name = "page", defaultValue = "1") String page,
			@RequestParam(required = true, name = "sort", defaultValue = "DESC") String sort,
			@RequestParam(required = false, name = "dmndYmdStart") String dmndYmdStart,
			@RequestParam(required = false, name = "dmndYmdEnd") String dmndYmdEnd,
			@RequestParam(required = false, name = "sttsCd") Integer sttsCd,
			@RequestParam(required = false, name = "sysCd") String sysCd,
			@RequestParam(required = false, name = "taskSeCd") String taskSeCd,
			@RequestParam(required = false, name = "keyWord") String keyWord,
			@RequestParam(required = false, name = "hstryId") Integer hstryId) {
		log.info("sort : " + sort);
		model.addAttribute("sort", sort);
		String memberId = auth.getName();
		SrFilterDto srFilterDto = new SrFilterDto();
		if (dmndYmdStart == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.MONTH, -1);
			String stringDate = sdf.format(calendar.getTime());
			dmndYmdStart = stringDate;// 기본값 한달전
		}
		srFilterDto.setDmndYmdStart(dmndYmdStart);
		srFilterDto.setDmndYmdEnd(dmndYmdEnd);
		srFilterDto.setSttsCd(sttsCd);
		srFilterDto.setKeyWord(keyWord);
		srFilterDto.setSysCd(sysCd);
		srFilterDto.setTaskSeCd(taskSeCd);
		model.addAttribute("srFilterDto", srFilterDto);
		log.info(srFilterDto);
		// 목록
		int totalRows = srdemandService.getCountClientSr(memberId, srFilterDto);
		Pager pager = new Pager(10,totalRows, Integer.parseInt(page));
		log.info(pager);
		SrdemandDetail sd = null;
		String prgrsRt = null;
		if (totalRows != 0) {
			List<SrDemand> list = null;
			SrDmndRowNum srDmndRowNum = null;
			// 기본 첫번째 상세 or 선택된 상세
			if (dmndno != null) {
				srDmndRowNum = srdemandService.getRownum(dmndno);
				int pn = pager.findPageNo(srDmndRowNum.getRn());
				pager=new Pager(10,totalRows, pn);
				prgrsRt = progressService.getPrgrsRt(dmndno);
				sd = srdemandService.getSrDemandDetail(dmndno);
				model.addAttribute("noHstry",true);
				model.addAttribute("rownum", srDmndRowNum.getRn());
			} 
			if(hstryId != null) {
				srDmndRowNum = srdemandService.getRownum(hstryId);
				int pn = pager.findPageNo(srDmndRowNum.getRn());
				pager = new Pager(10,totalRows,pn);
				model.addAttribute("noHstry",false);
				model.addAttribute("rownum", srDmndRowNum.getRn());
			}
			list = srdemandService.getSrDemandList(memberId, pager, sort, srFilterDto);
			model.addAttribute("mySrDemandList", list);
			if(dmndno == null && hstryId == null) {
				prgrsRt = progressService.getPrgrsRt(list.get(0).getDmndNo());
				sd = srdemandService.getSrDemandDetail(list.get(0).getDmndNo());
			}
			log.info(sd);
		}
		// 시스템 목록
		model.addAttribute("systemList", systemService.getSystemList());
		// 작업 구분
		if (sysCd != null) {
			model.addAttribute("taskList", taskService.getTaskList(sysCd));
		}
		model.addAttribute("sd", sd);
		model.addAttribute("prgrsRt", prgrsRt);
		model.addAttribute("pager", pager);
		model.addAttribute("role", auth.getAuthorities().stream().findFirst().get().toString());
		return "srDemand/userSrDemandList";
	}

	/**
	 * SR요청 상세보기
	 * 
	 * @author 신정은
	 */
	@GetMapping("/detail/{dmNo}")
	public String getSrDemandDetail(@PathVariable String dmNo, Model model, Authentication auth) {
		String prgrsRt = progressService.getPrgrsRt(dmNo);
		SrdemandDetail sd = srdemandService.getSrDemandDetail(dmNo);
		log.info(sd);
		SrdemandPrgrsrt sdpr = new SrdemandPrgrsrt(sd, prgrsRt);
		log.info(sdpr);
		model.addAttribute("sd", sd);
		model.addAttribute("prgrsRt", prgrsRt);
		if (auth.getAuthorities().stream().findFirst().get().toString().equals(Auth.ROLE_CLIENT.toString())) {
			log.info("여기~");
			return "srDemand/user/srDetail";
		}
		return "srDemand/admin/adSrDetail";
	}

	/**
	 * SR요청 수정하기
	 * 
	 * @author 신정은
	 */
	@GetMapping("/modify/{dmndNo}")
	public String updateSrDemandForm(@PathVariable String dmndNo, Model model) {
		// 수정 진행
		log.info(dmndNo);
		SrdemandDetail sd = srdemandService.getSrDemandDetail(dmndNo);
		model.addAttribute("sd", sd);
		return "srDemand/user/srUpdate";
	}

	/**
	 * SR요청 수정하기
	 * 
	 * @author 신정은
	 * @throws IOException 
	 * @throws IllegalStateException 
	 */
	@PostMapping("/modify")
	public String updateSrDemand(SrRequestDto srRequestDto) throws IllegalStateException, IOException {
		// 수정 진행
		log.info(srRequestDto);
		srdemandService.updateSrDemand(srRequestDto);
		return "redirect:/srdemand/list?dmndno=" + srRequestDto.getDmndNo();
	}

	/**
	 * SR요청 삭제하기
	 * 
	 * @author 신정은
	 */
	@GetMapping("/delete/{dmndNo}")
	public String deleteSrDemand(@PathVariable("dmndNo") String dmndNo) {
		log.info(dmndNo);
		srdemandService.deleteSrdemand(dmndNo);
		return "redirect:/srdemand/list";
	}

	/**
	 * 반영요청 수락하기
	 * 
	 * @author 여수한
	 */
	@PostMapping("/end")
	public String endSr(String dmndNo) {
		log.info("반영요청 - controller: " + dmndNo);

		srdemandService.endSr(dmndNo); // SR요청 진행상황 개발완료
		log.info("SR요청 진행상황 개발완료 완료");
		progressService.endProgress(dmndNo); // 진척률 운영반영 종료일, 진척률 넣기
		log.info("진척률 운영반영 종료일, 진척률 넣기 완료");
		srinformationService.endYmd(dmndNo); // SR진척 계획 종료일
		log.info("SR진척 계획 종료일 완료");
		return "redirect:/srdemand/list";
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-15
	 * @return 사용자의 sr요청 목록 엑셀 다운로드
	 * @throws Exception
	 */
	@GetMapping(value = "/list/download")
	public void downloadExcel(Authentication auth, Model model,
			@RequestParam(required = false, name = "dmndno") String dmndno,
			@RequestParam(required = true, name = "page", defaultValue = "1") String page,
			@RequestParam(required = true, name = "sort", defaultValue = "DESC") String sort,
			@RequestParam(required = false, name = "dmndYmdStart") String dmndYmdStart,
			@RequestParam(required = false, name = "dmndYmdEnd") String dmndYmdEnd,
			@RequestParam(required = false, name = "sttsCd") Integer sttsCd,
			@RequestParam(required = false, name = "sysCd") String sysCd,
			@RequestParam(required = false, name = "taskSeCd") String taskSeCd,
			@RequestParam(required = false, name = "keyWord") String keyWord,
			@RequestParam(required = false, name = "hstryId") Integer hstryId, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		log.info("엑셀 가자잇 ");
		log.info("sort : " + sort);
		model.addAttribute("sort", sort);
		String memberId = auth.getName();
		SrFilterDto srFilterDto = new SrFilterDto();
		if (dmndYmdStart == null) {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar calendar = Calendar.getInstance();
			calendar.add(Calendar.MONTH, -1);
			String stringDate = sdf.format(calendar.getTime());
			dmndYmdStart = stringDate;// 기본값 한달전
		}
		srFilterDto.setDmndYmdStart(dmndYmdStart);
		srFilterDto.setDmndYmdEnd(dmndYmdEnd);
		srFilterDto.setSttsCd(sttsCd);
		srFilterDto.setKeyWord(keyWord);
		srFilterDto.setSysCd(sysCd);
		srFilterDto.setTaskSeCd(taskSeCd);
		log.info(srFilterDto);
		List<SrDemand> list = null;
		list = srdemandService.getMyExcelList(memberId, sort, srFilterDto);
		log.info(list);
		srdemandService.SrDemandListdownload(list,request,response);
	}
}