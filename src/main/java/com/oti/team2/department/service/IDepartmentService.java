package com.oti.team2.department.service;

import java.util.List;

import com.oti.team2.department.dto.Department;

public interface IDepartmentService {
	
	/*
	 * 부서 이름 목록
	 * @author 안한길
	 * @return 부서 이름 목록
	 * */
	public List<Department> getDepartmentNameList();
}
