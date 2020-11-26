package com.project.petpal.admin.model.service;

import java.util.List;

import com.project.petpal.admin.model.vo.Product;
import com.project.petpal.admin.model.vo.Stock;

public interface AdminService {
	int insertProduct(Product p, List<Stock> stockList);
}
