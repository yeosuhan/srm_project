package com.oti.team2.progress.service;

import com.oti.team2.progress.dto.Progress;

public interface IProgressService {
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 */
	Progress getProgress(String dmndNo);

}
