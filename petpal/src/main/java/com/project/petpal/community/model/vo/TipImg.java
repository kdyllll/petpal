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
public class TipImg {
	private String tipImgNo;
	private String tipNo;
	private String content;
	private String fileName;
}
