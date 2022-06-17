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
	<c:set var="list" value="${musicList }" />
	
	<div class="admin_celeb_wrapper">
		<div class="admin_celeb_container">
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<a href="<%=request.getContextPath()%>/admin_music_content.do?no=${dto.music_no}">
						
						<div class="admin_celeb_content">
							<ul>
								<li>
									No. ${dto.music_no }
								</li>
								<li>
									<c:if test="${dto.group_name != null }">
										그룹명 : ${dto.group_name }
									</c:if>
									<c:if test="${dto.celeb_name == null }">
										
									</c:if>
									<c:if test="${dto.celeb_name != null }">
										가수명 : ${dto.celeb_name }
									</c:if>
								</li>
								<li>
									앨범명 : ${dto.music_aname }
								</li>
								<li>
									노래 제목 : ${dto.music_name }
								</li>
								
								<li>
									발매일 : ${dto.music_release_date.substring(0, 10) }
								</li>
								
							</ul>
						</div>
					</a>
				</c:forEach>
			</c:if>	
		</div>
	</div>
	
	
	
</body>
</html>