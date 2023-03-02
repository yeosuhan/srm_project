package com.oti.team2.role.service;

import java.util.List;

import com.oti.team2.role.dto.Role;

public interface IRoleService {

	/* 개발자의 역할 목록을 가져오는 메소드
	 * @Author : 안한길
	 * @Return : List<Role>
	 * */
	public List<Role> getRoleList();

}
