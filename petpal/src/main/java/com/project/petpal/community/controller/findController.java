package com.project.petpal.community.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.project.petpal.community.model.service.FindService;
import com.project.petpal.community.model.vo.Find;
import com.project.petpal.community.model.vo.FindImg;

import lombok.Builder;

@Controller
public class findController {
	
	@Autowired
	private FindService service;
	
	@RequestMapping("/community/findList.do")
	public String findList(Model model) {
		List<Map> list = service.selectFindList();
		for(Map m : list) {
			System.out.println(m);
		}
		model.addAttribute("list", list);
		return "community/findList";
	}
	@RequestMapping("/community/findWrite.do")
	public String findWrite() {
		return "community/findWrite";
	}
	@RequestMapping("/community/findWriteEnd.do")
	public String findWriteEnd(HttpSession session, Find find, @RequestParam(value="contentImg", required=false) MultipartFile[] contentImg, @RequestParam(value="mainImg" , required = false) MultipartFile mainImg, Model model) {

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
		
		int result = service.insertFindWrite(find,subImgs, fi);

		String msg = "글입력에 실패하였습니다.";
		String loc = "/community/findWrite.do";
		if(result>0) {
			msg="글 입력이 완료되었습니다.";
			loc="/community/findList.do";		
		}
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
	
	@RequestMapping("/community/findDetail.do")
	public String findDetail(HttpServletRequest request, HttpServletResponse response,Model model) {
		String findNo = request.getParameter("findNo");
		Map fDetail = service.detailOne(findNo);
		List<Map> findPics = service.findSubPic(findNo);

		model.addAttribute("fDetail", fDetail);
		model.addAttribute("findPics", findPics);
		return "community/findDetail";
	}
	
	@RequestMapping("/find/findUpdate.do")
	public String findUpdate(String findNo,Model model) {
		
		Map findOne = service.detailOne(findNo);
		List<Map> findPics = service.findSubPic(findNo);
		model.addAttribute("findOne", findOne);
		model.addAttribute("findPics", findPics);
		return "community/findUpdate";
	}
	
	@RequestMapping("/find/findUpdateEnd.do")
	public String findUpdateEnd(String findNo,HttpSession session,
			@RequestParam(value = "mainImg") MultipartFile[] main ,Model model, @RequestParam(value="oriImg") MultipartFile[] oriImg,@RequestParam(value = "oriImgNo", defaultValue = "0") String[] oriImgNo) {
		System.out.println(findNo);
		int mResult = 0;
//		파일 저장경로
		String path = session.getServletContext().getRealPath("/resources/upload/find");
		File dir = new File(path);
		if(!dir.exists()) dir.mkdirs();
//		main이미지		
		/*for(MultipartFile mf: main) {
//			main이미지 안바꿀경우 update안함
			if(mf.isEmpty()) {
				System.out.println("메인사진 update 안함");
			} else {		//메인이미지 바꿀경우만 update	
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
				
				FindImg fi = FindImg.builder().fileName(reName).findNo(findNo).build();
				mResult = service.updateMainImg(fi);
				System.out.println(mResult);
			}
		}*/
		for(MultipartFile t : oriImg) {
			if(t.isEmpty()) {
				System.out.println("서브사진 update 안함");
			} else {
				System.out.println(t.getOriginalFilename());
				
			}
		}
		String loc = "/community/findDetail.do?findNo="+findNo;
		String msg = "test중";
		model.addAttribute("loc", loc);
		model.addAttribute("msg", msg);
		return "common/msg";
	}
}
