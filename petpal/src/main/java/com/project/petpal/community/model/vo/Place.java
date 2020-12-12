package com.project.petpal.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Place {

	private String placeNo;
	private String memberNo;
	private String content;
	private String title;
	private String explanation;
	private String enrollDate;
	private String category;
	private String address;
	private String status;
}
