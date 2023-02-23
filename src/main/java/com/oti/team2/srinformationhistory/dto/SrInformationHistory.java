package com.oti.team2.srinformationhistory.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SrInformationHistory {
	private int hstryId;
	private String srNo;
	private String hstryTtl;
	private String hstryCn;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date wrtYmd;
	private String hstryStts;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd",timezone="Asia/Seoul")
	private Date chgEndYmd;
}
