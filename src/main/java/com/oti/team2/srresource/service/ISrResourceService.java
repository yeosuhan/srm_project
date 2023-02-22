package com.oti.team2.srresource.service;

import java.util.List;

import com.oti.team2.srresource.dto.SrResource;

public interface ISrResourceService {
	/**
	 * sr에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param srNo
	 * @return List<SrResource>
	 */
	List<SrResource> getSrResourceList(String srNo);

}
