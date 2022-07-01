<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
 <link rel="stylesheet" type="text/css" href="slick/slick.css"/>
  <link rel="stylesheet" type="text/css" href="slick/slick-theme.css"/>
  
  
<script type="text/javascript" src="//code.jquery.com/jquery-1.11.0.min.js"></script>
  <script type="text/javascript" src="//code.jquery.com/jquery-migrate-1.2.1.min.js"></script>
  <script type="text/javascript" src="slick/slick.min.js"></script>
  
<script type="text/javascript">

	$('.notice_cont_slider').slick({
	  dots: true,
	  infinite: true,
	  speed: 500,
	  fade: true,
	  cssEase: 'linear'
	});
							

</script>

</head>
<body>


<c:set var="gdto" value="${grouCont }" />
<c:set var="gimgs" value="${arrayGrouImage }" />


	<h1>
		${gdto.group_name }
	</h1>

	<div class="notice_cont_slider">
		<c:forEach items="${arrayGrouImage }" var="gimg">
	    	<img alt="" src="./resources/upload/group/${gimg }">
	    </c:forEach>
	 </div> <!-- notice_cont_slider -->










</body>
</html>