<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 폼</title>
</head>
<body>
	<%@include file="../include/user_top.jsp" %>
	<div class="login_wrapper">
		
		<div class="login_title">
		<span>LOGIN</span>
		</div>
		
		<div class="login_body">
		<form method="post" action="<%=request.getContextPath() %>/login_ok.do">
		<table border="1">
			<tr>
				<th>아이디</th>
				<td><input name="member_id"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="password" name="member_pwd"></td>
			</tr>
		</table>
			<input type="submit" value="로그인">
		</form>
		</div>
		<div class="login_bottom">
			<a href="<%=request.getContextPath() %>/findIdPwd.do">아이디/비밀번호 찾기</a>
			<a href="<%=request.getContextPath() %>/join.do">회원가입</a>
		</div>
	</div>
<%@include file="../include/user_bottom.jsp" %>
</body>
</html>