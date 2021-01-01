package com.project.petpal.common;

public class PageBarFactory {

	public static String getPageBar(int totalData,int cPage,int numPerpage,String category,String placeNo,String uri,String dailyNo) {
	
		String pageBar="";
	      
	      int pageBarSize=5;
	      
	      int totalPage=(int)Math.ceil((double)totalData/numPerpage);
	      int pageNo=((cPage-1)/pageBarSize)*pageBarSize+1;
	      int pageEnd=pageNo+pageBarSize-1;
	      
	      pageBar+="<ul class='pagination justify-content-center pagination-sm'>";
	      
	      if(pageNo==1) {
	         pageBar+="<li class='page-item disabled'>";
	         pageBar+="<a class='page-link' href='#'>이전</a>";
	         pageBar+="</li>";
	      }else {//6,11,15
	         pageBar+="<li class='page-item'>";
	         pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo-1)+")'>이전</a>";
	         pageBar+="</li>";
	      }
	      
	      while(!(pageNo>pageEnd||pageNo>totalPage)) {//pageNo<pageEnd&&pageNo<totalPage
	         if(pageNo==cPage) {
	            pageBar+="<li class='page-item active'>";
	            pageBar+="<a class='page-link' href='#'>"+pageNo+"</a>";
	            pageBar+="</li>";
	         }else {
	            pageBar+="<li class='page-item'>";
	            pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>"+pageNo+"</a>";
	            pageBar+="</li>";
	         }
	         pageNo++;
	      }
	      
	      if(pageNo>totalPage) {
	         pageBar+="<li class='page-item disabled'>";
	         pageBar+="<a class='page-link' href='#'>다음</a>";
	         pageBar+="</li>";
	      }else {
	         pageBar+="<li class='page-item'>";
	         pageBar+="<a class='page-link' href='javascript:fn_paging("+(pageNo)+")'>다음</a>";
	         pageBar+="</li>";
	      }
	   
	      pageBar+="</ul>";
	      
	      pageBar+="<script>";
	      pageBar+="function fn_paging(cPage){";
	      pageBar+="location.href='"+uri+"?cPage='+cPage"+(category==null?"":"+'&category="+category+"'")+(placeNo==null?"":"+'&placeNo="+placeNo+"'")+(dailyNo==null?"":"+'&dailyNo="+dailyNo+"'");
	      pageBar+="}";
	      pageBar+="</script>";
	      return pageBar;
	}
}
