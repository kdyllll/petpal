package com.project.petpal.payment.model.service;

import java.util.List;
import java.util.Map;

public interface CartService {
	List<Map> cartList(String memberNo);
	List<Map> cartListNonMember(List<String> stockNo);
	int deleteCart(String[] stockNo);
}
