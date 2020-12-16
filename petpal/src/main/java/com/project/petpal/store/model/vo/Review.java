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
public class Review {
	private String reviewNo;
	private String detailNo;
	private String memberNo;
	private String nickName;
	private String img;
	private String content;
	private String color;
	private String productSize;
	private Date enrollDate;
	private int star;
	private String fileName;
	private String reviewComment;

}
