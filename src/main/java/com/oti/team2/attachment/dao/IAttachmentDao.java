package com.oti.team2.attachment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.attachment.dto.AttachResponseDto;
import com.oti.team2.attachment.dto.Attachment;

public interface IAttachmentDao {
	
	/**
	 * 파일 저장
	 * @author 신정은
	 */
	int insertAttachment(@Param("attachList")List<Attachment> attachList);
	
	/**
	 * 게시판 or sr요청 관련된 첨부파일 가져오기
	 * @author 신정은
	 */
	List<AttachResponseDto> selectAttachByBbsNoOrDmndNo(@Param("bbsNo")Integer bbsNo, @Param("dmndNo") String dmndNo);

	/**
	 * 파일 다운로드
	 * @author 신정은
	 */
	AttachResponseDto selectAttachByFileSn(int fileSn);

	/**
	 * 파일 삭제
	 * @author 신정은
	 */
	int deleteAttachByFileSn(int fileSn);
	
	/**
	 * 파일번호로 해당 게시글 번호 가져오기
	 * @author 신정은
	 */
	int selectBbsNoByFilseSn(int fileSn);
	
	/**
	 * 해당 게시글의 총 파일 수 가져오기
	 * @author 신정은
	 */
	int countFilesByBbsNo(int bbsNo);
	
}
