package com.project.petpal.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class Payment {
	private String paymentNo;
	private String memberNo;
	private String name;
	private String receiverName;
	private String tel;
	private String receiverTel;
	private String loc;
	private String memo;
	private int point;
	private int pointPlus;
	private int pointMinus;
	private int totalPrice;
	private String payKind;
	private String payDate;
	private String deliveryStatus;
	private String payStatus;
	private String email;
	private String orderNo;
	private String refundName;
	private String refundBank;
	private String refundAccount;
}
