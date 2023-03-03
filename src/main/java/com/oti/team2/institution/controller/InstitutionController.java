package com.oti.team2.institution.controller;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.jsoup.Jsoup;
import org.jsoup.safety.Whitelist;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.oti.team2.institution.dto.Institution;
import com.oti.team2.institution.service.IInstitutionService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
public class InstitutionController {

	@Autowired
	IInstitutionService institutionService;

	/**
	 * 
	 * @author 여수한
	 * @return 내 기관 관리(조회)
	 */
	@RequestMapping(value = "/institution/detail", method = RequestMethod.GET)
	public String myInst(Model model, HttpSession session) {
/*		String memberId = (String) session.getAttribute("memberid");
*/		
		String memberId = "client1";
		Institution inst = institutionService.getInst(memberId);
		log.info(inst);
		model.addAttribute("inst", inst);
		return "member/myInst";
	}

	/**
	 * 
	 * @author 여수한
	 * @return 기관 등록(페이지 이동)
	 */
	@RequestMapping(value = "/institution/add", method = RequestMethod.GET)
	public String addInst1() {
		return "member/addInst";
	}

	/**
	 * 
	 * @author 여수한
	 * @param InstCd1 중복된 기관코드 저장
	 * @return 기관 등록(기관 등록)
	 */
	@RequestMapping(value = "/institution/add", method = RequestMethod.POST)
	public String addInst(Institution institution, Model model) throws Exception {
		institution.setInstCd(Jsoup.clean(institution.getInstCd(), Whitelist.basic()));
		institution.setInstNm(Jsoup.clean(institution.getInstNm(), Whitelist.basic()));
		institution.setInstTelno(Jsoup.clean(institution.getInstTelno(), Whitelist.basic()));
		institution.setInstAddr(Jsoup.clean(institution.getInstAddr(), Whitelist.basic()));
		institution.setInstDetailAddr(Jsoup.clean(institution.getInstDetailAddr(), Whitelist.basic()));
		log.info(institution);
		String InstCd = institution.getInstCd();
		if (institution.getInstCd().length() > 5) {
			//기관코드 길이 체크
			model.addAttribute("result", "longInstCd");
			return "member/addInst";
		} else {
			// 기관코드 중복 체크
			try {
				log.info(institution);
				institutionService.addInst(institution);
				return "redirect:/myinfo";
			} catch (Exception e1) {
				log.info("에러발생");
				for (int i = 1; i < 100; i++) {
					String checkInstCd = InstCd + i;
					try {
						institution.setInstCd(checkInstCd);
						institutionService.addInst(institution);
						return "redirect:/myinfo";
					} catch (Exception e2) {
						continue;
					}
				}
			}
		}
		return "redirect:/myinfo";
	}

	/**
	 * 
	 * @author 여수한
	 * @return 내 기관 관리(수정)
	 */
	@RequestMapping(value = "/institution/update", method = RequestMethod.POST)
	public String myInstUpdate(Institution institution) {
		institution.setInstCd(institution.getInstCd());
		institution.setInstNm(Jsoup.clean(institution.getInstNm(), Whitelist.basic()));
		institution.setInstTelno(Jsoup.clean(institution.getInstTelno(), Whitelist.basic()));
		institution.setInstAddr(Jsoup.clean(institution.getInstAddr(), Whitelist.basic()));
		institution.setInstDetailAddr(Jsoup.clean(institution.getInstDetailAddr(), Whitelist.basic()));
		log.info(institution);
		institutionService.updateInst(institution);
		return "redirect:/myinfo";
	}	
}
