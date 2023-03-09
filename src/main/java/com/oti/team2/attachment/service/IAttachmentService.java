package com.oti.team2.attachment.service;

import com.oti.team2.attachment.dto.AttachResponseDto;

public interface IAttachmentService {
	AttachResponseDto downloadAttach(int fileSn);
}
