package com.oti.team2.srresource.dto;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;
/* 개발자의 자원정보에 사용되는 DTO
 * @author : 안한길
 * 
 * */
@Data
public class SrResourceOfDeveloper {
	private int srSrc;
	private String title;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date start;
	@JsonFormat(shape=JsonFormat.Shape.STRING,pattern="yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date end;
}
