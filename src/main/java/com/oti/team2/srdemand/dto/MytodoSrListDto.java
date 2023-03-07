package com.oti.team2.srdemand.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class MytodoSrListDto {
	private String dmndNo;
	private String sysNm;
	private String taskNm;
	private String ttl;
	private String picNm;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date cmptnDmndYmd;
	private String sttsNm;
	private int sttsCd;
	private String srNo;
	private String rnk;
}
