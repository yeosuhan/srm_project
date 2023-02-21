package com.oti.team2.department.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.department.dao.IDepartmentDao;
import com.oti.team2.department.dto.Department;
@Service
public class DepartmentService implements IDepartmentService {
	@Autowired
	IDepartmentDao departmentDao;
	@Override
	public List<Department> getDepartmentNameList() {
		return departmentDao.selectDepartmentNameList();
	}

}
