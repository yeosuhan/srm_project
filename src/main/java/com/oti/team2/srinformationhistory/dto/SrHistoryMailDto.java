package com.oti.team2.srinformationhistory.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SrHistoryMailDto {
	private int hstryId;
	private String srNo;
	private String dmndNo;
	private String memberId;
	private String flnm;
	private String eml;
	private String hstryType;
	private String deptNm;
	private String hstryTtl;
	private String hstryCn;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date wrtYmd;
	private String hstryStts;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date cmptnDmndYmd;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date chgEndYmd;
	private String auth;
	private String authId;
}
