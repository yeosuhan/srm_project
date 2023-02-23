package com.oti.team2.srresource.dto;
/*https://clsrn4561.tistory.com/15 : post방식으로 date값을 전달시 sql.date를 사용해야한다.*/
import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonAutoDetect;
import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
@JsonAutoDetect
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
