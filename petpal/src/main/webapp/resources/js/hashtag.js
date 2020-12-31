//해시태그!
// 글자 수에 따라 input태그 크기 늘어나기

 $('.hashtag').on('keydown',e=>{
    var value = $(e.target).val().trim();
    $("#tagCon").append('<div id="virtual_dom" style="display: inline-block;">' + value + '</div>'); 
   
    if($('#virtual_dom').width()<$("#tagCon").width()-70){
    var inputWidth =  $('#virtual_dom').width()+15; 
    }else{
      var inputWidth=$("#tagCon").width()-70;
    }
    //console.log(inputWidth);
    $(e.target).css('width', inputWidth); 
    $('#virtual_dom').remove();
  });
  
// 해시태그 작성 후 새 해시태그 추가

$('.hashtag').focusout(function(e) {  
	 let cnt=0;
	 $("input[name=hashtag]").each((i,item)=>{//해시태그 중복 입력 확인
			 if($(item).val().trim()==$(e.target).val().trim()){
				 cnt++;
			 }
	 });
  if($(e.target).val().trim().length==0){
    //아무일도 일어나지 않음!
  }else if(cnt>1){//중복되었다면
	   alert("해시태그는 중복해서 입력할 수 없습니다.");
  	   $(e.target).val("");
  }else if($(e.target).hasClass("hashtag") === true){
    //해시태그 작성 태그 복제
    var clone=$(e.target).parents(".tagBox").clone(true);
    console.log($(e.target).val());
    clone.find(".hashtag").val(""); 
    clone.find(".hashtag").css("width","75px");   
    //태그 수정 불가능하게 막음                     
    $(e.target).attr("readonly",true);
    //$(e.target).css("width",$(e.target).width()-15);
    //x버튼 보이게
    $(e.target).next("span.delete").removeClass("d-none");
    //새 해시태그 입력창 추가
    $("#tagCon").append(clone);
    $(e.target).removeClass("hashtag");  
    if(e.originalEvent==undefined){//엔터키로 눌렀을때
        $("#tagCon").find(".hashtag").focus();
    } 
  }                                         
});
// 해시태그 x버튼 누르면 삭제
$(".delete").click(function(e){
  $(e.target).parents(".tagBox").remove();
});