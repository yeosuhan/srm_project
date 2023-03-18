package com.oti.team2.srinformationhistory.service;

import java.util.List;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.alert.service.IAlertService;
import com.oti.team2.member.dao.IMemberDao;
import com.oti.team2.srdemand.dao.ISrDemandDao;
import com.oti.team2.srdemand.dto.SrRequestDto;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.srinformation.service.ISrinformationService;
import com.oti.team2.srinformationhistory.dao.ISrInformationHistoryDao;
import com.oti.team2.srinformationhistory.dto.MyTodoHistoryListDto;
import com.oti.team2.srinformationhistory.dto.SrHistoryDetailDto;
import com.oti.team2.srinformationhistory.dto.SrHistoryMailDto;
import com.oti.team2.srinformationhistory.dto.SrInformationHistory;
import com.oti.team2.srinformationhistory.dto.SrResourceAddHistoryDto;
import com.oti.team2.srresource.dto.SrResource;
import com.oti.team2.srresource.service.ISrResourceService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SrInformationHistoryService implements ISrInformationHistoryService {
	@Autowired
	private ISrInformationHistoryDao srInformationHistoryDao;

	@Autowired
	private ISrDemandDao srDemandDao;

	@Autowired
	private ISrDemandService srDemandService;

	@Autowired
	private ISrResourceService srResourceService;

	@Autowired
	private ISrinformationService srInformationService;

	@Autowired
	private IAlertService alertService;

	@Autowired
	private IMemberDao memberDao;

/*	@Autowired
	private JavaMailSender mailSender;*/

	/**
	 * SR처리 히스토리 내역 조회 메서드 (관리자/개발자용)
	 * 
	 * @author 최은종
	 */
	@Override
	public List<SrInformationHistory> getSrInformationHistoryList(Pager pager, String srNo) {
		List<SrInformationHistory> srInformationHistoryList = srInformationHistoryDao.selectBySrNo(pager, srNo);
		return srInformationHistoryList;
	}

	/**
	 * SR처리 히스토리 내역 조회 메서드 (고객용)
	 * 
	 * @author 최은종
	 */
	@Override
	public List<SrInformationHistory> getSrInformationHistoryListForClient(String srNo, Pager pager, String role) {
		List<SrInformationHistory> srInformationHistoryList = srInformationHistoryDao.selectForClientBySrNo(srNo,
				pager);
		return srInformationHistoryList;
	}

	/**
	 * 히스토리 조회시 권한에 따라 sr요청번호를 다르게 보여 주기 위한 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public String getSrNo(String dmndNo) {
		String srNo = srDemandDao.selectBySrDmndNo(dmndNo);

		log.info(srNo);
		return srNo;
	}

	/**
	 * SR처리 히스토리 목록 페이징을 위한 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public int getCountAllForEmp(String srNo) {
		int rows = srInformationHistoryDao.countAllForEmp(srNo);
		return rows;
	}

	@Override
	public int getCountAllForClient(String srNo) {
		int rows = srInformationHistoryDao.countAllForClient(srNo);
		return rows;
	}

	/**
	 * SR처리 히스토리 상세 조회 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public SrHistoryDetailDto getSrInformationHistory(int hstryId) {
		SrHistoryDetailDto srHistoryDetailDto = srInformationHistoryDao.selectByHstryId(hstryId);
		return srHistoryDetailDto;
	}

	/**
	 * SR 히스토리 등록 & 결재를 위한 insert 및 update 메서드
	 * 
	 * @author 최은종
	 * @see 개발자, 관리자
	 */
	@Transactional
	public void addSrInformationHistory(SrInformationHistory srInformationHistory, String role) {
		log.info("서비스----insert");
		String hstryType = srInformationHistory.getHstryType();
		String hstryStts = srInformationHistory.getHstryStts();
		int hstryId = srInformationHistory.getHstryId();
		String srNo = srInformationHistory.getSrNo();
		String rcvrId = null;
		log.info("서비스----hstryType: " + hstryType);
		log.info("서비스----role: " + role);

		if (role.equals("ROLE_DEVELOPER")) {
			log.info("나는 개발자");
			// 개발자가 신규등록 할 때
			srInformationHistoryDao.insertSrHistory(srInformationHistory);
			// 모든 관리자에게 알림 전송
			srInformationHistory
					.setHstryId(srInformationHistoryDao.selectLastHstryIdByRqstrId(srInformationHistory.getRqstrId()));
			List<String> adminList = memberDao.selectAdmin();
			adminList.forEach((value) -> {
				alertService.sendToClient(value, srInformationHistory.getHstryId(), "CHG_YMD_DVL");
			});
		} else if (role.equals("ROLE_ADMIN")) {
			log.info("나는 관리자");
			if (hstryId == 0) {
				log.info("나는 관리자:신규등록");
				// 관리자가 신규등록 할 때
				srInformationHistoryDao.insertSrHistory(srInformationHistory);
				// 고객에게 알림 전송
				srInformationHistory.setHstryId(
						srInformationHistoryDao.selectLastHstryIdByRqstrId(srInformationHistory.getRqstrId()));
				rcvrId = srDemandDao.selectBySrNo(srInformationHistory.getSrNo());
				String alertType = null;
				if (srInformationHistory.getHstryType().equals("B")) {
					alertType = "CHG_YMD"; // 예정일 변경 요청
				} else if (srInformationHistory.getHstryType().equals("C")) {
					alertType = "RTRCN"; // 개발 취소
				}
				alertService.sendToClient(rcvrId, srInformationHistory.getHstryId(), alertType);
			} else if (hstryId != 0) {
				log.info("나는 관리자:업데이트");
				// 개발자가 신청한 등록이 있으면
				// 그 요청에 대한 상태값 업데이트
				log.info(srInformationHistory.getHstryStts());
				srInformationHistoryDao.updateHstryStts(srInformationHistory.getHstryId(),
						srInformationHistory.getHstryStts());
				// 개발자 에게 알림 전송
				rcvrId = srInformationHistoryDao.selectRqstrIdByHstryId(srInformationHistory.getHstryId());
				alertService.sendToClient(rcvrId, srInformationHistory.getHstryId(), "CHG_YMD_DVL");
				if (hstryStts.equals("Y")) {
					// 고객한테 새로 요청 보내기 (이 때 상태값 I로 바꿔서 insert)
					srInformationHistoryDao.insertSrHistory(srInformationHistory);
					// 고객에게 알림 전송
					srInformationHistory.setHstryId(
							srInformationHistoryDao.selectLastHstryIdByRqstrId(srInformationHistory.getRqstrId()));
					rcvrId = srDemandDao.selectBySrNo(srInformationHistory.getSrNo());
					alertService.sendToClient(rcvrId, srInformationHistory.getHstryId(), "CHG_YMD");
				}
			}
		} else if (role.equals("ROLE_CLIENT")) {

			log.info("나는 고객");
			log.info(hstryType);
			// 관리자가 요청한 유형이 요청일변경일 경우 상태 + 고객의 완료요청일 업데이트
			if (hstryType.equals("B")) {
				log.info(srInformationHistory.getHstryStts());
				// 요청일 변경 수락시 히스토리 승인여부 및 고객의 완료요청일 업데이트
				if (hstryStts.equals("Y")) {
					srInformationHistoryDao.updateHstryStts(srInformationHistory.getHstryId(),
							srInformationHistory.getHstryStts());

					SrRequestDto srRequestDto = new SrRequestDto();
					srRequestDto.setCmptnDmndYmd(srInformationHistory.getChgEndYmd());
					log.info(srInformationHistory.getChgEndYmd());
					srRequestDto.setDmndNo(srInformationHistory.getDmndNo());
					log.info(srInformationHistory.getDmndNo());
					// srDemandService.updateSrDemand(srRequestDto);
					int row = srDemandService.updateSrDemand(srRequestDto);
					log.info(srRequestDto);
					log.info(row);
					// 알림 전송
					rcvrId = srInformationHistoryDao.selectRqstrIdByHstryId(srInformationHistory.getHstryId());
					alertService.sendToClient(rcvrId, srInformationHistory.getHstryId(), "CHG_YMD");
				} else {
					// 요청일 변경 반려시 히스토리 승인여부만 업데이트
					srInformationHistoryDao.updateHstryStts(srInformationHistory.getHstryId(),
							srInformationHistory.getHstryStts());
					// 알림 전송
					rcvrId = srInformationHistoryDao.selectRqstrIdByHstryId(srInformationHistory.getHstryId());
					alertService.sendToClient(rcvrId, srInformationHistory.getHstryId(), "CHG_YMD");
				}
			} else if (hstryType.equals("C")) {
				// 관리자가 요청한 유형이 개발취소인 경우 일단 상태값 업데이트

				srInformationHistoryDao.updateHstryStts(srInformationHistory.getHstryId(),
						srInformationHistory.getHstryStts());
				if (hstryStts.equals("Y")) {
					// 개발취소 승인이면
					// 그 요청으로 영향을 받는 다른 서비스들 호출해서 값 변경해주기
					log.info(srInformationHistory.getHstryStts());

					srDemandService.updateSrDemandStts(srNo, 6);

					SrResource srResourceDto = new SrResource();
					srResourceDto.setSrNo(srNo);
					srInformationService.updatePrgrsBySrNo(srNo);
					srInformationService.updateEndYmdBySrNo(srNo);
					srResourceService.modifySrResource(srResourceDto);

				}
				// 알림 전송
				rcvrId = srInformationHistoryDao.selectRqstrIdByHstryId(srInformationHistory.getHstryId());
				alertService.sendToClient(rcvrId, srInformationHistory.getHstryId(), "CHG_YMD_DVL");
			}
		}
	}

	/**
	 * SR 승인 전 요청 변경을 위한 update 메서드
	 * 
	 * @author 최은종
	 */
	@Transactional
	public void updateHstry(SrInformationHistory srInformationHistory) {
		log.info("서비스----요청 수정");

		int row = srInformationHistoryDao.updateHstry(srInformationHistory);
		log.info("서비스----요청 수정row " + row);
		log.info("서비스----요청 수정22 " + srInformationHistory);

	}

	/**
	 * 나의 할 일에서의 히스토리 목록 조회 메서드 (관리자)
	 * 
	 * @author 최은종
	 */
	@Override
	public List<MyTodoHistoryListDto> getHstryTodoByPicId(Pager pager, String picId) {
		return srInformationHistoryDao.selectHstryTodoByPicId(pager, picId);
	}

	/**
	 * 나의 할 일에서의 히스토리 목록 조회 메서드 (개발자)
	 * 
	 * @author 최은종
	 */
	@Override
	public List<MyTodoHistoryListDto> getHstryTodoByEmpId(Pager pager, String rqstrId, String empId) {
		return srInformationHistoryDao.selectHstryTodoByEmpId(pager, rqstrId, empId);
	}

	/**
	 * 나의 할 일에서의 히스토리 목록 조회 메서드 (고객)
	 * 
	 * @author 최은종
	 */
	@Override
	public List<MyTodoHistoryListDto> getHstryTodoByCustId(Pager pager, String custId) {
		return srInformationHistoryDao.selectHstryTodoByCustId(pager, custId);
	}

	/**
	 * 개발자 : 내가 자원으로 들어가있고 투입종료 이전일 때만 sr요청 버튼 보이게 하기 위한 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public List<SrResourceAddHistoryDto> getDmndNoBySrResouce(String dmndNo, String empId) {
		return srInformationHistoryDao.selectDmndNoBySrResouce(dmndNo, empId);
	}

	/**
	 * 나의 할 일에서 히스토리 목록 페이징 메서드
	 * 
	 * @author 최은종
	 */
	@Override
	public int getCountTodoForAdmin(String picId) {
		int rows = srInformationHistoryDao.countTodoForAdmin(picId);
		return rows;
	}

	@Override
	public int getCountTodoForDev(String rqstrId, String empId) {
		int rows = srInformationHistoryDao.countTodoForDev(rqstrId, empId);
		return rows;
	}

	@Override
	public int getCountTodoForCust(String custId) {
		int rows = srInformationHistoryDao.countTodoForCust(custId);
		return rows;
	}

	@Override
	public String sendHistoryMail(SrHistoryMailDto historyMailDto, String srNo, String hstryType) {
		// TODO Auto-generated method stub
		return null;
	}

	/*
	 * @Override public String sendHistoryMail(SrHistoryMailDto historyMailDto,
	 * String srNo, String hstryType) {
	 * 
	 * String fromEmail = "otiteam2@gmail.com"; // 받는 사람 메일에 표시됨 String fromName =
	 * "오티아이"; // 발신인 이름 String title = "[OTI 오티아이] OTI-SRM 임시 비밀번호 입니다."; String
	 * content = memberDto.getMemberId() +
	 * "님 안녕하세요. 로그인 후 비밀번호를 변경하여 사용 부탁드립니다. 본인이 새로운 비밀번호를 요청하지 않았다면 이 이메일은 무시해 주세요."
	 * ; content += "OTI-SRM 임시 비밀번호 : " + randomPswd;
	 * 
	 * // 수신인 정보 String toEmail = memberDto.getEml();
	 * 
	 * // 이메일 발송 MimeMessage msg = mailSender.createMimeMessage(); try {
	 * MimeMessageHelper helper = new MimeMessageHelper(msg, true, "utf-8");
	 * helper.setFrom(fromEmail); helper.setTo(toEmail); helper.setSubject(title);
	 * helper.setText(content, true); mailSender.send(msg); } catch (Exception e) {
	 * log.info("이메일 발송 실패: " + e); }
	 * 
	 * 
	 * return ""; }
	 */
}