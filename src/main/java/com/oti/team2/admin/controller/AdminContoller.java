package com.oti.team2.admin.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.department.service.IDepartmentService;
import com.oti.team2.jobGrade.service.IJobGradeService;
import com.oti.team2.member.dto.Member;
import com.oti.team2.member.service.IMemberService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/admin")
public class AdminContoller {
	@Autowired
	IMemberService memberService;
	
	@Autowired
	IJobGradeService jobGradeService;
	
	@Autowired
	IDepartmentService departmentService;
	
	@RequestMapping(value = "/employeelist", method = RequestMethod.GET)
	public String getEmployeeList(@RequestParam(defaultValue="1")int page, Model model) {
		log.info("getEmployeeList");
		int totalRows=memberService.getTotalRows("DEVELOPER");
		Pager pager= new Pager(totalRows,page);
		List<Member> employeesList = memberService.getMemberList("DEVELOPER", pager);
		
		employeesList.set(0, memberService.getMember(employeesList.get(0).getMemberId(),"DEVELOPER"));
		model.addAttribute("jobGradeList",jobGradeService.getJobGradeList());
		model.addAttribute("departmentList",departmentService.getDepartmentNameList());
		
		model.addAttribute("employeesList",employeesList);
		return "management/employeesList";
	}
	
	@ResponseBody
	@RequestMapping(value="/employee" , method=RequestMethod.GET)
	public Member getEmployeeDetail(@RequestParam()String employeeId) {
		log.info(employeeId);
		return memberService.getMember(employeeId, "DEVELOPER");
	}
}
