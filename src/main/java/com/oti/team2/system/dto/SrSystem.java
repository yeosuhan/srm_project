package com.oti.team2.system.dto;
import lombok.Data;

@Data
/**
 * sr요청 등록 시, 시스템 목록 객체 전달 시 사용됨
 * @author 신정은
 *
 */
public class SrSystem {
	private String sysCd;
	private String sysNm;
}
