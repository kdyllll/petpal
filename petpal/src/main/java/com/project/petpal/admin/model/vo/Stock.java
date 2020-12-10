package com.project.petpal.admin.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Stock {
	private String stockNo;
	private String productNo;
	private String color;
	private String productSize;
	private int stock;
	private int price;
	private int sale;
}
