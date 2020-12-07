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
public class Daily {
	private String dailyNo;
	private String memberNo;
	private String content;
	private Date enrollDate;
}
