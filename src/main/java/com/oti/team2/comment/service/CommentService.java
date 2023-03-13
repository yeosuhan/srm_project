package com.oti.team2.comment.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oti.team2.comment.dao.ICommentDao;
import com.oti.team2.comment.dto.CommentDto;
import com.oti.team2.comment.dto.CommentReqDto;
import com.oti.team2.comment.dto.CommentResDto;
import com.oti.team2.util.pager.Pager;

import lombok.extern.log4j.Log4j2;

@Service
@Log4j2
public class CommentService implements ICommentService{

	@Autowired
	private ICommentDao commentDao;
	/**
	 * 댓글 작성
	 * @author 신정은
	 */
	public void addComment(CommentReqDto commentReqDto) {
		log.info("서비스 들어옴 ~~~");
		commentDao.insertComment(commentReqDto);
	}

	/**
	 * 댓글 조회
	 * @author 신정은
	 */
	public CommentDto getComments(int bbsNo, int pageNo) {
		int totalRow = commentDao.countCommentByBbsNo(bbsNo);
		Pager pager = new Pager().commentPager(totalRow, pageNo);
		
		log.info(pager);
		List<CommentResDto> list = commentDao.selectCommentsByBbsNo(bbsNo, pager);
		log.info(list);
		CommentDto commentDto = new CommentDto(list, pager);
		return commentDto;
	}

	/**
	 * 댓글 삭제
	 * @author 신정은
	 */
	public void deleteComment(int cmntNo) {
		commentDao.deleteCommentByCmntNo(cmntNo);
	}

}
