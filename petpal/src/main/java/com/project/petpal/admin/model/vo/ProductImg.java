package com.project.petpal.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductImg {
	private String productImgNo;
	private String productNo;
	private String imgName;
	private String type;
}
