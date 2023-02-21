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
	
	/*
	 * 부서 이름 목록
	 * @author 안한길
	 * @return 부서 이름 목록
	 * */
	@Override
	public List<Department> getDepartmentNameList() {
		return departmentDao.selectDepartmentNameList();
	}

}
