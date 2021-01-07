package com.project.petpal.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DailyImg {

	private String dailyImgNo;
	private String dailyNo;
	private String dailyImgName;
	private String status;
	
}
