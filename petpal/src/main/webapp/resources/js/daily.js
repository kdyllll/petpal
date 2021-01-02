	//사진 입력 취소했을 때 원래 사진 날아가는 것 대비하기
    var clone;
    $(document).on('click','.upload',e=>{//파일 입력할때 미리 입력태그 클론만들기
     clone=$(e.target).clone(true);
    });

	//사진미리보기
	$(document).on('change','.upload',e=>{ 
        if (e.target.value.length==0) {//파일 입력 취소 누르면 원래 사진 유지하도록
			let label=$(e.target).parents(".addPic");
			$(e.target).remove();//값 없어진 인풋 지우고
			label.prepend(clone);//미리 복사해놓은 인풋태그로 대체
        }else{
		   let next=$(e.target).parents(".addPic").next(".imgBox");
		   if(next.length==0){//해당 미리보기가 없으면 == 변경이 아니고 사진 추가라면
		       $.each(e.target.files,(i,v)=>{//미리보기 로직         
		           let reader=new FileReader();
		           reader.onload=e=>{                              
		               let img=` <div class="imgBox position-relative rounded col-12 p-0 mt-5">              		
					                <img src="`+e.target.result+`" class="col-12 p-0 rounded previewImg" style="width:100%;" data-toggle="modal" data-target="#plusTagModal">	
					                <div class="buttonCon position-absolute rounded" style="bottom:0; left:0; background:linear-gradient(to top,rgba(0, 0, 0, 0.5),rgba(255, 255, 255, 0)); width:100%;">
					                     <button type="button" class="delete btn ml-3">
					                       <svg width="1em" height="1em" viewBox="0 0 16 16" class="bi bi-trash text-white" fill="currentColor" xmlns="http://www.w3.org/2000/svg">
					                         <path d="M5.5 5.5A.5.5 0 0 1 6 6v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm2.5 0a.5.5 0 0 1 .5.5v6a.5.5 0 0 1-1 0V6a.5.5 0 0 1 .5-.5zm3 .5a.5.5 0 0 0-1 0v6a.5.5 0 0 0 1 0V6z"/>
					                         <path fill-rule="evenodd" d="M14.5 3a1 1 0 0 1-1 1H13v9a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2V4h-.5a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1H6a1 1 0 0 1 1-1h2a1 1 0 0 1 1 1h3.5a1 1 0 0 1 1 1v1zM4.118 4L4 4.059V13a1 1 0 0 0 1 1h6a1 1 0 0 0 1-1V4.059L11.882 4H4.118zM2.5 3V2h11v1h-11z"/>
					                       </svg>
					                     </button>
						                 <button class="update btn ml-3" type="button">
						                     	<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-arrow-counterclockwise text-white" viewBox="0 0 16 16">
												  <path fill-rule="evenodd" d="M8 3a5 5 0 1 1-4.546 2.914.5.5 0 0 0-.908-.417A6 6 0 1 0 8 2v1z"/>
												  <path d="M8 4.466V.534a.25.25 0 0 0-.41-.192L5.23 2.308a.25.25 0 0 0 0 .384l2.36 1.966A.25.25 0 0 0 8 4.466z"/>
												</svg>
										 </button>
					                </div>`;
		               $("#imgContainer").append(img);
		               fn_add(); //사진 추가하기 버튼 추가
		           }
		           reader.readAsDataURL(v);
		       });    
		   }else{
			   changeThum(e,next); 
		   }
		} 
	});
   
   //사진 추가하기 버튼 추가
     function fn_add(){
       $("#imgContainer").find(".addPic").hide();
       if($(".imgBox").length!=5){  
         let label=`<label class="addPic rounded text-center bg-light btn btn-block mt-3" style="cursor: pointer; height:50px;">
			        	 <input name="pic" class="d-none upload" type="file" accept="images/*"/>
			             <svg width="40px" height="40px" viewBox="0 0 16 16" class="bi bi-camera-fill text-secondary" fill="currentColor" xmlns="http://www.w3.org/2000/svg" style="font-size: 60px;">
			                  <path d="M10.5 8.5a2.5 2.5 0 1 1-5 0 2.5 2.5 0 0 1 5 0z"/>
			                  <path fill-rule="evenodd" d="M2 4a2 2 0 0 0-2 2v6a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V6a2 2 0 0 0-2-2h-1.172a2 2 0 0 1-1.414-.586l-.828-.828A2 2 0 0 0 9.172 2H6.828a2 2 0 0 0-1.414.586l-.828.828A2 2 0 0 1 3.172 4H2zm.5 2a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1zm9 2.5a3.5 3.5 0 1 1-7 0 3.5 3.5 0 0 1 7 0z"/>
			              </svg>
			             <span class="h5 text-secondary align-middle mb-0 ml-3"><strong>추가하기</strong></span><span class="text-secondary ml-1">*최대 5장</span>
			           
                   </label>`;
         $("#imgContainer").append(label);
       };
     };
   
   //사진 변경되었을 때 미리보기 변경
	function changeThum(e,imgBox){
		let img=imgBox.find(".previewImg");
		let tag=imgBox.find(".plusTag");
		 $.each(e.target.files,(i,v)=>{
			 let reader=new FileReader();
	         reader.onload=e=>{                              
	             img.attr("src",e.target.result); //미리보기 이미지 변경
	             tag.remove();//상품 태그 삭제
	         }
	         reader.readAsDataURL(v);
		 });  
	}

	//사진 삭제되면
	 $(document).on('click','.delete',e=>{
	       let imgBox=$(e.target).parents(".imgBox");
	       let picInput=imgBox.prev("label.addPic");
	       imgBox.remove();
	       picInput.remove();       
	       fn_add();           
	 }); 

	//사진 변경
	$(document).on('click',".update",e=>{
		e.preventDefault();
		let input=$(e.target).parents(".imgBox").prev(".addPic").find(".upload").click();
	});

	