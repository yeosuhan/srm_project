package com.oti.team2.srinformationhistory.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MyTodoHistoryListDto {
	private String dmndNo;
	private int hstryId;
	private String srNo;
	private String hstryTtl;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date wrtYmd; // 히스토리 작성일
	private String hstryStts;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date chgEndYmd; // 변경될 완료일(=요청한 변경일)
	private String hstryType;
	private String rqstrId;
	private String picId; // 개발 담당자
	private String empId;
	private String custId;
	private String flnm;
	private String sysNm;
	private String deptNm;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date schdlEndYmd; // 자원 투입종료일
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date cmptnDmndYmd; // 기존 완료요청일
	private String authRole;
	private String authId;
}
