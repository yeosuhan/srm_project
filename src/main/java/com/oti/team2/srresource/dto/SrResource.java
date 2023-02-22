package com.oti.team2.srresource.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SrResource {
	private int srSrc;
	private String srNo;
	private String empId;
	private int ptcptnRoleCd;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date schdlBgngYmd;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd")
	private Date schdlEndYmd;
}
