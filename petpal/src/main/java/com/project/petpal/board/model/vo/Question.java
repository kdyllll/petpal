package com.project.petpal.board.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Question {
	private String questionNo;
	private String memberNo;
	private String title;
	private String content1;
	private String content2;
	private Date writeDate;
}
