package com.oti.team2.task.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.task.dto.SystemTask;

public interface ITaskDao {
	
	/**
	 * 선택된 sysCd에 해당하는 업무구분 데이터 가져오기
	 * @author 신정은
	 */
	public List<SystemTask> selectBySysCd(@Param("sysCd")String sysCd);
}
