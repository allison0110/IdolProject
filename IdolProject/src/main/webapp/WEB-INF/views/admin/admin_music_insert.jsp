<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	.admin_music_div {
		display: flex;
    	flex-direction: row;
	}
	
	.admin_music_leftSide {
		
	}

	.admin_music_rightSide {
		display: flex;
    	flex-direction: column;
	}
</style>
</head>
<body>

	<div class="admin_music_wrapper">
		<div class="admin_music_container">
			<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_music_insertOk.do">
				<div class="admin_music_div">
					<div class="admin_music_leftSide">
						<ul>
							<li>
								앨범명
							</li>
							<li>
								곡명
							</li>
							<li>
								가사
							</li>
							<li>
								작곡
							</li>
							<li>
								작사
							</li>
							<li>
								앨범이미지
							</li>
							<li>
								뮤비링크
							</li>
							<li>
								발매일
							</li>				
						</ul>
					</div>
					
					<div class="admin_music_rightSide">
					
						<input name="music_aname">
						<input name="music_name">
						<textarea rows="15" cols="25" name="music_lyrics"></textarea>
						<input name="music_composer">
						<input name="music_lyricst">
						<input type="file" multiple="multiple" name='file'>
						<input name="music_movie_link">
						<input type="date" name="music_release_date">
					</div>
				</div>
				<div>
					<input type="submit" value="등록">
					<input type="reset" value="다시작성">
				</div>
			</form>
		</div>
		
	</div>



</body>
</html>