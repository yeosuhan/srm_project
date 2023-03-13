package com.oti.team2.progress.service;

import java.util.List;

import com.oti.team2.progress.dto.Prgrs;
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
	 * 작성일자 : 2023-02-28
	 * @return sr요청 진척률 수정
	 */
	String updateProgress(int prgrsRt, String bgngYmd, String endYmd, int prgrsId, String srNo, String prgrsSeNm);

	/**
	 * 진척데이터 삽입
	 * @author 신정은
	 */
	void addProgress(String srNo, List<String> pNames);
	/**
	 * 반영요청 진척률 조회
	 * @author 여수한
	 */
	String getPrgrsRt(String dmNo);
	/**
	 * 고객이 반영요청 수락하면 운영반영 넣기
	 * @author 여수한
	 */
	void endProgress(String dmNo);
	/**
	 * 진척목록의 진척률 조회
	 * @author 여수한
	 */
	List<Prgrs> getRrgrs();
}
