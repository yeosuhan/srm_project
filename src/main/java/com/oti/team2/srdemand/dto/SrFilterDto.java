package com.oti.team2.srdemand.dto;

import lombok.Data;

@Data
public class SrFilterDto {
	private String sysCd;
	private String taskSeCd;
	//@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private String dmndYmdStart;
	//@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private String dmndYmdEnd;
	private Integer sttsCd;
	private String keyWord;
	private Integer hstryId;
}
