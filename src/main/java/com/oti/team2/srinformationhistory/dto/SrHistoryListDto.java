package com.oti.team2.srinformationhistory.dto;

import java.util.List;

import org.springframework.security.core.Authentication;

import com.oti.team2.util.pager.Pager;

import lombok.Data;

@Data
public class SrHistoryListDto {
	private List<SrInformationHistory> srInformationHistory;
	private Pager pager;
	//private String auth;
}
