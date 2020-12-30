package com.project.petpal.common;

public class AjaxPageBarFactory {
	public static String getPageBar(int totalData,int cPage,int numPerPage,String uri,String productNo,String con,String memberNo,String func) {

		String pageBar="";
		
		int pageBarSize=5;
		
		int totalPage=(int)Math.ceil((double)totalData/numPerPage);
		int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
		int pageEnd=pageNo+pageBarSize-1;
		
		pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
		
		if(pageNo==1) {
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<button class='btn btn-link text-secondary ' onclick='javascript:fn_"+func+"("+(pageNo-1)+")'>이전</button>";
			pageBar+="</li>";
		}
		
		while(!(pageNo>pageEnd||pageNo>totalPage)) {
			if(pageNo==cPage) {
				pageBar+="<li class='page-item'>";
				pageBar+="<button class='btn btn-link text-hgh' onclick='#'>"+pageNo+"</button>";
				pageBar+="</li>";
			}else {
				pageBar+="<li class='page-item'>";
				pageBar+="<button class='btn btn-link text-secondary ' onclick='javascript:fn_"+func+"("+(pageNo)+")'>"+pageNo+"</button>";
				pageBar+="</li>";
			}
			pageNo++;
		}
		
		if(pageNo>totalPage) {
		}else {
			pageBar+="<li class='page-item'>";
			pageBar+="<button class='btn btn-link text-secondary ' onclick='javascript:fn_"+func+"("+(pageNo)+")'>다음</button>";
			pageBar+="</li>";
		}
	
		pageBar+="</ul>";
		
		pageBar+="<script>";
		
		pageBar+="function fn_"+func+"(cPage){";
			pageBar+="$.ajaxSettings.traditional = true;";
			pageBar+="$.ajax({";
				pageBar+="url:'"+uri+"',";
				pageBar+="data:{cPage:cPage" +(productNo==null?"":",productNo:"+productNo)+ (memberNo==null?"":",memberNo:"+memberNo)+ "},";
				pageBar+="dataType:'html',";
				pageBar+="success:(data)=>{";
				pageBar+="$('"+con+"').html(data);";
			pageBar+="}";
			pageBar+="});";
		pageBar+="}";
		
		pageBar+="</script>";
		
		return pageBar;
	}

}
