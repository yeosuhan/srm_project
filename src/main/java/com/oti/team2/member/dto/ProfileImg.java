package com.oti.team2.member.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString(exclude = "fileData")
public class ProfileImg {
	private String fileType;
	private byte[] fileData;
}
