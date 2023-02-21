package com.oti.team2.jobGrade.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.jobGrade.dao.IJobGradeDao;
import com.oti.team2.jobGrade.dto.JobGrade;
@Service
public class JobGradeService implements IJobGradeService {
	@Autowired
	private IJobGradeDao jobGradeDao;
	@Override
	public List<JobGrade> getJobGradeList() {
		return jobGradeDao.selectJobGradeList();
	}

}
