package com.project.petpal.common;

import java.util.Comparator;

import com.project.petpal.store.model.vo.Product;

public class DateSort implements Comparator {


	@Override
	public int compare(Object o1, Object o2) {
		Product p1=(Product)o1;
		Product p2=(Product)o2;
		return p2.getEnrollDate().compareTo(p1.getEnrollDate());
	}

}	
