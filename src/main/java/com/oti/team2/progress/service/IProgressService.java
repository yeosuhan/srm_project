package com.oti.team2.progress.service;

import java.util.List;

import com.oti.team2.progress.dto.Progress;

public interface IProgressService {
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 */
	List<Progress> getProgress(String srNo);
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-27
	 * @return sr요청 진척률 수정
	 */
	String addProgress(List<String> prgrs);

}
