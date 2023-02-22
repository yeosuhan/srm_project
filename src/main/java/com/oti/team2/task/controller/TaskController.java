package com.oti.team2.task.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.oti.team2.task.dto.SystemTask;
import com.oti.team2.task.service.ITaskService;

import lombok.extern.log4j.Log4j2;

@Controller
@RequestMapping("/task")
@Log4j2
public class TaskController {
	
	@Autowired
	private ITaskService taskService;
	
	/**
	 * 선택된 sysCd에 해당하는 업무구분 데이터 가져오기
	 * @author 신정은
	 */
	@GetMapping("/list/{sysCd}")
	@ResponseBody
	public List<SystemTask> getTaskList(@PathVariable("sysCd")String sysCd) {
		List<SystemTask> taskList = taskService.getTaskList(sysCd);
		log.info(taskList);
		return taskList;
	}

}
