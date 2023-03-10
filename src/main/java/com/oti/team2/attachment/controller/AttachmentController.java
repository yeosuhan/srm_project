package com.oti.team2.attachment.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;

import com.oti.team2.attachment.dto.AttachResponseDto;
import com.oti.team2.attachment.dto.OTIFilePath;
import com.oti.team2.attachment.service.IAttachmentService;

import lombok.extern.log4j.Log4j2;

@RequestMapping("/file")
@Controller
@Log4j2
public class AttachmentController {
	
	@Autowired
	private IAttachmentService attachService;

	/**
	 * 파일 다운로드
	 * @author 신정은
	 */
	@GetMapping("/download/{fileSn}")
	public void downloadFile(@PathVariable("fileSn")int fileSn, @RequestHeader("User-Agent") String userAgent, HttpServletResponse response) throws IOException {
		log.info("실행");
		AttachResponseDto attach = attachService.downloadAttach(fileSn);
		String originalName = attach.getOrgnlFileNm();
		String savedName = attach.getFileNm();
		String contentType = attach.getFileType();
		
		// 브라우저 별 인코딩해야 된다.
		if(userAgent.contains("Trident") || userAgent.contains("MSIE")) {
			// Trident IE 11
			// MSIE IE 10이하
			originalName = URLEncoder.encode(originalName, "UTF-8");
		} else {
			// Edge, Chrome, Safari
			originalName = new String(originalName.getBytes("UTF-8"), "ISO-8859-1");
		}
		
		// 응답 헤더 설정
		response.setHeader("Content-Disposition", "attachment; filename=\"" + originalName + "\"");
		response.setContentType(contentType);
		
		// 응답 body에 파일 데이터 실기
		String filePath = OTIFilePath.filePath  + savedName;
		File file = new File(filePath);
		if(file.exists()) {
			InputStream is = new FileInputStream(file);
			OutputStream os = response.getOutputStream();
			FileCopyUtils.copy(is, os);
			os.flush();
			os.close();
			is.close();
		}
	}
	
	/**
	 * 파일 삭제
	 * @author 신정은
	 */
	@GetMapping("/delete/{fileSn}")
	public void deleteFile(@PathVariable("fileSn")int fileSn) {
		
	}

}
