package com.oti.team2.srdemand.service;

import java.io.IOException;
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srdemand.dto.MytodoSrListDto;
import com.oti.team2.srdemand.dto.SdApprovalDto;
import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrFilterDto;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.SrdemandDetail;
import com.oti.team2.util.pager.Pager;

public interface ISrDemandService {

	/**
	 * sr요청 등록
	 * 
	 * @author 신정은
	 */
	public int addSrDemand(SrRequestDto srRequestDto) throws IllegalStateException, IOException;

	/**
	 * 고객의 나의 sr요청 목록 조회
	 * 
	 * @author 신정은
	 * @param srFilterDto 
	 */
	public List<SrDemand> getSrDemandList(String custId, Pager pager, String sort, SrFilterDto srFilterDto);

	/**
	 * sr요청 수정 진행
	 * 
	 * @author 신정은
	 */
	public int updateSrDemand(SrRequestDto srRequestDto);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	public SrdemandDetail getSrDemandDetail(String Detail);

	/**
	 * SR요청 삭제하기
	 * 
	 * @author 신정은
	 */
	public void deleteSrdemand(String dmndNo);

	/**
	 * 고객용 나의 요청 총 행의 수 구하기
	 * 
	 * @author 신정은
	 * @param srFilterDto 
	 */
	public int getCountClientSr(String clientId, SrFilterDto srFilterDto);

	/**
	 * 관리자용 모든요청 총 행의 수 구하기
	 * 
	 * @author 신정은
	 * @param srFilterDto 
	 */
	public int getCountAllSr(SrFilterDto srFilterDto);

	/**
	 * 관리자용 모든요청 목록 가져오기
	 * 
	 * @author 신정은
	 * @param sort 
	 * @param srFilterDto 
	 */
	public List<SrDemand> getSrDemandListBy(Pager pager, String sort, SrFilterDto srFilterDto);

	/**
	 * 관리자의 sr요청 결재 기능
	 * 
	 * @author 신정은
	 */
	public void getSrDemandApproval(SdApprovalDto sdApprovalDto);

	/**
	 * SR요청 번호로 시스템cd 가져오기
	 * 
	 * @author 신정은
	 */
	public String getSysCdByDmndNo(String dmndNo);

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-28
	 * @return sr요청 진행사항 수정 : 진척률 수정 / 결제취소 처리 시에 사용 됨
	 */
	public void updateSrDemandStts(String srNo, int sttsCd);

	/**
	 * DMNO 로 SRNO 조회
	 * 
	 * @author 최은종
	 */
	public String getSrNo(String dmndNo);
	
	/*
	 * 나의 할일 페이징 처리 :  [고객/ 관리자]의 각 상태별 목록 조회시 페이징 객체 생성
	 * @author 신정은
	 */
	public Pager getcountsByCustIdOrPicIdAndSttsCd(String custId, String picId, int sttsCd, int pageNo);
	
	/**
	 * 나의 할일 페이지 - 상태별, [고객/관리자]별 요청+진척 조회 목록 불러오기
	 * @author 신정은
	 */
	public List<MytodoSrListDto> getMytodoSrList(String custId, String picId, int sttsCd, Pager pager); 

	/*
	 * 나의 할일 페이징 처리 :  [개발자]의 각 상태별 목록 조회시 페이징 객체 생성
	 * @author 신정은
	 */
	public Pager getcountsByEmpIdAndSttsCd(String empId, int sttsCd, int pageNo);

	/*
	 * 나의 할일 페이지 - 상태별, [개발자]별 자원정보 + 요청 + 진척 조회 목록 불러오기
	 * @author 신정은
	 */
	public List<MytodoSrListDto> getMytodoSrListForDeveloper(String empId, int sttsCd, Pager pager);
	/**
	 * 반영요청 수락하기
	 * 
	 * @author 여수한
	 */
	public void endSr(String dmndNo);
}
