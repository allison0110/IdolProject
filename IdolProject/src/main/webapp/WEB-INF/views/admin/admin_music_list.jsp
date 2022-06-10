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
					<a href="<%=request.getContextPath()%>/admin_music_content.do?name=${dto.music_name}">
						
						<div class="admin_celeb_content">
							<ul>
								<li>
									${dto.music_aname }
								</li>
								<li>
									${dto.music_name }
								</li>
								<li>
									${dto.music_lyrics }
								</li>
								<li>
									${dto.music_composer }
								</li>
								<li>
									${dto.music_lyricst }
								</li>
								<li>
									${dto.music_movie_link }
								</li>
								<li>
									${dto.music_release_date.substring(0, 10) }
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