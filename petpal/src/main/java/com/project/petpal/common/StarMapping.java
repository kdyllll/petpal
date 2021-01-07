package com.project.petpal.common;

import java.util.List;

import com.project.petpal.store.model.vo.Product;

public class StarMapping {

	public static List<Product> starMapping(List<Product> list,List<Product> starList) {
		for(Product p:list) {
			for(Product s:starList) {
				if(p.getProductNo().equals(s.getProductNo())) {
					p.setStar(s.getStar());
				}
			}
		}
		return list;
	}
}
