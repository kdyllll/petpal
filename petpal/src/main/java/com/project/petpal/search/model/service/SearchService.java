package com.project.petpal.search.model.service;

import java.util.List;
import java.util.Map;

import com.project.petpal.store.model.vo.Product;

public interface SearchService {
	List<Product> searchProduct(String[] keywords);
	List<Product> searchSoldOutList(String[] keywords);
	int searchProductCount(String[] keywords);
	int searchSoldOutProductCount(String[] kewywords);

}
