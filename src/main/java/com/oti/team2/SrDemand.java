package com.oti.team2;

import java.util.Date;

import lombok.Data;

@Data
public class SrDemand {
	private String dmndNo;
	private Date dmndYmd;
	private String custId;
	private String rvwrId;
	private String taskSeCd;
	private String ttl;
	private String cn;
	private String relGrund;
	private Date cmptnDmndYmd;
	private String sttsCd;
	private String rjctRsn;
	//조인
	private String sysNm;
	private String taskSeNm;
	private String picNm; //담당자 이름
	private Date endYmd;
	private String sttsNm;
	private String sysCd;
	//검색용
	private String keyWord;
	private Date dmndYmdStart;
	private Date dmndYmdEnd;
	
}
