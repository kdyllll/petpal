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
public class DailyComment {
	private String dailyCommentNo;
	private String dailyNo;
	private String memberNo;
	private String commentLevel;
	private String dailyComment;
	private String commentRef;
	private Date writeDate;
	private String img;
	private String nickName;
	
}
