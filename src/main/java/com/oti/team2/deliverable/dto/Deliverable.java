package com.oti.team2.deliverable.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class Deliverable {
	private int delivId;
	private int prgrsId;
	private String delivUrl;
	private String delivNm;
	private String rgtrId;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date regYmd;
	
	private String prgrsSeNm;
	private String rgtrNm;
}
