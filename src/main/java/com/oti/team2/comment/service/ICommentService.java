package com.oti.team2.comment.service;

import java.util.List;

import com.oti.team2.comment.dto.CommentReqDto;
import com.oti.team2.comment.dto.CommentResDto;

public interface ICommentService {
	/**
	 * 댓글 작성
	 * @author 신정은
	 */
	void addComment(CommentReqDto commentReqDto);
	
	/**
	 * 댓글 조회
	 * @author 신정은
	 */
	List<CommentResDto> getComments(int bbsNo);
	
	/**
	 * 댓글 삭제
	 * @author 신정은
	 */
	void deleteComment(int cmntNo);
}
