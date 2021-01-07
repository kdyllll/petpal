package com.project.petpal.common;

import java.util.Comparator;

import com.project.petpal.store.model.vo.Product;

public class StarSort implements Comparator {


	@Override
	public int compare(Object o1, Object o2) {
		Product p1=(Product)o1;
		Product p2=(Product)o2;
		Double d1=p1.getStar();
		Double d2=p2.getStar();
		
		return d2.compareTo(d1);
	}

}
