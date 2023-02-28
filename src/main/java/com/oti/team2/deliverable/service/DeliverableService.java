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
	
	@Override
	public List<Deliverable> getDeliverableList(String prgrsId) {
		return deliverableDao.selectByPrgrsId(prgrsId);
	}

	@Override
	public int addDeliverable(Deliverable deliverable) {
		return deliverableDao.insertDeliverable(deliverable);
	}

	@Override
	public int deleteDeliverable(List<String> delivIdList) {
		if(delivIdList!=null) {
			return deliverableDao.updateDelYn(delivIdList);
		}
		return 0;
	}

}
