package com.oti.team2.task.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.task.dao.ITaskDao;
import com.oti.team2.task.dto.SystemTask;

@Service
public class TaskService implements ITaskService{

	@Autowired 
	private ITaskDao taskDao;
	
	/**
	 * 선택된 sysCd에 해당하는 업무구분 데이터 가져오기
	 * @author 신정은
	 */
	public List<SystemTask> getTaskList(String sysCd) {
		List<SystemTask> taskList = taskDao.selectBySysCd(sysCd);
		return taskList;
	}

}
