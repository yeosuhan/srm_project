package com.oti.team2.srinformation.dto;

import lombok.Data;

@Data
public class SrInfoFilter {
	private String sysCd;
	private String taskSeCd;
	private Integer sttsCd;
	private String ttl;
	private String dmndNo;
	private boolean mySrOnly;
	private String empId;
}
