package com.oti.team2.jobGrade.dao;

import java.util.List;

import com.oti.team2.jobGrade.dto.JobGrade;

public interface IJobGradeDao {
	public List<JobGrade> selectJobGradeList();
}
