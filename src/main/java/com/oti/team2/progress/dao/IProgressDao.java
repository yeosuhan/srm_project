package com.oti.team2.progress.dao;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.oti.team2.progress.dto.Progress;
@Mapper
public interface IProgressDao {
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 */
	public Progress selectProgressByDmndNo(@Param("dmndNo") String dmndNo);

}
