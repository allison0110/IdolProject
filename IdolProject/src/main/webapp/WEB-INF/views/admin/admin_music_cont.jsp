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
	
	.admin_music_wrapper {
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
	
	.admin_cont_imageBox {
		display: flex;
		flex-direction: row;
	}
	
	.admin_cont_imageBox img {
		width: 100%;
		height: 100%;
	}
	
	.admin_music_box {
	
	
	}
	
	.admin_music_container {
		display: flex;
   		flex-direction: column;
		align-items: center;
	}
	
	
</style>
</head>
<body>

	<c:set var="cont" value="${musicCont }" />
	<c:set var="imgs" value="${arrtokened }" />
	<div class="admin_music_wrapper">
		<div class="admin_music_container">
		
			<div class="admin_cont_imageBox">
				<c:forEach items="${arrtokened }" var="imgs">
					<div class="testImage">
						<img alt="" src="./resources/upload/music/${imgs }">
					</div>
				
				</c:forEach>
			</div>
			<div class="admin_music_box">
				<ul>
					<li>
						${cont.music_aname }
					</li>
					<li>
						${cont.music_name }
					</li>
					<li>
						${cont.music_lyrics }
					</li>
					<li>
						${cont.music_composer }
					</li>
					<li>
						${cont.music_lyricst }
					</li>
					<li>
						${cont.music_movie_link }
					</li>
					<li>
						${cont.music_release_date.substring(0, 10) }
					</li>
				</ul>
				
				<input type="button" value="수정"
				onclick="location.href=''">
				<input type="button" value="삭제"
				onclick="if(confirm('삭제 하시겠습니까 ?? :(')){
					location.href='<%=request.getContextPath()%>/music_delete.do?name=${cont.music_name }&img=${cont.music_coverimage }'
				}else {return}">
				<input type="button" value="메인"
				onclick="location.href='admin_main.do'">
			</div>
		</div> <!-- the end of admin_music_container -->
	</div> <!-- the end of admin_music_wrapper -->
</body>
</html>