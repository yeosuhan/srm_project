package com.oti.team2.srdemand.service;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.progress.service.IProgressService;
import com.oti.team2.srdemand.dao.ISrDemandDao;
import com.oti.team2.srdemand.dto.MytodoSrListDto;
import com.oti.team2.srdemand.dto.SdApprovalDto;
import com.oti.team2.srdemand.dto.SrDemand;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.dto.SrdemandDetail;
import com.oti.team2.srinformation.service.ISrinformationService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SrDemandService implements ISrDemandService {

	@Autowired
	private ISrDemandDao srDemandDao;

	@Autowired
	private ISrinformationService srinformationService;

	@Autowired
	private IProgressService progressService;

	/**
	 * sr요청 등록
	 * 
	 * @author 신정은
	 */
	public int addSrDemand(SrRequestDto srRequestDto) {

		// 요청번호 생성
		String dmndNo = createSrDemandCode();
		srRequestDto.setDmndNo(dmndNo);
		int row = srDemandDao.insertSrDemand(srRequestDto);
		log.info(row);
		return row;
	}

	/**
	 * sr요청 코드 생성하기 요청번호 생성 로직 ex) SR230222_0002 1. 오늘 날짜를 230222 형식으로 가져온다. 2.
	 * SR230222 ~ 로 시작하는 요청의 개수를 구한다. : 3개라고 가정 3. 3+1=4 -> 4번 요청임 4. 숫자를 4자리가 안된다면,
	 * 앞에 0을 채워서 4자리 수로 만든다.
	 * 
	 * @author 신정은
	 */
	private String createSrDemandCode() {
		// 현재 날짜 포맷하여 가져오기
		Date now = Calendar.getInstance().getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyMMdd");
		String formatedNow = formatter.format(now);
		String srCode = "SR" + formatedNow;

		int count = srDemandDao.countByDmndNo(srCode + "%");

		// ex) SR230222_0008 에서 _ 뒤의 숫자 4자리를 세팅하는 로직
		String number = (count + 1) + "";
		while (number.length() < 4) {
			number = "0" + number;
		}

		srCode = srCode + "-" + number;
		log.info("sr요청코드 : " + formatedNow);
		log.info("오늘의 요청 수 : " + count);
		log.info("최종 sr요청코드 : " + srCode);
		return srCode;
	}

	/**
	 * 고객의 나의 sr요청 목록 조회
	 * 
	 * @author 신정은
	 */
	public List<SrDemand> getSrDemandList(String custId, Pager pager, String sort) {
		return srDemandDao.selectByCustId(custId, pager, sort);
	}

	/**
	 * sr요청 수정 진행
	 * 
	 * @author 신정은
	 */
	public int updateSrDemand(SrRequestDto srRequestDto) {
		int row = 0;
		srDemandDao.updateByDmndNo(srRequestDto);
		return 0;
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-22
	 * @return sr요청 상세 조회
	 */
	public SrdemandDetail getSrDemandDetail(String dmndNo) {
		SrdemandDetail sd = srDemandDao.selectDetailByDmndNo(dmndNo);
		log.info(dmndNo);
		return sd;
	}

	/**
	 * SR요청 삭제하기
	 * 
	 * @author 신정은
	 */
	public void deleteSrdemand(String dmndNo) {
		srDemandDao.updateDelYnByDmndNo(dmndNo);
	}

	/**
	 * 고객용 나의 요청 총 행의 수 구하기
	 * 
	 * @author 신정은
	 */
	public int getCountClientSr(String clientId) {
		return srDemandDao.countByClientId(clientId);
	}

	/**
	 * 관리자용 모든요청 총 행의 수 구하기
	 * 
	 * @author 신정은
	 */
	public int getCountAllSr() {
		return srDemandDao.countAllSrDemand();
	}

	/**
	 * 관리자용 모든요청 목록 가져오기
	 * 
	 * @author 신정은
	 */
	public List<SrDemand> getSrDemandListBy(Pager pager) {
		return srDemandDao.selectAllSrDemand(pager);
	}

	/**
	 * 관리자의 sr요청 결재 기능 승인 / 반려 모두 진행
	 * 
	 * @author 신정은
	 */
	@Transactional
	public void getSrDemandApproval(SdApprovalDto sdApprovalDto) {
		if (sdApprovalDto.getVal() == 1) {
			// sr_information 데이터 삽입
			srinformationService.insertInformation(sdApprovalDto);
			log.info("sr no 가져와라 ~~~   " + sdApprovalDto.getSrNo());
			// progress 데이터 삽입
			List<String> pNames = new ArrayList<>();
			pNames.add("요구정의");
			pNames.add("분석/설계");
			pNames.add("구현");
			pNames.add("테스트");
			pNames.add("반영요청");
			pNames.add("운영반영");
			progressService.addProgress(sdApprovalDto.getSrNo(), pNames);

		}
		int row = srDemandDao.updateSttsCdAndRjctRsnByDmndNo(sdApprovalDto);
		log.info(row);

	}

	/**
	 * SR요청 번호로 시스템cd 가져오기
	 * 
	 * @author 신정은
	 */
	public String getSysCdByDmndNo(String dmndNo) {
		return srDemandDao.selectSysCdByDmndNo(dmndNo);
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-28
	 * @return sr요청 진행사항 수정 : 진척률 수정 / 결제취소 처리 시에 사용 됨
	 */
	@Transactional
	public void updateSrDemandStts(String srNo, int sttsCd) {
		log.info("결과 ~~~~~~~~~~~~  " + srNo + "       " + sttsCd);
		int row = srDemandDao.updateSttsBySrNo(srNo, sttsCd);
		log.info("updateSrDemandStts 결과 ~~~~~~~~~~~~  " + row);
	}

	/**
	 * DMNO 로 SRNO 조회
	 * 
	 * @author 최은종
	 */
	public String getSrNo(String dmndNo) {
		String srNo = srDemandDao.selectBySrDmndNo(dmndNo);

		log.info(srNo);
		return srNo;
	}

	/*
	 * 나의 할일 페이징 처리 : 고객/ 관리자의 각 상태별 목록 조회시 페이징 객체 생성
	 * 
	 * @author 신정은
	 */
	public Pager getcountsByCustIdOrPicIdAndSttsCd(String custId, String picId, int sttsCd, int pageNo) {
		int totalRows = srDemandDao.countByCustIdOrPicIdAndSttsCd(custId, picId, sttsCd);
		Pager pager = new Pager(totalRows, pageNo);
		return pager;
	}

	/**
	 * 나의 할일 페이지 - 상태별, 고객/관리별 요청+진척 조회 목록 불러오기
	 * 
	 * @author 신정은
	 */
	public List<MytodoSrListDto> getMytodoSrList(String custId, String picId, int sttsCd, Pager pager) {
		return srDemandDao.selectByCustIdOrPicIdAndSttsCd(custId, picId, sttsCd, pager);
	}

	/*
	 * 나의 할일 페이징 처리 : [고객/ 관리자]의 각 상태별 목록 조회시 페이징 객체 생성
	 * 
	 * @author 신정은
	 */
	public Pager getcountsByEmpIdAndSttsCd(String empId, int sttsCd, int pageNo) {
		int totalRows = srDemandDao.countByEmpIdAndSttsCd(empId, sttsCd);
		Pager pager = new Pager(totalRows, pageNo);
		return pager;
	}

	/*
	 * 나의 할일 페이지 - 상태별, [개발자]별 자원정보 + 요청 + 진척 조회 목록 불러오기
	 * 
	 * @author 신정은
	 */
	public List<MytodoSrListDto> getMytodoSrListForDeveloper(String empId, int sttsCd, Pager pager) {
		return srDemandDao.selectByEmpIdAndSttsCd(empId, sttsCd, pager);
	}
	/**
	 * 반영요청 수락하기
	 * 
	 * @author 여수한
	 */
	@Override
	public void endSr(String dmndNo) {
		srDemandDao.updateSrdemandStts(dmndNo);
		
	}
}