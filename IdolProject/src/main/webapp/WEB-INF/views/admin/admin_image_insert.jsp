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
		
		
		<div class="admin_image_container">
			<form method="post" enctype="multipart/form-data"  
				action="<%=request.getContextPath()%>/admin_insert_image_ok.do">
				<div> 
					이미지 링크<input name="image_link"> 
				</div>
				<div> 
					순번 정하기<input type="number" name="image_priority" min="1" max="10"> 
				</div>
				<div>
					on/off 선택<select name="image_visible">
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
				<div>
					<input type="file" multiple="multiple" name="file">
				</div>
				<input type="submit" value="등록">
				<input type="reset" value="다시작성">
			
			</form>
		</div> <!--admin_image_container end  -->
			
	
	</div> <!-- admin_image_wrapper end -->


</body>
</html>