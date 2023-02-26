package com.oti.team2.deliverable.dao;

import java.util.List;

import com.oti.team2.deliverable.dto.Deliverable;

public interface IDeliverableDao {

	List<Deliverable> selectBySrNo(String srNo);

}
