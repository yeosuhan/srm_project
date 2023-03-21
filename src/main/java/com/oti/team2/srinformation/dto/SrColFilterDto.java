package com.oti.team2.srinformation.dto;

import lombok.Data;

@Data
public class SrColFilterDto {
	private String srNo;
	private Integer srNoOrderBy;
	
	private String bgnbYmd;
	private Integer bgnbYmdOrderBy;
	
	private String endYmd;
	private Integer endYmdOrderBy;
}
