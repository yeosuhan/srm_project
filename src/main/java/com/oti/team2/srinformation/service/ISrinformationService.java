package com.oti.team2.srinformation.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oti.team2.board.dto.SRKeyDto;
import com.oti.team2.srdemand.dto.SdApprovalDto;
import com.oti.team2.srinformation.dto.Dept;
import com.oti.team2.srinformation.dto.Manager;
import com.oti.team2.srinformation.dto.SrDmndRowNum;
import com.oti.team2.srinformation.dto.SrInfoFilter;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInformation;
import com.oti.team2.util.pager.Pager;

public interface ISrinformationService {
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-22
	 * @param srInfoFilter
	 * @param pager
	 * @param role 
	 * @param by 
	 * @param ey 
	 * @return sr진척 목록 조회
	 */
	List<SrinformationList> getList(Pager pager, SrInfoFilter srInfoFilter, String sort, String role, String ey, String by);

	/**
	 * @author 여수한 작성일자 : 2023-03-02
	 * @return 개발부서 조회
	 */
	List<Dept> getDeptList();

	/**
	 * @author 여수한 작성일자 : 2023-02-23
	 * @return sr진척 계획정보 조회
	 */
	SrplanInformation getPlan(String Plan);

	/**
	 * 관리자의 sr요청 승인 시 -> srInformation에 insert하기
	 * 
	 * @author 신정은
	 */
	public void insertInformation(SdApprovalDto sdApprovalDt);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * 
	 * @return sr계획정보 부서의 담당자 조회
	 */
	Manager getFlnmByDeptCd(String deptCd);

	/**
	 * 
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * 
	 * @return sr계획정보 부서 변경
	 */
	void updateSrInfo(SrplanInformation srplanInfomation);

	/*
	 * 페이징 처리를 위한 전체 행수 조회
	 * 
	 * @author 안한길 작성일자 : 2023-03-06
	 * 
	 * @return 결과 행수
	 */
	int getTotalRow(int page, SrInfoFilter srInfoFilter, String role);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-03
	 * @return 개발취소시 sr정보 진행여부 false(0)으로 수정
	 */
	void updatePrgrsBySrNo(String srNo);
	
	/**
	 * 고객이 문의글 작성 시 : 자신의 모든 진척-요청번호를 보여주기 위함
	 * @author 신정은
	 */
	List<SRKeyDto> getSrNoAndDmndNo(String clientID);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-09
	 * @return SR진척 계획 종료일 update
	 */
	void endYmd(String dmndNo);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-13
	 * @return sr진척 목록 엑셀 다운로드 목록 조회
	 */
	List<SrinformationList> getExcelList(SrInfoFilter srInfoFilter, String sort);
	
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-13
	 * @return sr진척 목록 엑셀 다운로드
	 * @throws Exception 
	 */
	void downloadExcel(List<SrinformationList> srlist, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	/*
	 * 해당 관리자가 담당하는 가장 최근의 요청에대한 진척번호 조회
	 * @author 신정은
	 */
	String getMaxSrNo(String picId);

	
	void SrListdownload(List<SrinformationList> srlist, HttpServletRequest request, HttpServletResponse response) throws Exception;

	void updateEndYmdBySrNo(String srNo);
	
	/**
	 * 히스토리id 클릭시 해당 진척상세가 몇번째 인지 조회하기 
	 *  @author 신정은
	 */
	public SrDmndRowNum getRownumByHstryId(int hstryId);
	/*
	 * 요청반영 알림 클릭시 해당 진척 상세가 몇번째 인지 조회
	 * @author 안한길
	 * */
	public SrDmndRowNum getRownumByDmndNo(String dmndNoToHstry);
}