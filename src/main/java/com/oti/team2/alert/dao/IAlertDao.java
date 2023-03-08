package com.oti.team2.alert.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.alert.dto.Alert;

public interface IAlertDao {

	List<Alert> selectByRcvrId(@Param("rcvrId")String rcvrId);

}
