package com.oti.team2.jobGrade.service;

import java.util.List;

import com.oti.team2.jobGrade.dto.JobGrade;
/*
 * @author: 안한길
 * 작성일: 23.02.21.
 * 내용: 직급 서비스 인터페이스
 * */
public interface IJobGradeService {
	/*
	 * 직급 목록
	 * @author 안한길
	 * @return 직급 목록
	 * */
	public List<JobGrade> getJobGradeList();
}
