package com.oti.team2.srinformation.service;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.poi.hssf.util.HSSFColor;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.Font;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.util.CellRangeAddress;
import org.apache.poi.xssf.streaming.SXSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.oti.team2.board.dto.SRKeyDto;
import com.oti.team2.department.service.IDepartmentService;
import com.oti.team2.srdemand.dto.SdApprovalDto;
import com.oti.team2.srdemand.service.ISrDemandService;
import com.oti.team2.srinformation.dao.ISrinformationDao;
import com.oti.team2.srinformation.dto.Dept;
import com.oti.team2.srinformation.dto.Manager;
import com.oti.team2.srinformation.dto.SrInfoFilter;
import com.oti.team2.srinformation.dto.SrInformationRequestDto;
//github.com/OTI-SRM/srm_project
import com.oti.team2.srinformation.dto.SrinformationList;
import com.oti.team2.srinformation.dto.SrplanInformation;
import com.oti.team2.srresource.service.ISrResourceService;
import com.oti.team2.system.service.ISystemService;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class SrinformationService implements ISrinformationService {

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
	 * @author 여수한 작성일자 : 2023-02-22
	 * @return sr진척 목록 조회
	 */
	@Override
	public List<SrinformationList> getList(Pager pager, SrInfoFilter srInfoFilter, String sort) {
		List<SrinformationList> srlist = srinformationDao.selectInfoAll(pager, srInfoFilter, sort);
		return srlist;
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-02-23
	 * @return sr진척 계획정보 조회
	 */
	@Override
	public SrplanInformation getPlan(String dmndNo) {
		return srinformationDao.selectPlanByDmndNo(dmndNo);
	}

	/**
	 * 관리자의 sr요청 승인 시 -> srInformation에 insert하기
	 * 
	 * @author 신정은
	 */
	@Transactional
	public void insertInformation(SdApprovalDto sdApprovalDto) {
		// dmndNo, rnk, deptCd, picID
		// 시스템 코드 가져오기
		String sysCd = srDemandService.getSysCdByDmndNo(sdApprovalDto.getDmndNo());

		// 시스템 코드로 담당 부서 지정
		String deptCd = systemService.getDeptCdBySysCd(sysCd);

		// 개발담당자pic_id : 해당부서의 담당자 가져오기
		String picId = departmentService.getMngrNameByDeptCd(deptCd);

		// 코드 생성
		String srNo = createSrNoCode(sysCd);
		sdApprovalDto.setSrNo(srNo);
		// srInformation에 insert 실행
		SrInformationRequestDto srInfoDto = new SrInformationRequestDto(srNo, sdApprovalDto.getDmndNo(), deptCd, picId,
				sdApprovalDto.getRnk(), sdApprovalDto.getBgngYmd(), sdApprovalDto.getEndYmd());
		log.info(srInfoDto);
		int row = srinformationDao.insertSrInformatioin(srInfoDto);
		log.info("결과 : " + row);
	}

	/**
	 * sr_no 코드 생성하기
	 * 
	 * @author 신정은
	 */
	private String createSrNoCode(String sysCd) {
		Date now = Calendar.getInstance().getTime();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy");
		String formatedNow = formatter.format(now);
		String srNO = sysCd + "-" + formatedNow;

		// ex) WOR-2023 으로 시작하는 데이터의 수를 가져온다.
		int count = srinformationDao.countBySrNo(srNO + "%");
		String number = (count + 1) + "";
		while (number.length() < 4) {
			number = "0" + number;
		}

		srNO = srNO + "-" + number;
		log.info(srNO);
		return srNO;
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * @return 개발부서 조회
	 */
	@Override
	public List<Dept> getDeptList() {
		List<Dept> deptList = srinformationDao.selectDept();
		return deptList;
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * @return sr계획정보 부서의 담당자 조회
	 */
	@Override
	public Manager getFlnmByDeptCd(String deptCd) {
		return srinformationDao.selectFlnmByDeptCd(deptCd);

	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-02
	 * @return sr계획정보 부서 변경
	 */
	@Override
	public void updateSrInfo(SrplanInformation srplanInfomation) {
		srinformationDao.updateSrInfo(srplanInfomation);
	}

	/*
	 * 페이징 처리를 위한 전체 행수 조회
	 * 
	 * @author 안한길 작성일자 : 2023-03-06
	 * 
	 * @return 결과 행수
	 */
	@Override
	public int getTotalRow(int page, SrInfoFilter srInfoFilter) {
		return srinformationDao.selectTotalRow(page, srInfoFilter);
	}

	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-03
	 * @return 개발취소시 sr정보 진행여부 false(0)으로 수정
	 */
	@Override
	public void updatePrgrsBySrNo(String srNo) {
		srinformationDao.updatePrgrsBySrNo(srNo);
	}
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-08
	 * @return 개발취소시 계획종료일 SYSDATE
	 */
	public void updateEndYmdBySrNo(String srNo) {
		srinformationDao.updateEndYmdBySrNo(srNo);
	}

	/**
	 * 고객이 문의글 작성 시 : 자신의 모든 진척-요청번호를 보여주기 위함
	 * @author 신정은
	 */
	public List<SRKeyDto> getSrNoAndDmndNo(String custId) {
		return srinformationDao.selectSrNoAndDmndNoByCustId(custId);
	}
	
	/**
	 * 
	 * @author 여수한
	 * 작성일자 : 2023-03-09
	 * @return 반영요청 수락시 SR진척에서 계획종료일 update
	 */
	@Override
	public void endYmd(String dmndNo) {
		srinformationDao.updateEndYmdByDmndNo(dmndNo);
	}
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-13
	 * @return sr진척 엑셀 다운로드 목록 조회
	 */
	@Override
	public List<SrinformationList> getExcelList(SrInfoFilter srInfoFilter, String sort) {
		List<SrinformationList> srlist = srinformationDao.selectInfoAllToExcel(srInfoFilter, sort);
		return srlist;
	}
	/**
	 * 
	 * @author 여수한 작성일자 : 2023-03-13
	 * @return sr진척 엑셀 다운로드
	 */
	private void setHeaderCS(CellStyle cs, Font font, Cell cell) {
		  cs.setAlignment(CellStyle.ALIGN_CENTER);
		  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		  cs.setBorderTop(CellStyle.BORDER_THIN);
		  cs.setBorderBottom(CellStyle.BORDER_THIN);
		  cs.setBorderLeft(CellStyle.BORDER_THIN);
		  cs.setBorderRight(CellStyle.BORDER_THIN);
		  cs.setFillForegroundColor(HSSFColor.GREY_80_PERCENT.index);
		  cs.setFillPattern(CellStyle.SOLID_FOREGROUND);
		  setHeaderFont(font, cell);
		  cs.setFont(font);
		  cell.setCellStyle(cs);
		}
		 
		private void setHeaderFont(Font font, Cell cell) {
		  font.setBoldweight((short) 700);
		  font.setColor(HSSFColor.WHITE.index);
		}
		 
		private void setCmmnCS2(CellStyle cs, Cell cell) {
		  cs.setAlignment(CellStyle.ALIGN_LEFT);
		  cs.setVerticalAlignment(CellStyle.VERTICAL_CENTER);
		  cs.setBorderTop(CellStyle.BORDER_THIN);
		  cs.setBorderBottom(CellStyle.BORDER_THIN);
		  cs.setBorderLeft(CellStyle.BORDER_THIN);
		  cs.setBorderRight(CellStyle.BORDER_THIN);
		  cell.setCellStyle(cs);
		}
	@Override
	public void SrListdownload(List<SrinformationList> srlist, HttpServletRequest request,
			HttpServletResponse response)throws Exception {
		SXSSFWorkbook wb = new SXSSFWorkbook();
		  Sheet sheet = wb.createSheet();
		  sheet.setColumnWidth((short) 0, (short) 1000);
		  sheet.setColumnWidth((short) 1, (short) 4500);
		  sheet.setColumnWidth((short) 2, (short) 7000);
		  sheet.setColumnWidth((short) 3, (short) 8000);
		  sheet.setColumnWidth((short) 4, (short) 15000);
		  sheet.setColumnWidth((short) 5, (short) 2000);
		  sheet.setColumnWidth((short) 6, (short) 3000);
		  sheet.setColumnWidth((short) 7, (short) 3000);
		  Row row = sheet.createRow(0);
		  Cell cell = null;
		  CellStyle cs = wb.createCellStyle();
		  Font font = wb.createFont();
		  cell = row.createCell(0);
		  cell.setCellValue("SR진척목록 리스트");
		  setHeaderCS(cs, font, cell);
		  sheet.addMergedRegion(new CellRangeAddress(row.getRowNum(), row.getRowNum(), 0, 8));
		  
		  row = sheet.createRow(1);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont();
		  
		  cell = row.createCell(0);
		  cell.setCellValue("번호");
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(1);
		  cell.setCellValue("SR번호");
		  setHeaderCS(cs, font, cell);
		 
		  cell = row.createCell(2);
		  cell.setCellValue("시스템구분");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue("업무구분");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(4);
		  cell.setCellValue("SR명");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue("요청자");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(6);
		  cell.setCellValue("완료요청일");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(7);
		  cell.setCellValue("완료예정일");
		  setHeaderCS(cs, font, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue("진행상태");
		  setHeaderCS(cs, font, cell);
		  
		  int i = 2;
		  int ii = srlist.size();
		  for (SrinformationList srinformationList : srlist) {
		      
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		String bgngYmd = sdf.format(srinformationList.getBgngYmd());
		String endYmd = sdf.format(srinformationList.getEndYmd());
		  row = sheet.createRow(i);
		  cell = null;
		  cs = wb.createCellStyle();
		  font = wb.createFont();
		  
		  cell = row.createCell(0);
		  cell.setCellValue(ii);
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(1);
		  cell.setCellValue(srinformationList.getSrNo());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(2);
		  cell.setCellValue(srinformationList.getSysNm());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(3);
		  cell.setCellValue(srinformationList.getTaskSeNm());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(4);
		  cell.setCellValue(srinformationList.getTtl());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(5);
		  cell.setCellValue(srinformationList.getFlnm());
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(6);
		  cell.setCellValue(bgngYmd);
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(7);
		  cell.setCellValue(endYmd);
		  setCmmnCS2(cs, cell);
		  
		  cell = row.createCell(8);
		  cell.setCellValue(srinformationList.getSttsNm());
		  setCmmnCS2(cs, cell);
		  
		  i++;
		  ii--;
		}
		  response.setHeader("Set-Cookie", "fileDownload=true; path=/");
		  response.setHeader("Content-Disposition", String.format("attachment; filename=\"SrInformationList.xlsx\""));
		  wb.write(response.getOutputStream());
		}

	/*
	 * 해당 관리자가 담당하는 가장 최근의 요청에대한 진척번호 조회
	 * @author 신정은
	 */
	public String getMaxSrNo(String picId) {
		return srinformationDao.selectMaxSrNoByPicId(picId);
	}

	@Override
	public void downloadExcel(List<SrinformationList> srlist, HttpServletRequest request, HttpServletResponse response)
			throws Exception {		
	}
}
