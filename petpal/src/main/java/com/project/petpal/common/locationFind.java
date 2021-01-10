package com.project.petpal.common;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class locationFind {
	
	@RequestMapping("/location/locationFind.do")
	public String locationFind() {
		
		return "/location/locationFind";
	}
}
