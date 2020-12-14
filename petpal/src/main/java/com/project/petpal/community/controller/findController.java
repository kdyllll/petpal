package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.community.model.service.FindService;
import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

@Controller
public class findController {
	
	@Autowired
	public FindService service;
	
	@RequestMapping("/community/findList.do")
	public String findList() {
		return "community/findList";
	}
	@RequestMapping("/community/findWrite.do")
	public String findWrite() {
		return "community/findWrite";
	}
	@RequestMapping("/community/findWriteEnd.do")
	public String findWriteEnd(HttpSession session, Find find, @RequestParam(value="contentImg", required=false) MultipartFile[] contentImg, @RequestParam(value="mainImg" , required = false) MultipartFile mainImg) {

		String path = session.getServletContext().getRealPath("/resources/upload/find");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
		String mainReName="";
		FindImg fi = null;
		if(!mainImg.isEmpty()) {
			String originalName = mainImg.getOriginalFilename();
			String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
			// 리네임 규칙
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndValue = (int) (Math.random() * 10000);
			mainReName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
			try {
				mainImg.transferTo(new File(path + "/" + mainReName));
			} catch (IOException e) {
				e.printStackTrace();
			}
			fi = FindImg.builder().fileName(mainReName).imgStatus("M").build();
		}
		
		List<FindImg> subImgs = new ArrayList();
		for(MultipartFile mf : contentImg) {
			if(!mf.isEmpty()) {
				String originalName = mf.getOriginalFilename();
				String ext = originalName.substring(originalName.lastIndexOf(".") + 1);
				// 리네임 규칙
				SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
				int rndValue = (int) (Math.random() * 10000);
				String reName = sdf.format(System.currentTimeMillis()) + "_" + rndValue + "." + ext;
				try {
					mf.transferTo(new File(path + "/" + reName));
				} catch (IOException e) {
					e.printStackTrace();
				}
				FindImg cfi = FindImg.builder().fileName(reName).imgStatus("S").build();
				subImgs.add(cfi);
			}
		}
		
		System.out.println(find);
		int result = service.insertFindWrite(find,subImgs, fi);
		return "community/findWrite";
	}
}
