<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>
	final test2
<P>  The time on the server is ${serverTime}. </P>

	<a href="<%=request.getContextPath()%>/product_list.do?cno=${100}">제품리스트MUSIC</a>
	<a href="<%=request.getContextPath()%>/product_list.do?cno=${200}">제품리스트PHOTH</a>
	<a href="<%=request.getContextPath()%>/product_list.do?cno=${300}">제품리스트CONCERT</a>
	<a href="<%=request.getContextPath()%>/product_list.do?cno=${400}">제품리스트LIVING</a>
	<a href="<%=request.getContextPath()%>/product_list.do?cno=${500}">제품리스트BEAUTY</a>
	<a href="<%=request.getContextPath()%>/product_list.do?cno=${600}">제품리스트STATIONERY</a>
	<a href="<%=request.getContextPath()%>/product_list.do?cno=${700}">제품리스트FASTION</a>
	<a href="<%=request.getContextPath()%>/product_list.do?cno=${800}">제품리스트CUSTOMIZING</a>
	
</body>
</html>
