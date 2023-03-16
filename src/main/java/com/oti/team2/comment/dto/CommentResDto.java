package com.oti.team2.comment.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.oti.team2.util.pager.Pager;

import lombok.Data;

@Data
public class CommentResDto {
	private int bbsNo;
	private int cmntNo;
	private String cmntCn;
	private String wrtrNm;
	private String wrtrId;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date wrtYmd;
}
