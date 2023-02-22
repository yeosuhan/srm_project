package com.oti.team2.srresource.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.srresource.dao.ISrResourceDao;
import com.oti.team2.srresource.dto.SrResource;
@Service
public class SrResourceService implements ISrResourceService {
	
	@Autowired
	private ISrResourceDao srResourceDao;
	/**
	 * sr에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param srNo
	 * @return List<SrResource>
	 */
	@Override
	public List<SrResource> getSrResourceList(String srNo) {
		return srResourceDao.selectSrResourceListBySrNo(srNo);
	}

}
