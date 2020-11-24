package com.project.petpal.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Product {
	private String productNo;
	private String productName;
	private String categoryNo;
	private String fileName;
	private Date enrollDate;
	private String subCate;
}
