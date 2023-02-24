package com.oti.team2.srresource.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.srresource.dto.SrResource;
import com.oti.team2.srresource.dto.SrResourceOfDeveloper;

public interface ISrResourceDao {
	/**
	 * sr에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param srNo
	 * @return List<SrResource>
	 */
	List<SrResource> selectBySrNo(String srNo);

	/**
	 * 개발자에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param empId
	 * @return List<SrResource>
	 */
	List<SrResourceOfDeveloper> selectByEmpId(String empId);
	/** 입력한 자원 정보 추가
	 * @author : 안한길
	 * @param SrResource
	 * @return int
	 * */
	int insertSrResource(SrResource srResource);
	/** 선택한 자원정보 삭제
	 * @author : 안한길
	 * @param SrSrc
	 * @return int
	 * */
	int deleteBySrSrc(@Param("srSrc") List<String> srSrc);

}
