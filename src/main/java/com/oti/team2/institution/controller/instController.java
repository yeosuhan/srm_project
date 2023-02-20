package com.oti.team2.institution.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class instController {
	
	@RequestMapping(value = "/institution/add", method = RequestMethod.GET)
	public String addInst(Locale locale, Model model) {
		return "member/addInst";
	}

	@RequestMapping(value = "/institution/add", method = RequestMethod.POST)
	public String addInst( Model model) {
		return "redirect:/myinfo";
	}
	@RequestMapping(value = "/institution", method = RequestMethod.GET)
	public String myInst(Locale locale, Model model) {
		return "member/myInst";
	}
	@RequestMapping(value = "/institution/update", method = RequestMethod.POST)
	public String myInstUpdate(Locale locale, Model model) {
		return "redirect:/myinfo";
	}
}
