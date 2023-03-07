package com.oti.team2.deliverable.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.deliverable.dto.Deliverable;

public interface IDeliverableDao {
	/**
	 * 산출물목록 조회 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	List<Deliverable> selectByPrgrsId(String prgrsId);
	/**
	 * 산출물 추가 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	int insertDeliverable(Deliverable deliverable);
	/** 선택한 산출물 삭제
	 * @author : 안한길
	 * @param delivId
	 * @return int
	 * */
	int updateDelYn(@Param("delivIdList")List<String> delivIdList);
	/**
	 * 산출물 수정 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	int updateDeliverable(Deliverable deliverable);

}
