package com.project.petpal.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class NoticeImg {
	private String noticeImgNo;
	private String noticeNo;
	private String contentImg;
	private String content;
}
