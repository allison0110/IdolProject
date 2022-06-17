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
		margin: 0px;
		padding: 0px;
		height: 100%;
	}
	
	.admin_music_modify_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	.admin_music_modify_container{
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: row;
	}
	
	.music_img_container {
		width: 100%;
		flex: 50%;
		
	}
	
	.music_imgBoxes {
		width: 300px;
		height: 400px;
	}
	
	.music_imgBoxes img{
		width: 100%;
		height: 100%;
	}
	
	.music_modify_form {
		flex: 50%;
		display: flex;
    	align-items: center;
	}
</style>
</head>
<body>
	<c:set var="mCont" value="${musicCont }" />
	<c:set var="imgs" value="${arrimgs }" />
	<c:set var="clist" value="${cList }" />
	<c:set var="glist" value="${gList }" />
	
	<div class="admin_music_modify_wrapper">
	
		<div class="admin_music_modify_container">
		
			<div class="music_img_container">
				<c:forEach items="${arrimgs }" var="imgs">
					<div class="music_imgBoxes">
						<img alt="" src="./resources/upload/music/${imgs }">
					</div>
				</c:forEach>
			</div> <!-- music_img_container -->
		
			<div class="music_modify_form">
			
				<form enctype="multipart/form-data" method="post" 
					action="<%=request.getContextPath() %>/admin_music_update_ok.do">
					
					<input type="hidden" value="${mCont.music_coverimage }" name="oldimgs">
					
					<input type="hidden" value="${mCont.music_no }" name="music_no">
					
					<div>
						그룹 선택 
						<select name="group_name">	
							<c:forEach items="${glist }" var="gdto">
								<c:if test="${gdto.group_name == mCont.group_name }">
									<option value="${gdto.group_name }" selected>
										${gdto.group_name }
									</option>	
								</c:if>
								<c:if test="${gdto.group_name != mCont.group_name }">
									<option value="${gdto.group_name}">
										${gdto.group_name }
									</option>
								</c:if>
									
							</c:forEach>	
						</select>
						
						셀럽 선택
						<select name="celeb_name">	
							<option value="">
							선택 안함
							</option>
							<c:forEach items="${clist }" var="cdto">
								<c:if test="${cdto.celeb_name == mCont.celeb_name }">
									<option value="${cdto.celeb_name }" selected>
										${cdto.celeb_name }
									</option>
								</c:if>
								<c:if test="${cdto.celeb_name != mCont.celeb_name }">
									<option value="${cdto.celeb_name }">
										${cdto.celeb_name }
									</option>
								</c:if>
							</c:forEach>	
						</select>
					</div>
					<div>
						<label for="aname">앨범 이름</label> <input id="aname" name="music_aname" value="${mCont.music_aname }" readonly>
					</div>
					<div>
						<label for="name">곡명</label> <input id="name" name="music_name" value="${mCont.music_name }" readonly>
					</div>
					<div>
						<label for="lyrics">가사</label> <textarea rows="20" cols="50" id="lyrics" name="music_lyrics">${mCont.music_lyrics }</textarea>
					</div>
					<div>
						<label for="composer">작곡가</label> <input id="composer" name="music_composer" value="${mCont.music_composer }">
					</div>
					<div>
						<label for="lyricst">작사가</label> <input id="lyricst" name="music_lyricst" value="${mCont.music_lyricst }">
					</div>
					
					<div>
						<label for="link">뮤비 링크</label> <input id="link" name="music_movie_link" value="${mCont.music_movie_link }">
					</div>
					<div>
						<label for="release">발매일</label> <input id="release" type="date" name="music_release_date" value="${mCont.music_release_date.substring(0, 10) }">
					</div>
					
					<div>
						<input type="file" name="file1" multiple="multiple">
					</div>
					<div class="update_btn">
						<input type="submit" value="고!">
						<input type="reset" value="다시작성">
					</div>
				</form>
				
			</div> <!--music_modify_form -->
			
			
			
			
			
			
			
		</div> <!-- admin_music_modify_container -->
	</div> <!-- admin_music_modify_wrapper -->

</body>
</html>