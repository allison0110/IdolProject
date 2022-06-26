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
	
	.underTheconts {
		color: red;
		width: 61%;
		margin-top:9%;
	}
	
	
	.admin_main_container {
		/*** 임시 ***/
		display: flex;
	    justify-content: center;
	    flex-direction: row;
	    flex-wrap: wrap;
		font-size: 5em;
		font-family: 'East Sea Dokdo', cursive;
		
	}
	
	
    
    
    
</style>

<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&family=Creepster&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gugi&family=Jua&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Kirang+Haerang&family=Nosifer&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Press+Start+2P&family=VT323&display=swap" rel="stylesheet">


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
			
			<div class="underTheconts">
				<a href="test.do"><span>
					공사중
				</span></a>
				
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					공사중
				</span>
				<span>
					......................
				</span>
				
			
			</div>
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