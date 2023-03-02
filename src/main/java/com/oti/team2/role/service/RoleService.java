package com.oti.team2.role.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.role.dao.IRoleDao;
import com.oti.team2.role.dto.Role;
@Service
public class RoleService implements IRoleService {
	
	@Autowired
	IRoleDao roleDao;
	/* 개발자의 역할 목록을 가져오는 메소드
	 * @Author : 안한길
	 * @Return : List<Role>
	 * */
	@Override
	public List<Role> getRoleList() {
		return roleDao.selectRoleList();
	}

}
