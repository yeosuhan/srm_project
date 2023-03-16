package com.oti.team2.comment.dto;

import java.util.List;

import com.oti.team2.util.pager.Pager;

import lombok.AllArgsConstructor;
import lombok.Data;

@Data
@AllArgsConstructor
public class CommentDto {
	private List<CommentResDto> commentList;
	
	private Pager commpager;

}
