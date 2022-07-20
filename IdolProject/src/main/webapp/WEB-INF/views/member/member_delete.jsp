<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="./resources/css/member.css?v=2022062117">
<style type="text/css">

body{
 		background-color: #f2f2f2;
 	}
 	
 	.delete_body{
 	background-color: white;
    border: 1px solid #e0dfdf;
    border-radius: 6px;
    width: 50%;
    padding: 40px 20px;
 	}
 	
 	.delete_info1{
 		padding: 20px 20px;
    margin-bottom: 40px;
    border:1px solid #ececec;
    
 	}
 	
 	.delete_red{
 		color:red;
 	}
 	
 	.delete_cont{
 		font-size: 0.85em;
 		line-height: 1.5;
 		margin-top:10px;
 	}
 	
 	.join_info2 select{
 		width:100%;
 	}
 	
 	#deleteOk{
 		font-size: 0.9em;
 		color:red;
 		margin-bottom:30px;
 	}
 	
 	.delete_btn{
 		padding: 5px 10px;
 	}
 	
 	.delete_btn input{
		width: 90%;
  	    margin: 0 5px;
        padding: 10px 5px;
        border-radius: 40px;
        border: 1px solid #233044;
        font-size: 1.1em;
        letter-spacing: 1.3px;
        cursor: pointer;
        margin:2px 0;
	}
 	
</style>
</head>
<body>

	<%@include file="../include/user_top.jsp" %>
	<div class="join_wrapper" align="center">
	<form action="<%=request.getContextPath()%>/member_delete_Ok.do" onsubmit="return deleteCheck()">
		<div class="join_container">
			<div class="lojo_title">
			<span>회원 탈퇴</span>
			</div>
	
			<div class="delete_body">
			<div class="delete_info1" align="left">
				<p class="delete_red">회원 탈퇴 시 개인정보 및 YOUR CELEB에서 만들어진 모든 데이터는 삭제됩니다.<br>
				   (단, 아래 항목은 표기된 법률에 따라 특정 기간 동안 보관됩니다.)</p>
				
				<p class="delete_cont">1.계약 또는 청약철회 등 에 관한 기록 보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률 / 보존 기간:5년<br>
				2.대금결제 및 재화 등의 공급에 관한 보존 이유: 전자상거래 등에서의 소비자보호에 관한 법률/ 보존 기간:5년<br>
				3.전자금융 거래에 관한 기록 보존 이유: 전자금융거래법 / 보존기간:5년<br>
				4.소비자의 불만 또는 분쟁처리에 관한 기록 보존 이유: 전자상거래 등에서의 소비자 보호에 관한 법률/ 보존 기간:3년<br>
				5.신용정보의 수집/처리 및 이용 등에 관한 기록 보존 이유: 신용정보의 이용 및 보호에 관한 법률/ 보존 기간:3년<br>
				6.전자(세금)계산서 시스템 구축 운영하는 사업자가 지켜야 할 사항 고시(국세청 고시 제2016-3호)(전자세금계산서 사용자에 한함)/보존 기간:5년<br>
				   (단, (세금)계산서 내 개인식별번호는 3년 경과 후 파기)</p>
			</div>
			
			<div class="join_info2" align="left">
			<div class="join_title">
			유의 사항
			</div>
			<p class="delete_cont"> 회원탈퇴 처리 후에는 회원님의 개인정보를 복원할 수 없으며, 회원탈퇴 진행 시 해당 아이디는 영구적으로<br> 삭제되어 재가입이 불가합니다.
			</p>
			</div>
			
			<div class="join_info2" align="left">
			<div class="join_title">
			탈퇴 사유
			</div>
			<select>
				<option>아이디 변경/ 재가입 목적</option>
				<option>컨텐츠 부족</option>
				<option>서비스 불만</option>
				<option>이용 불편</option>
			</select>
			</div>
			<input type="checkbox" id="deleteOk"> <label for="deleteOk">해당 내용을 모두 확인했으며, 회원탈퇴에 동의합니다.</label> <br>
			
			<div class="delete_btn">
			<input class="join_submit" type="submit" value="회원탈퇴">
			<!-- 취소누르면 메인페이지 이동 -->
			<input class="join_cancel" type="button" value="취소" onclick="location.href='<%=request.getContextPath()%>/'"> 
			</div>
			
			
			</div>
			
			
		</div>
		</form>
	</div><!-- class="join_wrapper" end -->
	<script type="text/javascript">
	function deleteCheck(){
		
		/* 약관동의 체크 여부 */
		let agree= false;
		
		if($("#deleteOk").prop("checked")){

			agree = true;

		}else{
			agree = false;
		}
		
		if(agree == false){
			alert("탈퇴 동의를 체크해주세요");
			return false;
		}
		
		
	}
	
	
	</script>
	<%@include file="../include/user_bottom.jsp" %>

</body>
</html>