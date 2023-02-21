package com.oti.team2.department.dao;

import java.util.List;

import com.oti.team2.department.dto.Department;

public interface IDepartmentDao {
	public List<Department> selectDepartmentNameList();
}
