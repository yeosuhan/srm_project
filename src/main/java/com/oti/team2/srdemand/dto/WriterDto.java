package com.oti.team2.srdemand.dto;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

/**
 * SR 요청 등록 시에, 기본적으로 입력되야하는 작성자 이름, 기관 이름을 전달한 객체
 * @author 신정은
 *
 */
@Getter
@Setter
@ToString
@AllArgsConstructor
public class WriterDto {
	private String memberId;
	private String memberName;
	private String instName;
}
