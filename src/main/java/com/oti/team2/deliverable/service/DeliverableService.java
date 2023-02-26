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
	public List<Deliverable> getDeliverableList(String srNo) {
		return deliverableDao.selectBySrNo(srNo);
	}

}
