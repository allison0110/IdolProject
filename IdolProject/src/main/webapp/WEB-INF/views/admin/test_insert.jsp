<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/test1.do">
		<input name="good2">
		<input name="good3">
		<input multiple="multiple" type="file" name="file">
		<input type="submit" value="등록 test1">
	</form>
	
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/test2.do">
		<input name="good2">
		<input name="good3">
		<input multiple="multiple" type="file" name="file">
		<input type="submit" value="등록 test2">
	</form>
	
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/test3.do">
		<input name="good2">
		<input name="good3">
		<input multiple="multiple" type="file" name="file">
		<input type="submit" value="다중 파일 등록 DB X test3">
	</form>
	
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/test4.do">
		<input name="good2">
		<input name="good3">
		<input type="file" name="file">
		<input type="submit" value="단일 파일 등록 test4">
	</form>
	
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/test5.do">
		<input name="good2">
		<input name="good3">
		<input type="file" name="file">
		<input type="submit" value="단일 파일 등록  DB OK test5">
	</form>
	<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/test6.do">
		<input name="good2">
		<input name="good3">
		<input multiple="multiple" type="file" name="file">
		<input type="submit" value=" 등록 test6">
	</form>
</body>
</html> 