package com.project.petpal.search.model.service;

import java.util.List;

import com.project.petpal.store.model.vo.Product;

public interface SearchService {
	List<Product> searchProduct(String keyword);

}
