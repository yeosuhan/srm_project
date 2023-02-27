package com.oti.team2.deliverable.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.deliverable.dto.Deliverable;

public interface IDeliverableDao {

	List<Deliverable> selectByPrgrsId(String prgrsId);

	int insertDeliverable(Deliverable deliverable);

	int updateDelYn(@Param("delivIdList")List<String> delivIdList);

}
