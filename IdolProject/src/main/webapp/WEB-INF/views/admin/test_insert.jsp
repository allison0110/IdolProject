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
		<input name="good3">
	
		<input multiple="multiple" type="file" name="file1">
		<input multiple="multiple" type="file" name="file2">
		
		
		<input type="submit" value="다중 파일 등록 DB okay test3">
	</form>
	
	
	
	
	
	
	

</body>
</html> 