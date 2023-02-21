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
import com.oti.team2.util.Auth;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/admin")
public class AdminContoller {
	@Autowired
	private IMemberService memberService;
	
	@Autowired
	private IJobGradeService jobGradeService;
	
	@Autowired
	private IDepartmentService departmentService;
	/*
	 * 사원 목록 페이지
	 * @author 안한길
	 * @param  page : 페이지
	 * @return 사원 목록 페이지 url
	 * */
	@RequestMapping(value = "/employeelist", method = RequestMethod.GET)
	public String getEmployeeList(@RequestParam(defaultValue="1")int page, Model model) {
		log.info("getEmployeeList");
		int totalRows=memberService.getTotalRows( Auth.DEVELOPER.toString());
		Pager pager= new Pager(totalRows,page);
		List<Member> employeesList = memberService.getMemberList( Auth.DEVELOPER.toString(), pager);
		//사원 목록 첫번째 사원 정보 사원정보 카드에 추가
		employeesList.set(0, memberService.getMember(employeesList.get(0).getMemberId(), Auth.DEVELOPER.toString()));
		//사원 정보 카드 에서 직급, 부서 선택 목록
		model.addAttribute("jobGradeList",jobGradeService.getJobGradeList());
		model.addAttribute("departmentList",departmentService.getDepartmentNameList());
		
		model.addAttribute("employeesList",employeesList);
		return "management/employeesList";
	}
	/*
	 * 사원 상세 정보
	 * @author 안한길
	 * @param  사원 아이디
	 * @return 사원 정보 
	 * */
	@ResponseBody
	@RequestMapping(value="/employee" , method=RequestMethod.GET)
	public Member getEmployeeDetail(@RequestParam()String employeeId) {
		log.info(employeeId);
		return memberService.getMember(employeeId, Auth.DEVELOPER.toString());
	}
	/*
	 * 사원 삭제
	 * @author 안한길
	 * @param  사원 아이디
	 * @return 반영 행수
	 * */
	@ResponseBody
	@RequestMapping(value="/employee/delete" , method=RequestMethod.GET)
	public int deleteEmployee(@RequestParam()String employeeId) {
		log.info(employeeId);
		return memberService.deleteMember(employeeId);
	}
	/*
	 * 사원 정보 수정
	 * @author 안한길
	 * @param  수정된 사원 정보
	 * @return 반영 행수
	 * */
	@ResponseBody
	@RequestMapping(value="/employee/modify" , method=RequestMethod.POST)
	public int modifyEmployee(Member member) {
		log.info(member);
		return memberService.modifyMember(member);
	}
}
