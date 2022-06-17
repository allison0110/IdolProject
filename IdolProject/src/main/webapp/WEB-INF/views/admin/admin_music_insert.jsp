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
	
	.admin_music_wrapper {
		height: 100vh;
		display: flex;
		flex-direction: column;
		
	}
	
	.admin_music_container {
		display: flex;
    	justify-content: center;
	}
	
	.admin_music_inputForm {
		display: flex;
    	flex-direction: row;
	}
	

	.admin_music_rightSide {
		display: flex;
    	flex-direction: column;
	}
</style>
</head>
<body>

	<c:set var="clist" value="${cList }" />
	<c:set var="glist" value="${gList }" />

	<div class="admin_music_wrapper">
		<div class="admin_music_container">
			<div class="admin_music_inputForm">
				<form method="post" enctype="multipart/form-data" 
					action="<%=request.getContextPath()%>/admin_music_insertOk.do">
					<div class="admin_music_rightSide">
						앨범명 : <input name="music_aname">
						노래명 : <input name="music_name">
						그룹 선택 
						<select name="group_name">	
							<c:forEach items="${glist }" var="gdto">
								<option value="${gdto.group_name }">
									${gdto.group_name }
								</option>
							</c:forEach>	
						</select>
						
						셀럽 선택
						<select name="celeb_name">	
							<option value="">
							선택 안함
							</option>
							<c:forEach items="${clist }" var="cdto">
								<option value="${cdto.celeb_name }">
									${cdto.celeb_name }
								</option>
							</c:forEach>	
						</select>
						
						가사 : <textarea rows="15" cols="25" name="music_lyrics"></textarea>
						작곡가 : <input name="music_composer">
						작사가 : <input name="music_lyricst">
						커버 이미지 : <input type="file" multiple="multiple" name='file'>
						뮤비링크 : <input name="music_movie_link">
						발매일 : <input type="date" name="music_release_date">
					</div>
					<div>
						<input type="submit" value="등록">
						<input type="reset" value="다시작성">
					</div>
				</form>
			</div> <!-- admin_music_inputForm -->
		</div> <!-- admin_music_container -->
		
	</div><!-- admin_music_wrapper -->



</body>
</html>