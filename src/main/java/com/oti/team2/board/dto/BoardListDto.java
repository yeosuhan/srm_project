package com.oti.team2.board.dto;

import java.sql.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Data
public class BoardListDto {
	/// 리스트용 dto 만들어~~~~~~~~~~~~~
	private int bbsNo;
	private String bbsTtl;
	private boolean ansYn;
	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd", timezone = "Asia/Seoul")
	private Date wrtYmd;
	private String wrtNm;
}
