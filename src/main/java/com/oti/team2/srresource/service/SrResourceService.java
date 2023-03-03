package com.oti.team2.srresource.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.srresource.dao.ISrResourceDao;
import com.oti.team2.srresource.dto.SrResource;
import com.oti.team2.srresource.dto.SrResourceOfDeveloper;
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
	public List<SrResource> getSrResourceListBySrNo(String srNo) {
		return srResourceDao.selectBySrNo(srNo);
	}
	/**
	 * 개발자에 대한 자원 정보 가져오기
	 * @author : 안한길
	 * @param empId
	 * @return List<SrResource>
	 */
	@Override
	public List<SrResourceOfDeveloper> getSrResourceListByEmpId(String empId) {
		return srResourceDao.selectByEmpId(empId);
	}
	/** 입력한 자원 정보 추가
	 * @author : 안한길
	 * @param SrResource
	 * @return int
	 * */
	@Override
	public int addSrResource(SrResource srResource) {
		return srResourceDao.insertSrResource(srResource);
	}
	
	/** 선택한 자원정보 삭제
	 * @author : 안한길
	 * @param SrSrc
	 * @return int
	 * */
	@Override
	public int deleteSrResource(List<String> srSrc) {
		return srResourceDao.deleteBySrSrc(srSrc);
	}
	/** 입력한 자원 정보 수정
	 * @author : 안한길
	 * @param SrResource
	 * @return int
	 * */
	@Override
	public int modifySrResource(SrResource srResource) {
		return srResourceDao.updateSrResource(srResource);
	}

}
