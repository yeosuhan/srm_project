package com.oti.team2.srdemand.dto;

import java.util.Date;

import lombok.Data;

@Data
public class SrDemand {
	private String dmndNo;
	private Date dmndYmd; // 요청일
	private String custId; // 고객 아이디
	private String taskSeCd;
	private String rvwrId; // 검토자 아이디
	private String ttl;
	private String cn;
	private String relGrund; // 관련 근거
	private Date cmptnDmndYmd; // 완료 요청일
	private String rjctRsn; // 반려 사유
	private String sttsCd;
	private String sysCd;
	
	//조인
	private String sysNm;
	private String taskSeNm;
	private String picNm; //담당자 이름
	private Date endYmd; // 계획 종료일
	private String sttsNm;
	
	//검색용
/*	private String keyWord;
	private Date dmndYmdStart;
	private Date dmndYmdEnd;*/
	
}
