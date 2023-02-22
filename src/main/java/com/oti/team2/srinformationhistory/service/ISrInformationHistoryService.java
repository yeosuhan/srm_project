package com.oti.team2.srinformationhistory.service;

import java.util.List;

import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.util.pager.Pager;

public interface ISrInformationHistoryService {

	public List<SrInformationHistory> getSrInformationHistoryList(Pager pager, String srNo);
	public int getTotalRows();
	public SrInformationHistory getSrInformationHistory(int hstryId);
	public int updateSrInformationHistory();
}
