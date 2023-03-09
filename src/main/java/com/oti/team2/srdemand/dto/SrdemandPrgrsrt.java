package com.oti.team2.srdemand.dto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor // 모든 생성자 만들어줌
public class SrdemandPrgrsrt {
	private SrdemandDetail sd;
	private String prgrsRt;

}
