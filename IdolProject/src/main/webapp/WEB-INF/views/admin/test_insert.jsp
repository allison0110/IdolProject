<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/test3.do">
		<input multiple="multiple" type="file" name="file">
		<input type="text" name="src">
		<input type="submit" value="등록">
	</form>
</body>
</html> 