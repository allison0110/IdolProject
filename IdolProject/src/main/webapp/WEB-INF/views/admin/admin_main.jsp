<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	html, body {
		margin: 0px;
		padding: 0px;
		height: 100%;
	
	}
	
	/****** include tope    *****/
	.admin_navbar ul {
		
		display: flex;
	    flex-direction: row;
	    justify-content: space-evenly;
		
	}
	
	.admin_navbar ul div ul{
		
		display: flex;
	    flex-direction: column;
		
	}
	
	/****** include tope    *****/
	
	
	
	
	
	
	a {
		text-decoration: none;
	}
	
	li {
		list-style-type: none;
	}
	
</style>
</head>
<body>
	
	<div class="admin_main_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
		<!-- include  -->
		
			
	<c:set var="cdto" value="${cList }" />	
	<c:set var="gdto" value="${gList }" />			

		<div class="admin_main_container">	
			
			
		
			
			
			
			
		</div> <!-- admin_main_container end -->
		
	</div> <!-- admin_main_wrapper end -->
	
	
</body>
</html>