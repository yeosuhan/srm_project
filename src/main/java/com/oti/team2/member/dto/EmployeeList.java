package com.oti.team2.member.dto;

import java.util.List;

import com.oti.team2.srresource.dto.SrResourceOfDeveloper;

import lombok.Data;
/* 자원정보 추가에서의 개발자 리스트 dto
 * @author : 안한길
 * */
@Data
public class EmployeeList {
	private List<Developer> developers;
	private List<SrResourceOfDeveloper> schedule;
}
