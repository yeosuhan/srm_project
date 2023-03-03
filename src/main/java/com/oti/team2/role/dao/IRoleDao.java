package com.oti.team2.role.dao;

import java.util.List;

import com.oti.team2.role.dto.Role;

public interface IRoleDao {

	/* 개발자의 역할 목록을 가져오는 메소드
	 * @Author : 안한길
	 * @Return : List<Role>
	 * */
	List<Role> selectRoleList();

}
