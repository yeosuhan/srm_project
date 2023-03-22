package com.oti.team2.srinformation.dto;

import lombok.Data;

/**
 * 히스토리Id로 해당 진척이 진척목록의 몇번째에 존재하는지 조회
 * @author 신정은
 *
 */
@Data
public class SrDmndRowNum {
	int rn;
	String dmndNo;
	String srNo;
}
