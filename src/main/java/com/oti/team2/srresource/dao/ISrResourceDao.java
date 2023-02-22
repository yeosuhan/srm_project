package com.oti.team2.srresource.dao;

import java.util.List;

import com.oti.team2.srresource.dto.SrResource;
import com.oti.team2.srresource.dto.SrResourceOfDeveloper;

public interface ISrResourceDao {
	/**
	 * sr에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param srNo
	 * @return List<SrResource>
	 */
	List<SrResource> selectSrResourceListBySrNo(String srNo);

	/**
	 * 개발자에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param empId
	 * @return List<SrResource>
	 */
	List<SrResourceOfDeveloper> selectSrResourceListByEmpId(String empId);

}
