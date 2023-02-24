package com.oti.team2.progress.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.progress.dao.IProgressDao;
import com.oti.team2.progress.dto.Progress;
@Service
public class ProgressService implements IProgressService{
	
	@Autowired
	IProgressDao progressDao;
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 */
	@Override
	public List<Progress> getProgress(String srNo) {
		return progressDao.selectProgressByDmndNo(srNo);
	}

}
