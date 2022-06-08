<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  
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
	
	.admin_content_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
		justify-content: center;
	    align-items: center;
	}
	
	ul {
		list-style-type: none;
	}
	
	.testImage {
		width: 450px;
		height: 500px;
	}
	
	.testImage img {
		width: 100%;
	}
</style>
</head>
<body>

	<c:set var="cont" value="${celebContByNo }" />
	
	<div class="admin_content_wrapper">
		<div class="admin_content_container">
		<!--  
			<div class="testImage">
				<img src="<spring:url value='/resources/upload/celeb/1654665381521김채원3.jpg'/>">
			</div>
		-->
		
		<div class="testImage">
			<img alt="" src="<spring:url value='/resources/upload/celeb/${cont.celeb_pimage }'/>">
		</div>
		<div class="testImage">
			<img alt="" src="/resources/upload/celeb/${cont.celeb_pimage }">
		</div>
		${cont.celeb_pimage }
			<ul>
				<li>
					${cont.celeb_no }
				</li>
				<li>
					${cont.celeb_name }
				</li>
				<li>
					${cont.celeb_realname }
				</li>
				<li>
					${cont.celeb_agency }
				</li>
				<li>
					${cont.celeb_dateofbirth.substring(0, 10) }
				</li>
				<li>
					${cont.celeb_debutdate.substring(0, 10) }
				</li>
				<li>
					${cont.celeb_group }
				</li>
			</ul>
			
			<input type="button" value="수정"
			onclick="location.href=''">
			<input type="button" value="삭제"
			onclick="location.href='<%=request.getContextPath()%>/celeb_delete.do?no=${cont.celeb_no }'">
			<input type="button" value="임시">
		
		</div> <!-- the end of admin_content_container -->
	</div> <!-- the end of admin_content_wrapper -->
</body>
</html>