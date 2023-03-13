package com.oti.team2.srdemand.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SrFilterDto {
	private String sysCd;
	private String taskSeCd;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date dmndYmdStart;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date dmndYmdEnd;
	private Integer sttsCd;
	private String keyWord;
}
