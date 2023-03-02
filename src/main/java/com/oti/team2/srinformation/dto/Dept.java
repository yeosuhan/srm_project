package com.oti.team2.srinformation.dto;

import lombok.Data;

@Data
public class Dept {
	private String deptCd;
	private String deptNm;

	/*@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date bgngYmd;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date endYmd;
	private String rvwCn;*/
}
