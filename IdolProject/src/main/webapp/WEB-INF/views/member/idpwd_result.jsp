<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디, 비밀번호 찾기 결과</title>
</head>
<body>
	<c:if test="${find == 'id' }">
		<c:set var="word" value="아이디"/>
	</c:if>
	<c:if test="${find == 'pwd' }">
		<c:set var="word" value="비밀번호"/>
	</c:if>
	
	<div class="result_container" align="center">
		<div class="result_title">
			${word } 찾기
		</div>
		
		<hr width="30%">
		<div class="result_cont">
			회원님의 ${word }는 ${result } 입니다.
		</div>
		<hr width="30%">
		
		<div class="result_bottom">
			<input type="button" value="로그인" onclick="location.href='login.do'">
			<input type="button" value="비밀번호찾기" onclick="location.href='findIdPwd_ok.do'">
		</div> <!-- class=" result_bottom" end  -->
		
	</div><!-- class="result_container" end -->

</body>
</html>