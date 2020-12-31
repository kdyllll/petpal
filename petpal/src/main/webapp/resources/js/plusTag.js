//상품+태그
   //+태그!
	//상품 입력    
    $('.modal').on('shown.bs.modal', function(){
      //모달 켜지면 상품입력 태그에 포커스
      $('#productNameInput').trigger('focus');
    });

    var percentX;
    var percentY;
    var xx;
    var yy;
    var target;
    $(document).on('click','.previewImg',e=>{
      target=$(e.target);
      var clickX=e.offsetX;//클릭한 위치X좌표
      var clickY=e.offsetY;//클릭한 위치Y좌표
      var x=target.width();//클릭한 이미지의 높이
      var y=target.height();//클릭한 이미지의 넓이
      
      percentX=clickX/x*100;//클릭한 위치의 상대적인 퍼센트X좌표값
      percentY=clickY/y*100;//클릭한 위치의 상대적인 퍼센트Y좌표값
      xx=percentX-15;
      yy=percentY+5;
    });

    //좌표 등록하기
    $("#insert").on("click",e=>{//등록버튼 눌렀을때
        var name=$("#productNameInput").val();
        var img="";
        //입력한 상품 이름이 있는 상품이 아니면 등록 못하게 유효성 검사하기        
        //태그를 입력하면 +태그와 함께 호버하면 나타나는 상품정보
        $.ajax({
			url:path+"/daily/dailyProduct.do",
			data:{name:name},
			success:data => {	
				img=`<div class="plusTag">
	                  <svg class="plusBtn position-absolute" width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-plus-circle-fill" fill="currentColor" xmlns="http://www.w3.org/2000/svg"
		                    style="top:`+percentY+`%; left:`+percentX+`%;">
		                    <path fill-rule="evenodd" d="M16 8A8 8 0 1 1 0 8a8 8 0 0 1 16 0zM8.5 4.5a.5.5 0 0 0-1 0v3h-3a.5.5 0 0 0 0 1h3v3a.5.5 0 0 0 1 0v-3h3a.5.5 0 0 0 0-1h-3v-3z"/>
		                </svg>
		                <input type="hidden" name="productNo" value="`+data.productNo+`"/>
		                <input type="hidden" name="percentX" value="`+percentX+`"/>
		                <input type="hidden" name="percentY" value="`+percentY+`"/>
		                <input type="hidden" name="index" value=""/>
		                <div class="bubble rounded shadow-sm col-4 col-lg-4 position-absolute px-1" style="top:`+yy+`%; left:`+xx+`%;">
		                  <div class="row d-flex flex-wrap m-0 py-2" style="width:100%;">
		                    <img class="col-4 border p-0 m-0 ml-1" src="${path }/resources/upload/product/detail/`+data.imgName+`">
		                     <div class="p-1 ml-2 mb-0 col-7">
		                    	<p>`+name+`</p>
		                    	<div class="d-flex justify-content-end">
			                    	<button type="button" class="deleteTag btn p-0 row pr-3">
				                      <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-dark" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
				                        <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
				                        <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
				                      </svg>
				                    </button>
			                    </div>
		                    </div>
		                  </div>
		                </div>
		              </div>`;
				target.parent("div.imgBox").append(img);
		        $(".bubble").hide();
			},
			error:(request,status,error)=>{
                alert("잘못된 상품 정보입니다.");
            }
		})
        
      });
    
    //상품이름 자동완성
    $("#productNameInput").keyup(e=>{
			$.ajax({
            url:path+"/daily/autoCompleteAjax.do",
            data:{key:$(e.target).val()},
            success:data => { 
                $("#productData").html("");
                for(let d in data){
                	$("#productData").append($("<option>").html(data[d].productName));
                }
            }
        });
	});
    
  //모달창 닫힐때 form 초기화
    $('.modal').on('hidden.bs.modal', function (e) {
      $(this).find('form')[0].reset()
    });
    
    //+태그 삭제 기능
    $(document).on('click',".deleteTag",e=>{
    	$(e.target).parents(".plusTag").remove();
    });
    
    //말풍선 호버
    //+에 마우스 올렸을 때/떠났을 때 말풍선 보이고 숨기기
    $(document).on('mouseenter',".plusBtn",e=>{  //동적 처리에는 hover를 못씀	
      //console.log("마우스 들어옴 mouseenter/mouseover");
      $(e.target).siblings(".bubble").show();
    });
    $(document).on('mouseleave',".plusBtn",e=>{
      //console.log("마우스 떠남 mouseleave/mouseout");
      $(e.target).siblings(".bubble").hide();
    });