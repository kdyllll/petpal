package com.project.petpal.store.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@NoArgsConstructor
@AllArgsConstructor
@Data
public class Stock {

	private String stockNo;
	private String productNo;
	private String color;
	private String productSize;
	private int stock;
	private int price;
	private int sale;
}
