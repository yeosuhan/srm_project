package com.oti.team2.deliverable.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class Deliverable {
	private int delivId;
	private int prgrsId;
	private String delivUrl;
	private String delivNm;
	private String rgtrId;
	private Date regYmd;
	private String flnm;
	private String prgrsNm;
	
	private String prgrsSeNm;
	private String rgtrNm;
}
