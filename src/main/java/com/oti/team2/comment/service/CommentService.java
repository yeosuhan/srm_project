package com.oti.team2.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.comment.dao.ICommentDao;
import com.oti.team2.comment.dto.CommentReqDto;
import com.oti.team2.comment.dto.CommentResDto;

@Service
public class CommentService implements ICommentService{

	@Autowired
	private ICommentDao commentDao;
	/**
	 * 댓글 작성
	 * @author 신정은
	 */
	public void addComment(CommentReqDto commentReqDto) {
		commentDao.insertComment(commentReqDto);
	}

	/**
	 * 댓글 조회
	 * @author 신정은
	 */
	public List<CommentResDto> getComments(int bbsNo) {
		return commentDao.selectCommentsByBbsNo(bbsNo);
	}

	/**
	 * 댓글 삭제
	 * @author 신정은
	 */
	public void deleteComment(int cmntNo) {
		commentDao.deleteCommentByCmntNo(cmntNo);
	}

}
