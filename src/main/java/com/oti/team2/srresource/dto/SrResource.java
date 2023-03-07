package com.oti.team2.srresource.dto;
/*https://clsrn4561.tistory.com/15 : post방식으로 date값을 전달시 sql.date를 사용해야한다.*/
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class SrResource {
	private Integer srSrc;
	private String srNo;
	private String empId;
	private String empNm;
	private Integer ptcptnRoleCd;
	private String ptcptnRoleNm;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date schdlBgngYmd;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date schdlEndYmd;
}
