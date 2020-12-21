package com.project.petpal.community.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class PlaceComment {

	private String placeCommentNo;
	private String placeNo;
	private String memberNo;
	private int commentLevel;
	private String placeComment;
	private String commentRef;
	private String writeDate;
}
