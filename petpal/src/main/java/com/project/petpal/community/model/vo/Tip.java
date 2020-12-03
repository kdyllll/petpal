package com.project.petpal.community.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Tip {
	private String tipNo;
	private String memberNo;
	private String category;
	private Date enrollDate;
	private String title;
	private String content1;
	private String content2;
}