package com.oti.team2.srinformationhistory.service;

import java.util.List;

import com.oti.team2.srinformationhistory.dto.MyTodoHistoryListDto;
import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.srinformationhistory.dto.SrResourceAddHistoryDto;
import com.oti.team2.util.pager.Pager;

public interface ISrInformationHistoryService {

	/**
	 * SR처리 히스토리 내역 조회 메서드
	 * 
	 * @author 최은종
	 */
	public List<SrInformationHistory> getSrInformationHistoryList(Pager pager, String srNo);

	public List<SrInformationHistory> getSrInformationHistoryListForClient(String srNo, Pager pager, String role);

	/**
	 * SR처리 히스토리 목록 페이징을 위한 메서드
	 * 
	 * @author 최은종
	 */
	public int getCountAllForEmp(String srNo);
	public int getCountAllForClient(String srNo);

	/**
	 * SR처리 히스토리 상세 조회 메서드
	 * 
	 * @author 최은종
	 */
	public SrHistoryDetailDto getSrInformationHistory(int hstryId);

	/**
	 * 히스토리 조회시 권한에 따라 sr요청번호를 다르게 보여 주기 위한 메서드
	 * 
	 * @author 최은종
	 */
	public String getSrNo(String dmndNo);

	/**
	 * SR 히스토리 등록& 요청 결재를 위한 insert 메서드
	 * 
	 * @author 최은종
	 */
	public void addSrInformationHistory(SrInformationHistory srInformationHistory, String role);

	/**
	 * SR 히스토리 수정을 위한 update 메서드
	 * 
	 * @author 최은종
	 * 
	 */
	public void updateHstry(SrInformationHistory srInformationHistory);

	/**
	 * 나의 할 일에서의 히스토리 목록 조회 메서드
	 * 
	 * @author 최은종
	 */
	public List<MyTodoHistoryListDto> getHstryTodoByPicId(Pager pager, String picId);

	public List<MyTodoHistoryListDto> getHstryTodoByEmpId(Pager pager, String rqstrId, String empId);

	public List<MyTodoHistoryListDto> getHstryTodoByCustId(Pager pager, String custId);

	/**
	 * 개발자 : 내가 자원으로 들어가있고 투입종료 이전일 때만 sr요청 버튼 보이게 하기 위한 메서드
	 * 
	 * @author 최은종
	 */
	public List<SrResourceAddHistoryDto> getDmndNoBySrResouce(String dmndNo, String empId);
	
	/**
	 * 나의 할 일에서 히스토리 목록 페이징 메서드
	 * 
	 * @author 최은종
	 */
	public int getCountTodoForAdmin(String picId);
	public int getCountTodoForDev(String rqstrId, String empId);
	public int getCountTodoForCust(String custId);

}