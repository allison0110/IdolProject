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
	
	.admin_member_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
	
	}
	li {
		list-style-type: none;
		
	}
	
	.admin_member_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	}
	
	.admin_member_content{
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
	<c:set var="mList" value="${gmList }" />
	
	<div class="admin_member_wrapper">
	
		<div class="admin_member_container">
			<c:if test="${!empty mList }">
				<c:forEach items="${mList }" var="dto">
					<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${dto.celeb_no}">
						<div class="admin_member_content">
							<ul>
								<li>
									${dto.celeb_no }
								</li>
								<li>
									${dto.celeb_name }
								</li>
								<li>
									${dto.celeb_realname }
								</li>
								<li>
									${dto.celeb_agency }
								</li>
								<li>
									${dto.celeb_dateofbirth.substring(0, 10) }
								</li>
								<li>
									${dto.celeb_debutdate.substring(0, 10) }
								</li>
								<li>
								WORLD
								</li>
							</ul>
						</div>
					</a>
				</c:forEach>
			</c:if>	
			
		</div> <!-- admin_member_container -->
		
	</div><!-- admin_member_wrapper -->
	
	
	
</body>
</html>