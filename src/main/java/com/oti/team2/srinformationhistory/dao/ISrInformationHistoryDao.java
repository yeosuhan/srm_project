package com.oti.team2.srinformationhistory.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.util.pager.Pager;

public interface ISrInformationHistoryDao {

	public List<SrInformationHistory> selectHstryList(@Param("pager") Pager pager, @Param("srNo") String srNo);
	public int count();
	public SrInformationHistory selectByHstryId(int hstryId);


}
