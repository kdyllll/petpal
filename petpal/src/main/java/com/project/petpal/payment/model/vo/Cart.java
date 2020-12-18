package com.project.petpal.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Cart {
	private String productName;
	private String fileName;
	private String color;
	private String productSize;
	private int count;
	private int price;
	private int sale;
	private int stock;
	private String memberNo;
	private String stockNo;
	private int totalPrice;
}
