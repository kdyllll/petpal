package com.project.petpal.community.model.vo;


import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class TipImg {
	private String tipImgNo;
	private String tipNo;
	private String mainImg;
	private String contentImg;
	private String content;
}
