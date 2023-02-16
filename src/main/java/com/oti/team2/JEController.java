package com.oti.team2;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
@Controller
public class JEController {
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Locale locale, Model model) {		
		return "member/login";
	}
	
	@RequestMapping(value = "/join1", method = RequestMethod.GET)
	public String join1(Locale locale, Model model) {		
		return "member/join-client";
	}
	
	@RequestMapping(value = "/join2", method = RequestMethod.GET)
	public String join2(Locale locale, Model model) {		
		return "member/join-employee";
	}
	
	@RequestMapping(value = "/myinfo", method = RequestMethod.GET)
	public String myinfo(Locale locale, Model model) {		
		return "member/myinfo";
	}
	
	@RequestMapping(value = "/myTodo", method = RequestMethod.GET)
	public String myTodo(Locale locale, Model model) {		
		return "member/my-todo";
	}
	
	@RequestMapping(value = "/addInst", method = RequestMethod.GET)
	public String addInst(Locale locale, Model model) {		
		return "member/addInst";
	}
	
	
	@RequestMapping(value = "/noticeList", method = RequestMethod.GET)
	public String home1(Locale locale, Model model) {		
		return "board/noticeList";
	}
	
	@RequestMapping(value = "/notice-detail", method = RequestMethod.GET)
	public String home2(Locale locale, Model model) {		
		return "board/notice-detail";
	}
	
	@RequestMapping(value = "/notice-write", method = RequestMethod.GET)
	public String home3(Locale locale, Model model) {		
		return "board/notice-write";
	}
	
	@RequestMapping(value = "/notice-update", method = RequestMethod.GET)
	public String nupdate(Locale locale, Model model) {		
		return "board/notice-update";
	}
	
	@RequestMapping(value = "/qnaList", method = RequestMethod.GET)
	public String home4(Locale locale, Model model) {		
		return "board/qnaList";
	}
	
	@RequestMapping(value = "/qna-detail", method = RequestMethod.GET)
	public String home5(Locale locale, Model model) {		
		return "board/qna-detail";
	}
	
	@RequestMapping(value = "/qna-write", method = RequestMethod.GET)
	public String home6(Locale locale, Model model) {		
		return "board/qna-write";
	}
	
	@RequestMapping(value = "/qna-update", method = RequestMethod.GET)
	public String qupdate(Locale locale, Model model) {		
		return "board/qna-update";
	}
	
	
	
	
	
	
}
