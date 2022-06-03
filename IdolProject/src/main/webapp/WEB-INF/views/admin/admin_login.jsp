<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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


</head>
<body>

	<div class="admin_main_wrapper">
		<form method="post" action="<%=request.getContextPath() %>/admin_login_ok.do">
			<div class="admin_login_form">
				<div>
					<div class="admin_id" >관리자 아이디</div>
					<input name="admin_id"></input>
				</div>
				<div>
					<div class="admin_pwd" >관리자 비밀번호</div>
					<input type="password" name="admin_pwd"></input>
				</div>
			</div>
			<div>
				<input type="submit" value="로그인">
				<input type="reset" value="다시 작성">
			</div>
		</form>
	</div>
	

</body>
</html>