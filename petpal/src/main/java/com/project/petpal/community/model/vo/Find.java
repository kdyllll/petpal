package com.project.petpal.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Builder
@Data
public class Find {
	public String findNo;
	public String memberNo;
	public String status;
	public String address;
	public String content;
	public String title;
	public String enrollDate;
}
