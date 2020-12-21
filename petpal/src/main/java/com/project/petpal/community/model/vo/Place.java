package com.project.petpal.community.model.vo;








import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Place {

	private String placeNo;
	private String memberNo;
	private String content;
	private String title;
	private String explanation;
	private String placeDate;
	private String category;
	private String[] position;
	private String status;
	private String fileName;
	private String nickName;
	private String img;
	
}
