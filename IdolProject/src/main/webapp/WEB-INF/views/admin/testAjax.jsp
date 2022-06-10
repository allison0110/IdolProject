<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="cpath" value="${pageContext.request.contextPath }" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<c:set var="dto" value="${list }" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script type="text/javascript">

	$(function loadJson(){
		$.ajax({
			url: "ajaxTest.do",
			success: function(cont){
				$('#result').html(cont.celeb_no);
			}
		});
		
	});

	
	

</script>
</head>
<body>

	<div align="center">
		<button class="btn" onclick="loadJson()">클릭</button>
		<div id="result">
			
		
		</div>
		
	
	</div>

</body>
</html>