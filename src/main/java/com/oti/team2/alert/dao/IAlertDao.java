package com.oti.team2.alert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.alert.dto.Alert;

public interface IAlertDao {

	/* 사용자에 대한 알람을 조회
	 * @author : 안한길
	 * @Param : rcvrId
	 * @return : List<Alert>
	 * */
	List<Alert> selectByRcvrId(@Param("rcvrId")String rcvrId, @Param("role")String role);

	/* 새로운 알람을 테이블에 추가하는 메소드
	 * @author : 안한길
	 * @param : alert
	 * @return : int
	 * */
	int insertAlertDao(Alert alert);
	/* 알림 읽은 처리
	 * @author : 안한길
	 * @return : int
	 * */
	int updateIdntyYn(@Param("altNo")Integer altNo);

}
