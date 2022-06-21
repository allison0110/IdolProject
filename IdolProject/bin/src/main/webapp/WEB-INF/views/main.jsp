<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<html>
<head>
<title>Home</title>
</head>
<body>

<div align="center">
 <a href="<%=request.getContextPath()%>/join.do">회원가입</a> &nbsp;
 <a href="<%=request.getContextPath()%>/login.do">로그인</a>
<br>
<a href="<%=request.getContextPath() %>/mypage.do">마이페이지</a><br>

<a href="<%=request.getContextPath() %>/myfeed.do?id=hong">[hong] 피드</a> &nbsp;
<a href="<%=request.getContextPath() %>/myfeed.do?id=choi">[choi] 피드</a> &nbsp;
<a href="<%=request.getContextPath() %>/myfeed.do?id=funfun">[funun] 피드</a> &nbsp;

</div>

</body>
</html>
