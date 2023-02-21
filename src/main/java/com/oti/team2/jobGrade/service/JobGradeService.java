package com.oti.team2.jobGrade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.jobGrade.dao.IJobGradeDao;
import com.oti.team2.jobGrade.dto.JobGrade;
/* 직급 서비스
 * @author: 안한길
 * */
@Service
public class JobGradeService implements IJobGradeService {
	
	@Autowired
	private IJobGradeDao jobGradeDao;
	/*
	 * 직급 목록
	 * @author 안한길
	 * @return 직급 목록
	 * */
	@Override
	public List<JobGrade> getJobGradeList() {
		return jobGradeDao.selectJobGradeList();
	}

}
