package com.oti.team2;

import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * Handles requests for the application home page.
 */
@Controller
public class exampleController {

	private static final Logger logger = LoggerFactory.getLogger(exampleController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/example", method = RequestMethod.GET)
	public String home(HttpSession session, Model model, @RequestParam(defaultValue = "1") int role) {
		session.removeAttribute("role");
		session.setAttribute("role", role);
		return "example";
	}
	//은종
	@RequestMapping(value = "/clientslist", method = RequestMethod.GET)
	public String clientsList(Locale locale, Model model) {
		return "management/clientsList";
	}

	@RequestMapping(value = "/employeeslist", method = RequestMethod.GET)
	public String employeesList(Locale locale, Model model) {
		return "management/employeesList";
	}

	@RequestMapping(value = "/departmentslist", method = RequestMethod.GET)
	public String departmentsList(Locale locale, Model model) {
		return "management/departmentsList";
	}

	// 정은
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

	@RequestMapping(value = "/myportal", method = RequestMethod.GET)
	public String myTodo(Locale locale, Model model) {
		return "member/my-todo";
	}

	@RequestMapping(value = "/addinst", method = RequestMethod.GET)
	public String addInst(Locale locale, Model model) {
		return "member/addInst";
	}

	@RequestMapping(value = "/noticelist", method = RequestMethod.GET)
	public String noticeList(Locale locale, Model model) {
		return "board/noticeList";
	}

	@RequestMapping(value = "/noticedetail", method = RequestMethod.GET)
	public String noticedetail(Locale locale, Model model) {
		return "board/notice-detail";
	}

	@RequestMapping(value = "/noticewrite", method = RequestMethod.GET)
	public String noticewrite(Locale locale, Model model) {
		return "board/notice-write";
	}

	@RequestMapping(value = "/noticeupdate", method = RequestMethod.GET)
	public String nupdate(Locale locale, Model model) {
		return "board/notice-update";
	}

	@RequestMapping(value = "/qnalist", method = RequestMethod.GET)
	public String qnaList(Locale locale, Model model) {
		return "board/qnaList";
	}

	@RequestMapping(value = "/qnadetail", method = RequestMethod.GET)
	public String qnadetail(Locale locale, Model model) {
		return "board/qna-detail";
	}

	@RequestMapping(value = "/qnawrite", method = RequestMethod.GET)
	public String qnawrite(Locale locale, Model model) {
		return "board/qna-write";
	}

	@RequestMapping(value = "/qnaupdate", method = RequestMethod.GET)
	public String qupdate(Locale locale, Model model) {
		return "board/qna-update";
	}

	// 한길
	@RequestMapping(value = "/srdemandList", method = RequestMethod.GET)
	public String srDemandList(Model model) {
		return "srDemand/srDemandList";
	}
	@ResponseBody
	@RequestMapping(value = "/srsearch" , method = RequestMethod.POST )
	public String srSearch(@RequestBody SrDemand srDemand) {
		//System.out.println(srDemand);
		logger.info(srDemand.toString());
		return "success";
	}

	// 나
	@RequestMapping(value = "/srinformationList", method = RequestMethod.GET)
	public String srInformationList(Model model) {
		return "srInfo/srInformationList";
	}
}
