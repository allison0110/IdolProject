<%@page import="com.idol.model.CelebDTO"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.idol.model.GroupDTO"%>
<%@page import="java.util.List"%>
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
		background-color: black;
	}
	
	
	a {
		text-decoration: none;
	}
	
	li {
		list-style-type: none;
	}
	
	.test {
		color: white;
	}
	
	.box_image {
		width: 300px;
		height: 350px;
	}
	.box_image img {
		width: 100%;
		height: 100%;
	}
</style>


</head>
<body>
	
	<div class="admin_main_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
		<!-- include  -->
		
			
	<c:set var="clist" value="${cList }" />
		
	<c:set var="glist" value="${gList }" />	
			
	<c:set var="ilist" value="${iList }" />	
			
	<c:set var="nlist" value="${nList }" />		
		
	<c:set var="mlist" value="${mList }" />			

		<div class="admin_main_container">	
			
			<div class="group_list">
			<c:if test="${!empty glist }">
			
				
			
				
				
				
				
			
			</c:if>
			<c:if test="${empty glist }">
				<h4> :(</h4>
			</c:if>
			
			
			</div> <!-- group_list -->
		
			
			
			
			
		</div> <!-- admin_main_container end -->
		
	</div> <!-- admin_main_wrapper end -->
	
	
</body>
</html>