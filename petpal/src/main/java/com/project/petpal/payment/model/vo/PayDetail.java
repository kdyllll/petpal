package com.project.petpal.payment.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
public class PayDetail {
	private String detailNo;
	private String paymentNo;
	private String stockNo;
	private int cnt;
	private String detailStatus;
}
