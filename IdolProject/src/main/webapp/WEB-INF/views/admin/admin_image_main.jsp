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
		height: 100%;
	}
	
	.admin_images_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
	
	}
	li {
		list-style-type: none;
		
	}
	
	.admin_images_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	}
	
	.admin_images_content{
		border: 1px solid pink;
		width: 200px;
		height: 200px;
	}
	
	a {
		text-decoration: none;
	}
</style>
</head>
<body>
	<c:set var="ilist" value="${imagesList }" />
	
	<div class="admin_images_wrapper">
		<div class="admin_images_container">
		
			<c:if test="${!empty ilist }">
				<c:forEach items="${ilist }" var="dto">
					<a href="<%=request.getContextPath()%>/admin_images_content.do?no=${dto.image_no}">
						
						<div class="admin_images_content">
							<ul>
								<li>
									${dto.image_no }
								</li>
								<li>
									${dto.image_path }
								</li>
								<li>
									${dto.image_link }
								</li>
								<li>
									${dto.image_priority }
								</li>
								<li>
									${dto.image_visible }
								</li>
							</ul>
						</div>
					</a>
				</c:forEach>
			</c:if>	
			
		</div> <!-- admin_images_container end  -->
		
	</div> <!-- admin_images_wrapper end -->
	
	
	
</body>
</html>