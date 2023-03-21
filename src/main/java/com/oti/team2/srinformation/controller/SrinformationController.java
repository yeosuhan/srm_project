package com.oti.team2.srinformation.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.progress.dto.Prgrs;
import com.oti.team2.progress.service.IProgressService;
import com.oti.team2.srdemand.dto.SrdemandDetail;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.srinformation.dto.Dept;
import com.oti.team2.srinformation.dto.Manager;
import com.oti.team2.srinformation.dto.SrInfoFilter;
import com.oti.team2.srinformation.dto.SrTotal;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInformation;
import com.oti.team2.srinformation.service.ISrinformationService;
import com.oti.team2.srinformationhistory.dto.SrResourceAddHistoryDto;
import com.oti.team2.srinformationhistory.service.ISrInformationHistoryService;
import com.oti.team2.srresource.service.ISrResourceService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/srinformation")
public class SrinformationController {

	@Autowired
	ISrinformationService srinformationService;

	@Autowired
	ISrDemandService srDemandService;

	@Autowired
	IProgressService progressService;

	@Autowired
	ISrResourceService srResourceService;

	@Autowired
	ISrInformationHistoryService srInformationHistoryService;

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-22
	 * @return sr진척 목록 조회 - 완료
	 */
	@GetMapping(value = "/list")
	public String getList(Model model, @RequestParam(value = "page", defaultValue = "1") int page,
			@ModelAttribute SrInfoFilter srInfoFilter, Authentication auth,
			@RequestParam(required = false, name = "sort") String sort,
			@RequestParam(required = false, name = "by") String by,
			@RequestParam(required = false, name = "ey") String ey,
			@RequestParam(required = false, name = "hstryId") Integer hstryId) {
		if (srInfoFilter.isMySrOnly()) {
			srInfoFilter.setEmpId(auth.getName());
		}
		model.addAttribute("sort", sort);
		model.addAttribute("by", by);
		model.addAttribute("ey", ey);
		List<Prgrs> prgrs = progressService.getRrgrs();
		
		log.info("srInfoFilter");
		log.info(srInfoFilter);
		/**************************/
		/*if(hstryId != null) {
			// 상세를 조회하는데 rownum이 같이 나온다.
			
			
			// rownum을 통해 속해있는 페이지를 가져온다.
			
			//계획과 진척을 가져온다.
		}*/
		
		
		
		
		
		
		
		/**************************/
		int totalRows = srinformationService.getTotalRow(page, srInfoFilter, auth.getAuthorities().stream().findFirst().get().toString());
		Pager pager = new Pager(11, totalRows, page);
		log.info(pager);
		// log.info(totalRows);
		if (totalRows != 0) {
			List<SrinformationList> srlist = srinformationService.getList(pager, srInfoFilter, sort, by, ey, auth.getAuthorities().stream().findFirst().get().toString());
			SrdemandDetail sd = srDemandService.getSrDemandDetail(srlist.get(0).getDmndNo());
			SrplanInformation sp = srinformationService.getPlan(srlist.get(0).getDmndNo());
			List<Dept> deptList = srinformationService.getDeptList();
			/*
			 * log.info("sd 상세 : " + sd); log.info("진척목록: " + srlist); log.info("개발부서 목록: "
			 * + deptList);
			 */
			for (int i = 0; i < srlist.size(); i++) {
				if (!((srlist.get(i).getSttsNm().equals("접수")) || (srlist.get(i).getSttsNm().equals("개발취소"))
						|| (srlist.get(i).getSttsNm().equals("반려")))) {
					for (int j = 0; j < prgrs.size(); j++) {
						if (prgrs.get(j).getSrNo().equals(srlist.get(i).getSrNo())) {
							srlist.get(i).setPrgrsRt(prgrs.get(j).getPrgrsRt());
						}
					}
				}
			}
			log.info("srlist: " + srlist);
			/*
			 * log.info("sd 상세 : " + sd); log.info("진척목록: " + srlist); log.info("개발부서 목록: "
			 * + deptList);
			 */
			model.addAttribute("sd", sd);
			model.addAttribute("sp", sp);
			model.addAttribute("srlist", srlist);
			model.addAttribute("deptList", deptList);
		}
		model.addAttribute("srInfoFilter", srInfoFilter);
		model.addAttribute("pager", pager);
		return "srInfo/srInformationList";
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-22 / 최은종 : 2023-03-13
	 * @return sr요청 상세 조회 - 완료 => 계획정보도 같이 가져와야될듯
	 */
	@ResponseBody
	@GetMapping(value = "/detail/{dmndNo}")
	public SrTotal getDetail(@PathVariable("dmndNo") String dmndNo, Authentication auth) {
		SrTotal total = null;
		int isDnumExists = 0;

		SrdemandDetail dd = srDemandService.getSrDemandDetail(dmndNo);
		SrplanInformation pi = srinformationService.getPlan(dmndNo);

		// 개발자: 내가 맡은 + sysdate<투입종료일 인 sr에 대해서만 버튼 보이게 하기 (최은종)
		String empId = auth.getName().toString();
		log.info("empId" + empId);
		List<SrResourceAddHistoryDto> drlist = srInformationHistoryService.getDmndNoBySrResouce(dmndNo, empId);
		log.info("dmndNo" + dmndNo);
		
		log.info("drlist" + drlist);
		log.info("drlist size" + drlist.size());
		
		// 개발자와 관리자별로 버튼제약 다르게 설정하기 위해 권한 보내기 (최은종)
		String role = auth.getAuthorities().stream().findFirst().get().toString();
		
		if(role.equals("ROLE_DEVELOPER")) {
			if (drlist.size() > 0) {
				isDnumExists = 1;
				// isDnumExists = drlist.indexOf(drlist.get(0));
				log.info("isDnumExists " + isDnumExists);
			} else {
				isDnumExists = 0;
			}
		} else if(role.equals("ROLE_ADMIN")) {
			isDnumExists = 1;
		}

		total = new SrTotal(dd, pi, isDnumExists, role);

		log.info("dd 목록: " + dd);
		log.info("pi 목록: " + pi);
		log.info("total 목록: " + total);
		return total;
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-23
	 * @return sr요청 계획정보 조회 - 탭 누를 때
	 */
	@ResponseBody
	@GetMapping(value = "/plan/{dmndNo}")
	public SrplanInformation getPlanInfo(@PathVariable("dmndNo") String dmndNo) {
		SrplanInformation pi = srinformationService.getPlan(dmndNo);
		log.info("pi : " + pi);
		return pi;
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 */
	@ResponseBody
	@PostMapping(value = "/plan/update")
	public void updateSrInfo(SrplanInformation srplanInfomation) {
		log.info("업데이트될 계획 정보 : " + srplanInfomation);
		srinformationService.updateSrInfo(srplanInfomation);
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * @return sr계획정보 부서 변경
	 */
	@ResponseBody
	@GetMapping(value = "/mngr/{deptCd}")
	public Manager getFlnmByDeptCd(@PathVariable("deptCd") String deptCd) {
		Manager flnm = srinformationService.getFlnmByDeptCd(deptCd);
		log.info("바뀐 담당자: " + flnm);
		return flnm;
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-13
	 * @return sr진척 목록 엑셀 다운로드
	 * @throws Exception
	 */
	@GetMapping(value = "/list/download")
	public void downloadExcel(Model model,@ModelAttribute SrInfoFilter srInfoFilter, Authentication auth,
			@RequestParam(required = true, name = "sort", defaultValue = "DESC") String sort,
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		log.info("엑셀 가자잇 ");
		if (srInfoFilter.isMySrOnly()) {
			srInfoFilter.setEmpId(auth.getName());
		}
		sort = "ASC";
		model.addAttribute("sort", sort);
		List<Prgrs> prgrs = progressService.getRrgrs();
		List<SrinformationList> srlist = srinformationService.getExcelList(srInfoFilter, sort);
		for (int i = 0; i < srlist.size(); i++) {
			if (!((srlist.get(i).getSttsNm().equals("접수")) || (srlist.get(i).getSttsNm().equals("개발취소"))
					|| (srlist.get(i).getSttsNm().equals("반려")))) {
				for (int j = 0; j < prgrs.size(); j++) {
					if (prgrs.get(j).getSrNo().equals(srlist.get(i).getSrNo())) {
						srlist.get(i).setPrgrsRt(prgrs.get(j).getPrgrsRt());
					}
				}
			}
		}
		srinformationService.SrListdownload(srlist,request,response);
	}
}