<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	.admin_image_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		align-items: center;
	}
	
	.admin_image_container {
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	
</style>
</head>
<body>
	
	<div class="admin_image_wrapper">
		<form method="post" action="<%=request.getContextPath()%>/admin_insert_image_ok.do">
		
		<div class="admin_image_container">
			<div class="admin_image_left">
				<div>이미지 경로</div>
				<div>이미지 링크</div>
				<div>이미지 순서</div>
				<div>이미지 on/off</div>
			</div>
			
			<div class="admin_image_right">
				<div> <input name="image_path"> </div>
				<div> <input name="image_link"> </div>
				<div> <input type="number" name="image_priority" min="1"> </div>
				<div>
					<select name="image_visible">
						<option>
							on/off 선택
						</option>
						<option value="1">
							on (val=1)
						</option>
						<option value="0">
							off (val=0)
						</option>
					</select>
				</div>
			</div><!-- admin_image_right end -->
		</div> <!--admin_image_container end  -->
			<input type="submit" value="등록">
			<input type="reset" value="다시작성">
			
		</form>
	</div> <!-- admin_image_wrapper end -->


</body>
</html>