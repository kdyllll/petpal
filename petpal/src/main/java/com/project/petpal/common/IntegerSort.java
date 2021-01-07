package com.project.petpal.common;

import java.util.Comparator;

import com.project.petpal.store.model.vo.Product;

public class IntegerSort implements Comparator{

	@Override
	public int compare(Object o1, Object o2) {
		Product p1=(Product)o1;
		Product p2=(Product)o2;
		Integer i1=p1.getCnt();
		Integer i2=p2.getCnt();
		return i2.compareTo(i1);
	}

}
