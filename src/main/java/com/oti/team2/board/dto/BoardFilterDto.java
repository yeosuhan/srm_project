package com.oti.team2.board.dto;

import lombok.Data;

@Data
public class BoardFilterDto {
	private String dmndYmdStart;
	private String dmndYmdEnd;
	private Integer ansYn;
	private String wrtrNm;
	private String keyWord;
	private String type;
}
