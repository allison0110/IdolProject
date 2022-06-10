<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
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


.select-box{
	dsplay:flex;
	width:400px;
	flex-direction: column;
}

.select-box .options-container{

	background-color:#2f3640;
	color:#f5f6fa;
 	max-height:0;
	width:100%;
	opacity: 0;
	transition: all 0.4s;
	border-radius: 8px;
	overflow: hidden;
	order:1;
	
}

.selected{
	background: #2f3640;
	border-radius: 8px;
	margin-bottom:8px;
	color:#f5f6fa;
	position: relative;
	order:0;
}

.selected::after{
	content:"";
	
}


.select-box .options-container.active{
	max-height:150px;
	opacity:1;
	overflow-y:scroll; 
}

.select-box .options-container::-webkit-scrollbar{
	width:8px;
	background-color:#0d141f;
	border-radius: 0 8px 8px 0;
}
.select-box .options-container::-webkit-scrollbar-thumb{
	background:#525861;
	border-radius: 0 8px 8px 0;
}

.select-box .option,
.selected{
		padding:12px 24px;
		cursor: pointer;
}

.select-box .option:hover{
	background:#414b57;
}

.select-box label{
	cursor: pointer;
}

.select-box .option .radio{
	display:none;
}

</style>
</head>
<body>

	 <div align="center">
	 
	 <a href="<%=request.getContextPath() %>/join.do">회원가입</a>
	 <a href="<%=request.getContextPath() %>/login.do">로그인</a>
	 <br>
	 <a href="<%=request.getContextPath() %>/mypage.do">마이페이지</a>
	 </div>
	 
	 <% HttpSession session = request.getSession(); %>
	 <script type="text/javascript">
	 
	 	$(document).ready(function(){
	 		
	 		
	 		
	 		var login = "<%=(String)session.getAttribute("login_id") %>";
	 		
	 		if(login == "null"){
	 			console.log("login - null");
	 		}else{
	 			console.log(login);
	 		}
	 		
	 	});
	 
	 </script>
	 
	 
	 
	 
	 
	 <!-- <h2>선택박스만들기</h2>
	
	
	<div class="select-box">
	
	
	<div class="options-container active">
		
		<div class="option">
			<input type="radio" class="radio" id="automobiles" name="category">
			<label for="automobiles">First</label>
		</div>
		<div class="option">
			<input type="radio" class="radio" id="automobiles" name="category">
			<label for="automobiles">Second</label>
		</div>
		<div class="option">
			<input type="radio" class="radio" id="automobiles" name="category">
			<label for="automobiles">Third</label>
		</div>
		<div class="option">
			<input type="radio" class="radio" id="automobiles" name="category">
			<label for="automobiles">Forth</label>
		</div>
		<div class="option">
			<input type="radio" class="radio" id="automobiles" name="category">
			<label for="automobiles">Fifth</label>
		</div>
		<div class="option">
			<input type="radio" class="radio" id="automobiles" name="category">
			<label for="automobiles">Sixth</label>
		</div>
	</div>
	</div>
	<div class="selected">
	 	Select video Category
		</div>
	 <script src="main.js"></script> -->
	 
</body>
</html>
