<%@page import="com.idol.model.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style type="text/css">
*{
	margin:0;
	box-sizing: border-box;
}

body{
	font-family: "Roboto", sans-serif;
	background-color: #f7f6ff;
}

h2{
	margin: 16px;
}

.container{
	margin-top: 100px;
	padding:32px;
}


</style>
</head>
<body>

	 <div align="center">
	 
	 <a href="<%=request.getContextPath() %>/join.do">회원가입</a>
	 <a href="<%=request.getContextPath() %>/login.do">로그인</a>
	 <br><br>
	 <a href="<%=request.getContextPath() %>/mypage.do">마이페이지</a><br>
	 <br>
	 <a href="<%=request.getContextPath() %>/myfeed.do?id=hong">hong 피드</a> &nbsp;
	 <a href="<%=request.getContextPath() %>/myfeed.do?id=choi">choi 피드</a> &nbsp;
	 <a href="<%=request.getContextPath() %>/myfeed.do?id=funfun">funfun 피드</a> &nbsp;
	 </div>
	 
	 <% HttpSession session = request.getSession(); 
	 MemberDTO dto =null;
	 	try{
	 		dto = (MemberDTO)session.getAttribute("loginInfo");
	 	}catch (Exception e){
	 		System.out.println("오류발생");
	 	}finally{
	 		if(dto == null){
		 		System.out.println("로그인아이디: null");
		 	}else{
		 		System.out.println("로그인아이디:"+dto.getMember_id());
		 	}
	 		
	 		
	 	}
	 	
	 	
	 %>
	 
	 
	 
	 
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
