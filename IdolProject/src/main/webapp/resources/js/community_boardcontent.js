
 /*게시물페이지에 작성자 로그인한 상태로 페이지를 확일할시 수정 및 삭제버튼이 보이게 하는 함수
     게시물 작성자 이외의 사람이 확인할 시 버튼이 보이지 않는다.
 */
 function viewBtn(){
 	if($('#loginId').val() == $('#writerId').val()){
 		$('.UpdateAndDelete').css("display","block");
 	}else{
 		$('.UpdateAndDelete').css("display","none");
 	}
 
 }
 
 viewBtn();
 
 /*
 	게시물 댓글 input창이 로그인을 하지 않으면 보이지 않도록 하는 함수
 */
 function viewcommentInput(){
 	if($('#loginId').val() == ""){
 		$('.formContainer').css("display","none");
 	}else{
 		$('.formContainer').css("display","block");
 	}
 }
 viewcommentInput();
 
 
 //게시물 삭제버튼 클릭
 $("#deleteBtn").click(function(){
	 	Swal.fire({
		  title: '정말로 삭제하시겠습니까?',
		  text: "삭제된 게시글은 되돌릴수 없습니다.",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes, delete it!'
		}).then((result) => {
		  if (result.isConfirmed) {
		  /***ajaxStrat***/
		  $.ajax({
			type: "POST",
			url: "community_delete.do",
			data:{
					bno : $('#bno').val()
					},
			datatype: "text",
			success: function(data){
				 if(Number(data) == 1){
						let timerInterval
						Swal.fire({
						  title: '게시글 삭제중',
						  html: 'I will close in <b></b> milliseconds.',
						  timer: 2000,
						  timerProgressBar: true,
						  didOpen: () => {
						    Swal.showLoading()
						    const b = Swal.getHtmlContainer().querySelector('b')
						    timerInterval = setInterval(() => {
						      b.textContent = Swal.getTimerLeft()
						    }, 100)
						  },
						  willClose: () => {
						    clearInterval(timerInterval)
						    location.href='community_boardList.do';
						  }
						}).then((result) => {
						  /* Read more about handling dismissals below */
						  if (result.dismiss === Swal.DismissReason.timer) {
						    console.log('I was closed by the timer')
						  }
						})
				}else{
					Swal.fire('게시글 삭제 실패')
				}
			},
			error: function(data){
				Swal.fire('다시 로그인해 주세요');
	 			location.href = 'login.do';
			}
			});
		  /***ajaxend***/
		  }
		})
 });
 
 
 
  //게시물 수정버튼 클릭
  $("#updateBtn").click(function(){
		  Swal.fire({
		  title: '게시물을 수정하시겠습니까??',
		  text: "수정을 원치 않으시면 취소를 눌러주세요",
		  icon: 'warning',
		  showCancelButton: true,
		  confirmButtonColor: '#3085d6',
		  cancelButtonColor: '#d33',
		  confirmButtonText: 'Yes'
		}).then((result) => {
		  if (result.isConfirmed) {
		    location.href="community_boardUpdate.do?bno="+$("#bno").val();
		  }
		})
  });


  // 게시물 댓글 등록
  function submitCheck(){
  	if($('#loginId').val() == ""){
 		alert('로그인 정보가 없습니다. 다시로그인해 주세요');
 		return false;
 	}else{
 		return true;
 	}
  }

  // 게시물 댓글 답변글(대댓글) 등록
  function replyCheck(){
	if($('#loginId').val() == ""){
		alert('로그인 정보가 없습니다. 다시로그인해 주세요');
		return false;
	}else{
		return true;
	}
  }


  // 대댓글 indent 에 따른 padding요소 및 background
  for(let i=0;i<$('.comment').length;i++){
	if($('.comment_indent').eq(i).val() > 0){
		let padding = $('.comment_indent').eq(i).val()*20;
		$('.comment').eq(i).css("background-color","rgba(248, 248, 248)")
		.css("padding-left",padding+"px");
	}
  }

  // 댓글 수정삭제버튼 view
  for(let i=0;i<$('.comment').length;i++){
	if($('.commentWriter').eq(i).val() == $('#loginId').val()){
		$('.comment-up').eq(i).css("display","inline-block");
		$('.comment-del').eq(i).css("display","inline-block");
	}
  }

// 대댓글 작성view 표시
for(let i=0;i<$('.comment').length;i++){
	$('.comment-reply').eq(i).click(function(){
		if($('#loginId').val() != ""){
			// 기존에 답글이또는 수정 text filed가 열려있다면 닫아준다.
			for(let j=0;j<$('.comment').length;j++){
				$('.comment-input-group').eq(j).css("display","none");
				$('.update-input-group').eq(j).css("display","none");
			}
			$('.comment-input-group').eq(i).css("display","flex");
		}else{
			alert('로그인이 필요합니다.');
		}
	});
}


// 수정버튼 클릭시 수정 text필드 표시
for(let i=0;i<$('.comment').length;i++){
	$('.comment-up').eq(i).click(function(){
		// 기존에 답글이또는 수정 text filed가 열려있다면 닫아준다.
		for(let j=0;j<$('.comment').length;j++){
				$('.comment-input-group').eq(j).css("display","none");
				$('.update-input-group').eq(j).css("display","none");
		}
		$('.update-input-group').eq(i).css("display","flex");
		$('.update-text').eq(i).val($(".commentdetail").eq(i).text());
	});
}

// 수정 text필드의수정 button 클릭시 댓글 수정요청
for(let i=0;i<$('.comment').length;i++){
	$('.commentUpBtn').eq(i).click(function(){
		if($('.update-text').eq(i).val() != ""){
			console.log($('.update-text').eq(i).val());
			// 컨트롤러로 수정텍스트,댓글번호,게시판번호를 전송한다.
			let ctext = $('.update-text').eq(i).val(),
			cno = $('.comment_no').eq(i).val(),
			bno = $('.community_nofk').eq(i).val();
			
			location.href="community_commentUpdate.do?ctext="+ctext+"&cno="+cno+"&bno="+bno;
		}else{
			alert('수정할 내용을 입력해 주세요');
		}
		
	});
}



// 게시글 및 댓글 작성자 회원피드 
let writerFeedOnOff = $('.writer-feed-OnOff');
let commentFeedOnOff = $('.comment-feed-OnOff');


// 게시글 작성자 회원피트 on-off
$('.writer').click(function(){
	writerFeed();
});
function writerFeed(){
	
	if(writerFeedOnOff.val() == 0){
		$('.writer-feed').css("display","inline-block");
		writerFeedOnOff.val(1);
	}else{
		$('.writer-feed').css("display","none");
		writerFeedOnOff.val(0);
	}
	
	// 작성자 클릭시 댓글작성자 피드는 off
	for(let j=0;j<$('.comment').length;j++){
		commentFeedOnOff.eq(j).val(0)
		$('.comment-feed').eq(j).css("display","none");
	}
}

// 게시글 댓글 회원피트 on-off
for(let i=0;i<$('.comment').length;i++){
	$('.commentUser').eq(i).click(function(){
		if(commentFeedOnOff.eq(i).val() == 0){
			for(let j=0;j<$('.comment').length;j++){
				if(j==i){
					let marginLeft = $('.comment_indent').eq(i).val()*20;
					commentFeedOnOff.eq(j).val(1)
					$('.comment-feed').eq(j).css("display","inline-block")
					.css("margin-left",marginLeft+"px");
				}else{
					commentFeedOnOff.eq(j).val(0)
					$('.comment-feed').eq(j).css("display","none");
				}
			}
		}else{
			for(let j=0;j<$('.comment').length;j++){
				commentFeedOnOff.eq(j).val(0)
				$('.comment-feed').eq(j).css("display","none");
			}
		}
		
		// 댓글작성자 클릭시 작성자 피드는 off
		$('.writer-feed').css("display","none");
		writerFeedOnOff.val(0);
		
	});
}
  
  
  
  
  
  