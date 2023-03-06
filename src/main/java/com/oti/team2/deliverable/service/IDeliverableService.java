package com.oti.team2.deliverable.service;

import java.util.List;

import com.oti.team2.deliverable.dto.Deliverable;

public interface IDeliverableService {
	/**
	 * 산출물목록 조회 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	List<Deliverable> getDeliverableList(String prgrsId);
	/**
	 * 산출물 추가 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	int addDeliverable(Deliverable deliverable);
	/** 선택한 산출물 삭제
	 * @author : 안한길
	 * @param delivId
	 * @return int
	 * */
	int deleteDeliverable(List<String> delivIdList);
	/**
	 * 산출물 수정 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	int modifyDeliverable(Deliverable deliverable);

}
