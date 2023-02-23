package com.oti.team2.srresource.dto;

import java.util.Date;

import lombok.Data;
/* 개발자의 자원정보에 사용되는 DTO
 * @author : 안한길
 * 
 * */
@Data
public class SrResourceOfDeveloper {
	private int srSrc;
	private String title;
	private Date start;
	private Date end;
}
