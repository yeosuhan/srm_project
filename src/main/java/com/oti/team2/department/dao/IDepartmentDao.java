package com.oti.team2.department.dao;

import java.util.List;

import com.oti.team2.department.dto.Department;

public interface IDepartmentDao {

	/*
	 * 부서 이름 목록
	 * @author 안한길
	 * @return 부서 이름 목록
	 * */
	public List<Department> selectDepartmentNameList();
}
