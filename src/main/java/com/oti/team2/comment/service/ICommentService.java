package com.oti.team2.comment.service;

import com.oti.team2.comment.dto.CommentDto;
import com.oti.team2.comment.dto.CommentReqDto;

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
	CommentDto getComments(int bbsNo, int pageNo);
	
	/**
	 * 댓글 삭제
	 * @author 신정은
	 */
	void deleteComment(int cmntNo);
}
