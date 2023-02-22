package com.oti.team2.member.dto;

import java.util.List;

import com.oti.team2.department.dto.Department;
import com.oti.team2.institution.dto.Institution;
import com.oti.team2.jobgrade.dto.JobGrade;
import com.oti.team2.srresource.dto.SrResourceOfDeveloper;

import lombok.Data;
/* 자원정보 추가에서의 개발자 dto
 * @author : 안한길
 * */
@Data
public class Developer {
	private String empId;
	private String flnm;
	private List<SrResourceOfDeveloper> srResourceByEmpId;
}
