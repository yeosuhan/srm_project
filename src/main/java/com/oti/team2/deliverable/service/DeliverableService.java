package com.oti.team2.deliverable.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.deliverable.dao.IDeliverableDao;
import com.oti.team2.deliverable.dto.Deliverable;
@Service
public class DeliverableService implements IDeliverableService {

	@Autowired
	private IDeliverableDao deliverableDao;
	/**
	 * 산출물목록 조회 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	@Override
	public List<Deliverable> getDeliverableList(String prgrsId) {
		return deliverableDao.selectByPrgrsId(prgrsId);
	}
	/**
	 * 산출물 추가 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	@Override
	public int addDeliverable(Deliverable deliverable) {
		return deliverableDao.insertDeliverable(deliverable);
	}
	/** 선택한 산출물 삭제
	 * @author : 안한길
	 * @param delivId
	 * @return int
	 * */
	@Override
	public int deleteDeliverable(List<String> delivIdList) {
		if(delivIdList!=null) {
			return deliverableDao.updateDelYn(delivIdList);
		}
		return 0;
	}

	/**
	 * 산출물 수정 메서드
	 *
	 * @author 안한길
	 * @return 산출물 목록으로 리턴
	 */
	@Override
	public int modifyDeliverable(Deliverable deliverable) {
		return deliverableDao.updateDeliverable(deliverable);
	}

}
