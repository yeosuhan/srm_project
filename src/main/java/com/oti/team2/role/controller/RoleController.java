package com.oti.team2.role.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.role.dto.Role;
import com.oti.team2.role.service.IRoleService;

import lombok.extern.log4j.Log4j2;
@Log4j2
@Controller
public class RoleController {
	@Autowired
	private IRoleService roleService;
	/* 개발자의 역할 목록을 가져오는 메소드
	 * @Author : 안한길
	 * @Return : List<Role>
	 * */
	@ResponseBody
	@RequestMapping(value = "/roles", method = RequestMethod.GET)
	public List<Role> getRoleList() {
		log.info("");
		List<Role> roleList = roleService.getRoleList();
		log.info(roleList);
		//return roleService.getRoleList();
		return roleList;
	}
}
