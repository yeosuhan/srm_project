package com.oti.team2.member.dto;

import com.oti.team2.department.dto.Department;
import com.oti.team2.jobGrade.dto.JobGrade;

import lombok.Data;

@Data
public class Member {
	private String memberId;
	private String pswd;
	private String flnm;
	private String addr;
	private String telNo;
	private String eml;
	private String instCd;
	private String jbgdCd;
	private String deptCd;
	private String memberType;
	private String fileType;
	private byte[] fileData;

	/*테이블에 없는 컬럼*/
	private JobGrade jobGrade;
	private Department department;
}
