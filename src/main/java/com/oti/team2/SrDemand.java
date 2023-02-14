package com.oti.team2;

import java.util.Date;

import lombok.Data;

@Data
public class SrDemand {
	private String dmndNo;
	private Date dmndYmd;
	private String custId;
	private String rvwrId;
	private String taskSeCd;
}
