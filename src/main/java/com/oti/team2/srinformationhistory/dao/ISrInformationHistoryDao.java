package com.oti.team2.srinformationhistory.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srinformationhistory.dto.MyTodoHistoryListDto;
import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.util.pager.Pager;

public interface ISrInformationHistoryDao {

	/**
	 * SR처리 히스토리 내역 조회 메서드
	 * 
	 * @author 최은종
	 */
	public List<SrInformationHistory> selectBySrNo(@Param("pager") Pager pager, @Param("srNo") String srNo);
	
	public List<SrInformationHistory> selectForClientBySrNo(@Param("srNo") String srNo, @Param("pager") Pager pager);

	/**
	 * SR처리 히스토리 목록 페이징을 위한 메서드
	 * 
	 * @author 최은종
	 */
	public int countAllForEmp(@Param("srNo") String srNo);
	public int countAllForClient(@Param("srNo") String srNo);
	/**
	 * SR처리 히스토리 상세 조회 메서드
	 * 
	 * @author 최은종
	 */
	public SrHistoryDetailDto selectByHstryId(@Param("hstryId") int hstryId);

	/**
	 * SR처리 히스토리 등록 메서드 
	 * 
	 * @author 최은종
	 */
	public void insertSrHistory(SrInformationHistory srInformationHistory);
	
	/**
	 * SR처리 히스토리 상태 업데이트 메서드
	 * 
	 * @author 최은종
	 */
	public void updateHstryStts(@Param("hstryId") int hstryId, @Param("hstryStts") String hstryStts);

	/**
	 * SR처리 히스토리 수정 메서드
	 * 
	 * @author 최은종
	 */
	public int updateHstry(SrInformationHistory srInformationHistory);
	
	/**
	 * 나의 할 일에서 히스토리 목록 조회 메서드
	 * 
	 * @author 최은종
	 */
	public List<MyTodoHistoryListDto> selectHstryTodoByPicId(@Param("pager") Pager pager, @Param("picId") String picId);
	public List<MyTodoHistoryListDto> selectHstryTodoByEmpId(@Param("pager") Pager pager, @Param("rqstrId") String rqstrId, @Param("empId") String empId);
	public List<MyTodoHistoryListDto> selectHstryTodoByCustId(@Param("pager") Pager pager, @Param("custId") String custId);
	
	/**
	 * 나의 할 일에서 히스토리 목록 페이징 메서드
	 * 
	 * @author 최은종
	 */
	public int countTodoForAdmin(@Param("picId") String picId);
	public int countTodoForDev(@Param("rqstrId") String rqstrId, @Param("empId") String empId);
	public int countTodoForCust(@Param("custId") String custId);
	
	/**
	 * 개발자 : 내가 자원으로 들어가있고 투입종료 이전일 때만 sr요청 버튼 보이게 하기 위한 메서드
	 * 
	 * @author 최은종
	 */
	public List<MyTodoHistoryListDto> selectDmndNoBySrResouce(@Param("dmndNo") String dmndNo, @Param("empId") String empId);
}