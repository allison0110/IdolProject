<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성 페이지</title>
    <script src="https://kit.fontawesome.com/3de1cbcb05.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<%@include file="../include/user_top.jsp" %>

	<div align="center">
		<hr width="50%" color="red">
		<h3>게시물 작성</h3>
		<hr width="50%" color="red">
		<br>
		
		<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/community_boardwrite_ok.do">
		<table border="1" cellspacing="0" >
			<tr>
				<th>작성자 </th>
				<td> </td>
			</tr>
		
		</table>
		
		</form>
	</div>

<%@include file="../include/user_bottom.jsp" %>
</body>
</html>