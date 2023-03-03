package com.oti.team2.srinformation.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.department.service.IDepartmentService;
import com.oti.team2.srdemand.dto.SdApprovalDto;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.srinformation.dao.ISrinformationDao;
import com.oti.team2.srinformation.dto.SrInformationRequestDto;
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInfomaion;
import com.oti.team2.system.service.ISystemService;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SrinformationService implements ISrinformationService{
	
	@Autowired
	ISrinformationDao srinformationDao;
	
	@Autowired
	ISrDemandService srDemandService;
	
	@Autowired
	ISystemService systemService;
	
	@Autowired
	IDepartmentService departmentService;
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-22
	 * @return sr진척 목록 조회
	 */
	@Override
	public List<SrinformationList> getList() {
		List<SrinformationList> srlist = srinformationDao.selectInfoAll();
		return srlist;
	}
	
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-02-23
	 * @return sr진척 계획정보 조회
	 */
	@Override
	public SrplanInfomaion getPlan(String dmndNo) {
		return srinformationDao.selectPlanByDmndNo(dmndNo);
	}
	
	/**
	 * 관리자의 sr요청 승인 시 -> srInformation에 insert하기
	 * @author 신정은
	 */
	public void insertInformation(SdApprovalDto sdApprovalDto) {
		// dmndNo, rnk, deptCd, picID
		// 시스템 코드 가져오기
		String sysCd = srDemandService.getSysCdByDmndNo(sdApprovalDto.getDmndNo());
		
		//시스템 코드로 담당 부서 지정
		String deptCd = systemService.getDeptCdBySysCd(sysCd);
	
		// 개발담당자pic_id : 해당부서의 담당자 가져오기
		String picId = departmentService.getMngrNameByDeptCd(deptCd);
				
		// 코드 생성
		String srNo = createSrNoCode(sysCd);
	
		//srInformation에 insert 실행
		SrInformationRequestDto srInfoDto = new SrInformationRequestDto(srNo, sdApprovalDto.getDmndNo(), deptCd, picId, 
				sdApprovalDto.getRnk(), sdApprovalDto.getBgngYmd(), sdApprovalDto.getEndYmd());
		log.info(srInfoDto);
		int row = srinformationDao.insertSrInformatioin(srInfoDto);
		log.info("결과 : " + row);
	}
	
	/**
	 * sr_no 코드 생성하기
	 * @author 신정은
	 */
	private String createSrNoCode(String sysCd) {
		Date now = Calendar.getInstance().getTime();       
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		String formatedNow = formatter.format(now);
		String srNO = sysCd + "-" + formatedNow;
		
		// ex) WOR-2023 으로 시작하는 데이터의 수를 가져온다.
		int count = srinformationDao.countBySrNo(srNO+"%");
		String number = (count + 1) + "";
		while(number.length() < 4) {
			number = "0"+number;
		}
		
		srNO += number;
		log.info(srNO);
		return srNO;
	}

}
