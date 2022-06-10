<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="t" value="${test }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdolProject Admin Login Form</title>
	<style type="text/css">
		html, body {
			padding: 0px;
			margin: 0px;
			height: 100%
		}
		
		.admin_main_wrapper {
			height: 100vh;
			display: flex;
			flex-directin: column;
			justify-content: center;
			
		}
		
	</style>
	<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
	<script type="text/javascript">
		
		$(function(){
			let inputId = $('#id').val();
			let inputPwd = $('#pwd').val();
			
	
			$('#go').click(function(){
				alert('${t.admin_id}')
				if(${t.admin_id == inputId }){
					if(${t.admin_pwd == inputPwd}){
						$(function(){
							location.href='admin_main.do';
						}eles{
							alert('비번 틀림');
						}
					}else {
						if(value == null || value.length === 0){
							return "";
						}else {
							return value;
						}
						
					}
				}
			})
		}
		
		
		
		
	</script>
</head>
<body>
	
	<div class="admin_main_wrapper">
	${t.admin_id }
	${t.admin_pwd }
			<div class="admin_login_form">
			
				<div>
					<div class="admin_id" >관리자 아이디</div>
					<input id="id" name="admin_id"></input>
				</div>
				<div>
					<div class="admin_pwd" >관리자 비밀번호</div>
					<input id="pwd" type="password" name="admin_pwd"></input>
					
				</div>
			</div>
			<div>
				
				<button id="go">로그인</button> 
				<input type="reset" value="다시 작성">
			</div>
		
	</div>
	

</body>
</html>