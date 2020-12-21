package com.project.petpal.store.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Qna {

	private String qnaNo;
	private String productNo;
	private String memberNo;
	private String content;
	private String qnaComment;
	private Date enrollDate;
	private Date commentDate;
	private String category;
	private String secret;
	private String nickName;
	
	
}
