package com.project.petpal.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class Member {

	private String memberNo;
	private String email;
	private String password;
	private String memberName;
	private String phone;
	private String[] address;
	private int point;
	private Date enrollDate;
	private String nickName;
	
}
