package com.oti.team2.srdemand.controller;

<<<<<<<HEAD

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.institution.service.IInstitutionService;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.WriterDto;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.util.Auth;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/srdemand")
public class SrDemandController {

	@Autowired
	private IInstitutionService institutionService;

	@Autowired
	private ISrDemandService srdemandService;

	/**
	 * sr요청 작성 시 , 작성자의 아이디, 이름, 소속기관 이름을 세팅하기 위함
	 * 
	 * @author 신정은
	 * 
	 */
	@ResponseBody
	@GetMapping("/add")
	public WriterDto addSrDemand(HttpSession session) {
		log.info("기본정보 세팅");
		// 세션에서 사용자의 이름을 가져와야 됨.
		String userId = "client2";
		String user = "고객2";

		String instName = institutionService.getInst(userId).getInstNm();
		WriterDto writerDto = new WriterDto(userId, user, instName);
		log.info(writerDto);
		return writerDto;
	}

	/**
	 * sr요청 등록
	 * 
	 * @author 신정은
	 */
	@PostMapping("/add")
	public String postSrDemand(SrRequestDto srRequest) {
		srRequest.setDmndNo("SR-TEST-3");
		log.info(srRequest);
		srdemandService.addSrDemand(srRequest);
		return "redirect:/srdemand/list";
	}

	/**
	 * 고객/관리자별 요청 목록 조회 기능 ********************************수정필요
	 * 
	 * @author 신정은
	 */
	@GetMapping("/list")
	public String getSrDemaneList(HttpSession session, Model model) {
		// 고객인 경우
		String auth = Auth.CLIENT.toString();
//		String auth = Auth.ADMIN.toString();

		if (auth.equals(Auth.CLIENT.toString())) {

			return "srDemand/userSrDemandList";
		}

		// 관리자인 경우

		return "srDemand/adminSrDemandList";
	}

	@GetMapping("/modify")
	public String updateSrDemand(String dmndNo) {
		// sr요청이 아직 요청단계인 경우에만 수정 가능하다.
		//  진행단계 확인하는 코드 
		
		// 기존 작성 데이터 제공
		
		// 수정 진행
		return "";
	}
	
	/**
	 * 
	 * 
	 * @author 최은종 / 테스트용
	 * @param model
	 * @return
	 */
	@GetMapping("/list")
		public String getSrDemandList(Model model) {
			log.info("srDemandList 조회");
			
			model.addAttribute("srNo", "WOR-SR-0001");
			log.info(model.getAttribute("srNo"));
			return "srDemand/userSrDemandList";
	}
	
}
