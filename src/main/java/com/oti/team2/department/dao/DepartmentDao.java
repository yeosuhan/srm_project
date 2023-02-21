package com.oti.team2.department.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.department.dto.Department;

@Mapper
public interface DepartmentDao {
	/**
	 * 부서목록 조회 메서드
	 * 
	 * @author 최은종
	 */
	public List<Department> selectDeptList();

	/**
	 * 신규부서 등록 메서드
	 * 
	 * @author 최은종
	 */
	public int insertDept(@Param("department") Department department);

	/**
	 * 부서정보 수정 메서드
	 * 
	 * @author 최은종
	 */
	public int updateDept(@Param("department") Department department);

	/**
	 * 부서정보 삭제 메서드
	 * 
	 * @author 최은종
	 */
	public int deleteDept(String deptCd);
}
