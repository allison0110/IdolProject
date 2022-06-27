
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
  