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
	
	.admin_celeb_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
	
	}
	li {
		list-style-type: none;
		
	}
	
	.admin_celeb_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	}
	
	.admin_celeb_content{
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
	<c:set var="list" value="${celecList }" />
	
	<div class="admin_celeb_wrapper">
	
		<div class="admin_celeb_container">
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${dto.celeb_no}">
						<div class="admin_celeb_content">	
							<ul>						
								<c:if test="${dto.celeb_group != 'solo'}">
									<li>
									 ${dto.celeb_group }
									</li>
								</c:if>	
								<c:if test="${dto.celeb_group =='solo'}">
									
								</c:if>	
								<li>
									가수 명 : ${dto.celeb_name }
								</li>
								<li>
									본명 : ${dto.celeb_realname }
								</li>
								<li>
									소속사 : ${dto.celeb_agency }
								</li>
								<li>
									생일 : ${dto.celeb_dateofbirth.substring(0, 10) }
								</li>
								<li>
									데뷔일 : ${dto.celeb_debutdate.substring(0, 10) }
								</li>
								
							</ul>
						</div> <!-- admin_celeb_content -->
					</a>
				</c:forEach>
			</c:if>	
				
		
			
		</div> <!-- admin_celeb_container -->
		
	</div> <!-- admin_celeb_wrapper -->
	
	
	
</body>
</html>