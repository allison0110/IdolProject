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

<P>  The time on the server is ${serverTime}. </P>
<a href="<%=request.getContextPath() %>/used_list.do?id=tlsruddus">used_list 페이지</a> <br>

</body>
</html>
