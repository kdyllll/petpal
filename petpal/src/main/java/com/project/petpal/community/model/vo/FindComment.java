package com.project.petpal.community.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class FindComment {
	private String findCommentNo;
	private String findNo;
	private String memberNo;
	private String commentLevel;
	private String findComment;
	private String commentRef;
	private Date writeDate;
	private String img;
	private String nickName;
	private String status;
}
