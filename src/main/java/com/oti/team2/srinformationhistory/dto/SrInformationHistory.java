package com.oti.team2.srinformationhistory.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SrInformationHistory {
	private int hstryId;
	private String srNo;
	private String hstryTtl;
	private String hstryCn;
	private Date wrtYmd;
	private String hstryStts;
	private Date chgEndYmd;
}
