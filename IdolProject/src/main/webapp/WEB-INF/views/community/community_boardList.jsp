<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트 페이지</title>
    <script src="https://kit.fontawesome.com/3de1cbcb05.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@include file="../include/user_top.jsp" %>
	<div align="center">
		<hr width="50%" color="red">
		<h2>게시물 리스트</h2>
		<hr width="50%" color="red">
		<br>
		<br>
		<c:set var="boardlist" value="${boardList }"/>
		<table border="1" cellspacing="0">
			<tr>
				<th>게시물 번호</th>
				<th>작성자 아이디</th>
				<th>게시물 제목</th>
				<th>추천수</th>
				<th>작성일자</th>
			</tr>	
			<c:if test="${!empty boardlist }">
			<c:forEach items="${boardlist }" var="bdto">
			<tr>
				<td>${bdto.community_no }</td>			
				<td>${bdto.community_userid }</td>			
				<td>${bdto.community_title }</td>			
				<td>${bdto.community_recommend }</td>			
				<td>${bdto.community_date }</td>			
			</tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty boardlist }">
				<tr>
					<td colspan="5" align="center">
						<h3>작성된 게시글이 없습니다.</h3>
					</td>
				</tr>
			</c:if>
			
			<tr>
				<td colspan="5" align="right">
					<input type="button" value="게시글 작성"
					onclick="location.href='community_boardwrite.do'">
				</td>
			</tr>
		</table>
		
		
		
	</div>
	
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>