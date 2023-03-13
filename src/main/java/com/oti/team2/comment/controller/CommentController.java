package com.oti.team2.comment.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.oti.team2.comment.dto.CommentDto;
import com.oti.team2.comment.dto.CommentReqDto;
import com.oti.team2.comment.service.ICommentService;

import lombok.extern.log4j.Log4j2;

@Controller
@Log4j2
@RequestMapping("/comment")
public class CommentController {
	
	@Autowired
	private ICommentService commentService;
	
	@PostMapping("/write")
	public String addComment(CommentReqDto commentReqDto) {
		log.info(commentReqDto);
		commentService.addComment(commentReqDto);
		return "redirect:/board/list?type=qna&bbsNo=" + commentReqDto.getBbsNo();
	}
	
	@GetMapping("/delete/{bbsNo}")
	public String deleteComment(@PathVariable("bbsNo") int bbsNo, @RequestParam("cmntNo") int cmntNo) {
		log.info(cmntNo);
		commentService.deleteComment(cmntNo);
		return "redirect:/board/list?type=qna&bbsNo=" + bbsNo;
	}
	
	@GetMapping("/list/{bbsNo}")
	public String getComments(@PathVariable("bbsNo") int bbsNo, @RequestParam("page") int page, Model model) {
		CommentDto cdto = commentService.getComments(bbsNo, page);
		model.addAttribute("comments", cdto);
		log.info(cdto);
		return "board/comments";
	}
}
