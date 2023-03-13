package com.oti.team2.srinformation.dto;

import java.util.List;

import com.oti.team2.srdemand.dto.SrdemandDetail;
import com.oti.team2.srinformationhistory.dto.MyTodoHistoryListDto;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor // 모든 생성자 만들어줌
public class SrTotal {
	private SrdemandDetail dd;
	private SrplanInformation pi;
}
