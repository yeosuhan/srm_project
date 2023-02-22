package com.oti.team2.srinformation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.srinformation.dto.SrinformationList;

@Mapper
public interface SrinformationDao {
	
	public List<SrinformationList> selectBySrinfoList();
}
