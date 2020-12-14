package com.project.petpal.community.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
public class findController {
	@RequestMapping("/community/findList.do")
	public String findList() {
		return "community/findList";
	}
	@RequestMapping("/community/findWrite.do")
	public String findWrite() {
		return "community/findWrite";
	}
	@RequestMapping("/community/findWriteEnd.do")
	public String findWriteEnd(String title, String content, String address, @RequestParam(value="contentImg", required=false) MultipartFile[] contentImg, @RequestParam(value="mainImg" , required = false) MultipartFile mainImg) {
		System.out.println(title +" " + content +" " + address);
		System.out.println(mainImg.getOriginalFilename());
		for(MultipartFile mf : contentImg) {
			System.out.println(mf.getOriginalFilename());
		}
		return "community/findWrite";
	}
}
