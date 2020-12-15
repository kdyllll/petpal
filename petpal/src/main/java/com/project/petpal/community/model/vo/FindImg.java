package com.project.petpal.community.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@Builder
@NoArgsConstructor
@Data
public class FindImg {
	public String findImgNo;
	public String findNo;
	public String fileName;
	public String imgStatus;
}
