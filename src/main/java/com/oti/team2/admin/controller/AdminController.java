package com.oti.team2.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.institution.dto.Institution;
import com.oti.team2.institution.service.IInstitutionService;
import com.oti.team2.member.dto.Member;
import com.oti.team2.member.service.IMemberService;
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/admin")
public class AdminController {

	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IInstitutionService institutionService;

	/**
	 관리자의 고객 목록 조회
	 *@author : 신정은
	 *작성일자 : 2023.02.20
	 * @param model
	 * @return
	 */
	@GetMapping("/clientlist")
	public String getMemberList(Model model) {
		int totalRows = memberService.getTotalRows(Auth.CLIENT.toString());
		Pager pager = new Pager(totalRows, 1);
		log.info(pager);
		
		// 목록 가져오기
		List<Member> clientList = memberService.getMemberList(Auth.CLIENT.toString(), pager);
		model.addAttribute("clientList", clientList);
		//log.info(clientList);
		// 상세 가져오기
		Member client = memberService.getMember(clientList.get(0).getMemberId(), Auth.CLIENT.toString());
		log.info(client);
		model.addAttribute("client", client);
		return "management/clientList";
	}
	
	/**
	 * 
	 *@author : 신정은
	 * @param cid : 고객 목록보기에서 전달되는 고객의 id
	 * 작성일자 : 2023.02.20
	 * @return
	 */
	@ResponseBody
	@GetMapping("/client/{cid}")
	public Member getClient(@PathVariable("cid")String cid) {
		Member cl = memberService.getMember(cid, Auth.CLIENT.toString());
		log.info(cl);
		return cl;
	}
	
	
}
