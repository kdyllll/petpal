package com.project.petpal.store.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Product {

	private String productNo;
	private String categoryNo;
	private String productName;
	private String fileName;
	private Date enrollDate;
	private String subcate;
	private int price;
	private int sale;
	private int star;
	
}
