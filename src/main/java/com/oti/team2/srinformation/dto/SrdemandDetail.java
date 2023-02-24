package com.oti.team2.srinformation.dto;

import lombok.Data;

@Data
public class SrdemandDetail {
	
	//srDemand 테이블
	private String srNo;
	private String dmndNo;
	private String ttl;
	private String relGrund;
	private String dmndYmd;
	private String cmptnDmndYmd;
	private String cn;
	
	//시스템 테이블
	private String sysNm;
	
	//업무구분 테이블
	private String taskSeNm;
	
	//기관 테이블
	private String instNm;
	
	//member 테이블
	private String flnm;
	
	//첨부파일 테이블
	private String fileNm;
}
