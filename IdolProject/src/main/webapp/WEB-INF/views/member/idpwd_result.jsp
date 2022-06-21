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

	<%
		String find = (String)request.getAttribute("find");
		String result = (String)request.getAttribute("result");
		
		System.out.println("jsp result:"+result);
		System.out.println("jsp find:"+find);
	%>
	
<%-- 	<c:set var="find" value="${find }"/>
	<c:set var="result" value="${result }"/> --%>
	
	<c:if test="${find == 'id' }">
		<c:set var="word" value="아이디"/>
	</c:if>
	<c:if test="${find == 'pwd' }">
		<c:set var="word" value="비밀번호"/>
	</c:if>
	
<%@include file="../include/user_top.jsp" %>	
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
			<c:if test="${find == 'id' }">
			<input type="button" value="비밀번호찾기" onclick="location.href='findIdPwd.do'">
			</c:if>
			<c:if test="${find == 'pwd' }">
			<input type="button" value="메인화면" onclick="location.href='/controller/'">
			</c:if>
		</div> <!-- class=" result_bottom" end  -->
		
	</div><!-- class="result_container" end -->
<%@include file="../include/user_bottom.jsp" %>
</body>
</html>