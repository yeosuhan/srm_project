package com.oti.team2.progress.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.progress.dao.IProgressDao;
import com.oti.team2.progress.dto.Prgrs;
import com.oti.team2.progress.dto.Progress;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.alert.service.IAlertService;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class ProgressService implements IProgressService {

	@Autowired
	IProgressDao progressDao;

	@Autowired
	ISrDemandService srDemandService;

	@Autowired
	IAlertService alertService;

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-23
	 * @return sr요청 진척률 조회
	 */
	@Override
	public List<Progress> getProgress(String srNo) {
		return progressDao.selectProgressByDmndNo(srNo);
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-27
	 * @return sr요청 진척률 수정
	 */
	@Override
	@Transactional
	public void updateProgress(int prgrsRt, String bgngYmd, String endYmd, int prgrsId, String srNo, String prgrsSeNm,
			String rcvrId, String dmndNo) {
		boolean flag = true;
		int[] array = { 10, 40, 70, 80, 90, 100 };
		log.info("진척률 수정 서비스");
		log.info("prgrsRt: " + prgrsRt);
		log.info("bgngYmd : " + bgngYmd);
		log.info("endYmd : " + endYmd);
		log.info("prgrsId : " + prgrsId);
		log.info("prgrsSeNm : " + prgrsSeNm);
		log.info("srNo : " + srNo);
		// 진척률이 종료값일 경우
		for (int i = 0; i < array.length; i++) {
			// 진척률이 종료값이지만 종료일이 없을경우
			if (prgrsRt == array[i] && endYmd == "") {
				log.info("111");
				flag = false;
				break;
				// 에러 메시지 줘야돼 > 종료일이 없습니다.
			}
		}

		// 진척률이 범위내에 있을 경우
		if (flag) {
			switch (prgrsSeNm) {
			case "요구정의":
				if (!(prgrsRt >= 0 && prgrsRt <= 10)) {
					log.info("진척률이 범위에 없습니다.");
					// 에러 메시지 줘야돼 > 진척률이 범위에 없습니다.
					flag = false;
					break;
				} else if (prgrsRt >= 0 && prgrsRt <= 10) {
					// 진척률이 범위내 있으면서 종료일이 없을 경우 = 그냥 진척률만 업데이트할 경우
					if ((prgrsRt >= 0 && prgrsRt < 10)) {
						log.info("그냥 진척률만 업데이트할 경우.");
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						flag = false;
						break;
					}
					// 진척률이 종료값이면서 종료일이 있을 경우 = 다음 진척단계로 넘어감 > 다음 진척단계 시작일을 SYSDATE로 줘야돼
					else if (endYmd != "" && prgrsRt == 10) {
						log.info(" 다음 진척단계로 넘어감 > 다음 진척단계 시작일을 SYSDATE로 줘야돼.");
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						prgrsId++;
						progressDao.updateBgngYmdByPrgrsId(prgrsId); // 다음 진척단계 시작일을 SYSDATE로
						flag = false;
						break;
					}
				}
				break;
			case "분석/설계":
				if (!(prgrsRt >= 11 && prgrsRt <= 40)) {
					// 에러 메시지 줘야돼 > 진척률이 범위에 없습니다.
					flag = false;
					break;
				} else if (prgrsRt >= 11 && prgrsRt <= 40) {
					if ((prgrsRt >= 11 && prgrsRt < 40)) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						flag = false;
						break;
					} else if (endYmd != "" && prgrsRt == 40) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						prgrsId++;
						progressDao.updateBgngYmdByPrgrsId(prgrsId); // 다음 진척단계 시작일을 SYSDATE로
						flag = false;
						break;
					}
				}
				break;
			case "구현":
				if (!(prgrsRt >= 41 && prgrsRt <= 70)) {
					// 에러 메시지 줘야돼 > 진척률이 범위에 없습니다.
					flag = false;
					break;
				} else if (prgrsRt >= 41 && prgrsRt <= 70) {
					if ((prgrsRt >= 41 && prgrsRt < 70)) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						flag = false;
						break;
					} else if (endYmd != "" && prgrsRt == 70) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						prgrsId++;
						progressDao.updateBgngYmdByPrgrsId(prgrsId); // 다음 진척단계 시작일을 SYSDATE로
						int sttsCd = 4;
						srDemandService.updateSrDemandStts(srNo, sttsCd);
						flag = false;
						break;
					}
				}
				break;
			case "테스트":
				if (!(prgrsRt >= 71 && prgrsRt <= 80)) {
					// 에러 메시지 줘야돼 > 진척률이 범위에 없습니다.
					flag = false;
					break;
				} else if (prgrsRt >= 71 && prgrsRt <= 80) {
					if ((prgrsRt >= 71 && prgrsRt < 80)) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						flag = false;
						break;
					} else if (endYmd != "" && prgrsRt == 80) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						prgrsId++;
						progressDao.updateBgngYmdByPrgrsId(prgrsId); // 다음 진척단계 시작일을 SYSDATE로
						flag = false;
						break;
					}
				}
				break;
			case "반영요청":
				if (!(prgrsRt >= 81 && prgrsRt <= 90)) {
					// 에러 메시지 줘야돼 > 진척률이 범위에 없습니다.
					flag = false;
					break;
				} else if (prgrsRt >= 81 && prgrsRt <= 90) {
					if ((prgrsRt >= 81 && prgrsRt < 90)) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						flag = false;
						break;
					} else if (endYmd != "" && prgrsRt == 90) {
						alertService.sendToClient(rcvrId, dmndNo);
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						prgrsId++;
						progressDao.updateProgressYmd(srNo); // 운영반영 시작일(=SYSDATE) 업데이트
						progressDao.updateBgngYmdByPrgrsId(prgrsId); // 다음 진척단계 시작일을 SYSDATE로
						flag = false;
						break;
					}
				}
				break;
			case "운영반영":
				if (!(prgrsRt >= 91 && prgrsRt <= 100)) {
					// 에러 메시지 줘야돼 > 진척률이 범위에 없습니다.
					flag = false;
					break;
				} else if (prgrsRt >= 91 && prgrsRt <= 100) {
					if ((prgrsRt >= 91 && prgrsRt < 100)) {
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						flag = false;
						break;
					} else if (endYmd != "" && prgrsRt == 100) {
						int sttsCd = 5;
						srDemandService.updateSrDemandStts(srNo, sttsCd);
						progressDao.updateProgressByPrgrsId(prgrsId, bgngYmd, endYmd, prgrsRt);
						flag = false;
						break;
					}
				}
				break;
			}
		}
	}
	/**
	 * 진척데이터 삽입
	 * 
	 * @author 신정은
	 */
	public void addProgress(String srNo, List<String> pNames) {
		progressDao.insertProgress(srNo, pNames);
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-08
	 * @return 자원 넣으면 요구사항(개발중)시작
	 */
	public void startProgress(String srNo) {
		progressDao.startProgress(srNo);
	}

	/**
	 * 반영요청 진척률 조회
	 * 
	 * @author 여수한
	 */
	@Override
	public String getPrgrsRt(String dmNo) {
		String PrgrsRt = progressDao.selectPrgrsRt(dmNo);
		return PrgrsRt;
	}

	/**
	 * 고객이 반영요청 수락하면 운영반영 넣기
	 * 
	 * @author 여수한
	 */
	@Override
	public void endProgress(String dmNo) {
		progressDao.updateEndYmd(dmNo);
	}

	/**
	 * 진척목록의 진척률 조회
	 * 
	 * @author 여수한
	 */
	@Override
	public List<Prgrs> getRrgrs() {
		List<Prgrs> prgrs = progressDao.selectPrgrsSeNm();
		return prgrs;
	}
}
