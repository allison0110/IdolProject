<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 찾기</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">

	//아이디찾기, 비밀번호찾기 탭 메서드 
	function findTab( idpwd ){
		
		document.getElementById('findId').style.display='none';
	    document.getElementById('findPw').style.display='none';
	    document.getElementById( idpwd).style.display='block';
		$(".check_email").prop("checked",true);
		$('.phone_find').hide();
		$('.phone_input').hide();
		$('.email_find').show();
		$('.email_input').show();
	}
	
	//라디오 버튼에 따른 화면 변경
	$(document).ready(function(){
		
		$('input[name=verification]').on('change',function(){
			var v = $(this).val();
			
			switch(v){
			case 'email':
				$('.phone_find').hide();
				$('.phone_input').hide();
				$('.email_find').show();
				$('.email_input').show();
				break;
			case 'phone':
				$('.phone_find').show();
				$('.phone_input').show();
				$('.email_find').hide();
				$('.email_input').hide();
				
			}
			
		});
	});
	
	$(document).ready(function(){
		
		let result = '<c:out value="${find_result}"/>';
		
		console.log(result);
		
		if(result =="null"){
			alert("회원정보를 다시 확인해주세요.");
		}
		
	});

</script>
<style type="text/css">

	.find_tab{
		display:flex;
	}
	
	.find_tab .tab_title{
		margin:0 20px;
	}


	#findPw{
		display:none;
	}
	
	.phone_find {
		display:none;
	}
	
	.phone_input{
		display:none;
	}
</style>

</head>
<body>
<%@include file="../include/user_top.jsp" %>
	<div class="find_container" align="center">
		<div class="find_form">
			<div id="findId">
				<form method="post" class="find_form" action="findIdPwd_ok.do">
					<input type="hidden" name="find_word" value="id">
					<div class="content">
						<div class="find_tab" align="center">
							<div class="tab_title" onclick="findTab('findId')">아이디 찾기</div>
							<div class="tab_title" onclick="findTab('findPw')">비밀번호 찾기</div>
						</div>	
						<br>
						<table border="1">
							<tr>
								<th>인증방법</th>
								<td>
								<input type="radio" class="check_email" name="verification" value="email" checked="checked">이메일
								<input type="radio" class="check_phone" name="verification" value="phone">휴대폰번호
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input name="member_name"></td>
							</tr>
							
							<tr>
								<th><span class="email_find">이메일로 찾기</span> <span class="phone_find">휴대번호로 찾기</span></th>
								<td>
									<div class="email_input"><input name="member_email"></div>
									<div class="phone_input"><input name="phone1"> - <input name="phone2"> - <input name="phone3"></div>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="center">
								<input class="idpwdSubmit" type="submit" value="아이디찾기">
							</tr>
						</table>	
						<br>
						<input class="idpwdBtn" type="button" value="로그인" onclick="location.href='login.do'">
						<input class="idpwdBtn" type="button" value="회원가입" onclick="location.href='join.do'">			
						
					</div>
				</form>			
			</div><!-- id="findId" end  -->
			
			<div id="findPw">
				<form method="post" class="find_form" action="findIdPwd_ok.do">
					<input type="hidden" name="find_word" value="pwd">
					<div class="content">
						<div class="find_tab">
							<div class="tab_title" onclick="findTab('findId')">아이디 찾기</div>
							<div class="tab_title" onclick="findTab('findPw')">비밀번호 찾기</div>
						</div>	
						<br>
						<table border="1">
							<tr>
								<th>인증방법</th>
								<td>
								<input type="radio" class="check_email" name="verification" value="email" checked="checked">이메일
								<input type="radio" class="check_phone" name="verification" value="phone">휴대폰번호
								</td>
							</tr>
							<tr>
								<th>아이디</th>
								<td><input name="member_id"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input name="member_name"></td>
							</tr>
							<tr>
								<th><span class="email_find">이메일로 찾기</span> <span class="phone_find">휴대번호로 찾기</span></th>
								<td>
								<div class="email_input"><input name="member_email"></div>
								<div class="phone_input"><input name="phone1"> - <input name="phone2"> - <input name="phone3"></div>
								</td>
							</tr>
							
							<tr>
								<td colspan="2" align="center">
								<input class="idpwdSubmit" type="submit" value="비밀번호 찾기">
							</tr>
						</table>	
						<br>
						<input class="idpwdBtn" type="button" value="로그인" onclick="location.href='login.do'">
						<input class="idpwdBtn" type="button" value="회원가입" onclick="location.href='join.do'">						
					</div>
				</form>			
			</div><!-- id="findPw" end  -->
			
			
		</div><!-- class="find_form" end  -->
	
	</div><!-- class="find_container" -->

<%@include file="../include/user_bottom.jsp" %>

</body> 
</html>