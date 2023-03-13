package com.oti.team2.comment.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.oti.team2.comment.dto.CommentReqDto;
import com.oti.team2.comment.dto.CommentResDto;

public interface ICommentDao {
	/**
	 * 댓글 작성
	 * @author 신정은
	 */
	int insertComment(@Param("commentReqDto")CommentReqDto commentReqDto);
	
	/**
	 * 댓글 조회
	 * @author 신정은
	 */
	List<CommentResDto> selectCommentsByBbsNo(@Param("bbsNo")int bbsNo);
	
	/**
	 * 댓글 삭제
	 * @author 신정은
	 */
	int deleteCommentByCmntNo(@Param("cmntNo")int cmntNo);
}
