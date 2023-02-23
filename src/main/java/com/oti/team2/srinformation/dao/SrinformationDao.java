package com.oti.team2.srinformation.dao;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.srinformation.dto.SrdemandDetail;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInfomaion;

@Mapper
public interface SrinformationDao {
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	public List<SrinformationList> selectInfoAll();

	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	public SrdemandDetail selectDetailByDmndNo(@Param("Detail")String Detail);
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 계획정보 조회
	 */
	public SrplanInfomaion selectPlanByDmndNo(@Param("Plan") String Plan);
}
