package com.oti.team2.progress.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.progress.dto.Prgrs;
import com.oti.team2.progress.dto.PrgrsPlanDto;
import com.oti.team2.progress.dto.Progress;
@Mapper
public interface IProgressDao {
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 */
	public List<Progress> selectProgressByDmndNo(@Param("srNo") String srNo);
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-28
	 * @param dmndNo 
	 * @param rcvrId 
	 * @return sr요청 진척률 수정
	 */
	public void updateProgressByPrgrsId(@Param("prgrsId") int prgrsId, @Param("bgngYmd") String bgngYmd, @Param("endYmd") String endYmd, @Param("prgrsRt") int prgrsRt);
	
	/**
	 * 진척률 insert
	 * @author 신정은
	 */
	public int insertProgress(@Param("srNo") String srNo, @Param("pNames") List<String> pNames);
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-08
	 * @return 자원 넣으면 요구사항(개발중)시작
	 */
	public void startProgress(@Param("srNo") String srNo);
	/**
	 * 반영요청 진척률 조회
	 * @author 여수한
	 */
	public String selectPrgrsRt(@Param("dmNo") String dmNo);
	/**
	 * 반영요청 보내기
	 * 
	 * @author 여수한
	 * @param endYmd 
	 */
	public void updateProgressYmd(@Param("srNo") String srNo, @Param("endYmd") String endYmd);
	/**
	 * 고객이 반영요청 수락하면 운영반영 넣기
	 * @author 여수한
	 */
	public void updateEndYmd(@Param("dmNo")String dmNo);
	/**
	 * 진척단계 끝나면 다음 진척단계 시작일 넣기
	 * @author 여수한
	 * @param endYmd 
	 */
	public void updateBgngYmdByPrgrsId(@Param("prgrsId") int prgrsId, @Param("endYmd")String endYmd);
	/**
	 * 진척목록의 진척률 조회
	 * @author 여수한
	 */
	public List<Prgrs> selectPrgrsSeNm();
	/**
	 * [나의할일] 오늘날짜에 해당하는 진척 단계의 값 가져오기
	 * @author 신정은
	 */
	public int selectPrgrsRtBySrNoBetweenBgngAndEnd(@Param("srNo") String srNo);
	
}
