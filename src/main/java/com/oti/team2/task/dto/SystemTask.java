package com.oti.team2.task.dto;

import lombok.Data;

@Data
/**
 * sr요청 등록 시, 선택된 시스템에 해당되는 업무구분 데이터 전달을 위함
 * @author 신정은
 *
 */
public class SystemTask {
	private String taskSeCd;
	private String taskSeNm;
	
}
