package com.oti.team2.institution.dao;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.institution.dto.Institution;

public interface InstitutionDao {
	
	public Institution selectByInstCd(@Param("instCd")String instCd);

}
