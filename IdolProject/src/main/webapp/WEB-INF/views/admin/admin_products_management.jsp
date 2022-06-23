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
		padding: 0px;
		margin: 0px;
		background-color: black;
	}
	
	
</style>
	
	
	
	
	
</head>
<body>
	<c:set var="olist" value="${oList }" />

	<div class="products_order_wrapper"> 
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_products_include.jsp" />
	
		<div class="products_order_container">
		<input type='text' class="datepicker-here" data-position="right top" />
			<div class="order_calendar">
				
			</div>
		</div> <!-- products_order_container -->
	</div> <!-- products_order_wrapper -->


</body>
</html>