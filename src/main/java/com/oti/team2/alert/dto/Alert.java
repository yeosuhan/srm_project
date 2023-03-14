package com.oti.team2.alert.dto;

import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Alert {
	private Integer altNo;
	private String altCn;
	private String rcvrId;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Timestamp trsmYmd;
	private String dmndNo;
	private Integer hstryId;
	private String altType;
	private String srNo;
	private String srInfoDmndNo;
}
