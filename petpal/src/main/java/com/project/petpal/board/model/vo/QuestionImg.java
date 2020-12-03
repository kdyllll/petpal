package com.project.petpal.board.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class QuestionImg {
	private String questionImgNo;
	private String questionNo;
	private String mainImg;
	private String contentImg;
	private String content;
}
