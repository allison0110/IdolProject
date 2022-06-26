<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.i {
		width: 100px;
	
	}
	.i img{
		width: 300px;
	}
</style>
</head>
<body>

<c:set var="i" value="${imgList }" />
	
	<c:forEach items="${imgList }" var="img">
	<div class="i">
		<img alt="" src="./resources/upload/celeb/${img }">
	</div>
	</c:forEach>
</body>
</html>