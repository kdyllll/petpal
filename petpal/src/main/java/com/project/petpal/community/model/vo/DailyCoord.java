package com.project.petpal.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class DailyCoord {

	private String dailyImgNo;
	private String productNo;
	private double xcode;
	private double ycode;
	private String index;
}
