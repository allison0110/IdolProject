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
			height: 100%
		}
		
		.admin_celeb_insertForm_wrapper {
			display: flex;
			flex-direction: column;
			height: 100vh;
			align-items: center;
			justify-content: center;
		}
		
		.celeb_form {
			width: 50%;
			align-content: center;
		}
		.admin_celeb_insertForm_container {
			display: grid;
			grid-template-columns: 30% 70%;
			width: 80%;
		}
		
		.celeb_insertForm_left {
			grid-column: 1;
		}
		
		.celeb_insertForm_right {
			grind-column: 2;
		}
		
		.celeb_btn {
			display: flex;
    		flex-direction: row;
    		justify-content: center;
		}
	</style>
</head>
<body>

	<div class="admin_celeb_insertForm_wrapper">
		<form class="celeb_form" enctype="multipart/form-data" method="post"  
			action="<%=request.getContextPath()%>/admin_celeb_insert_ok.do">
			
			<div class="admin_celeb_insertForm_container">
					
				<div class="celeb_insertForm_left">
					그룹 이름
				</div>
				<div class="celeb_insertForm_right">
					<input name="celecb_group">
				</div>
				<div class="celeb_insertForm_left">
					활동 이름
				</div>
				<div class="celeb_insertForm_right">
					<input name="celecb_name">
				</div>
				<div class="celeb_insertForm_left">
					본명
				</div>
				<div class="celeb_insertForm_right">
					<input name="celeb_realname">
				</div>
				<div class="celeb_insertForm_left">
					소속사
				</div>
				<div class="celeb_insertForm_right">
					<input name="celeb_agency">
				</div>
				<div class="celeb_insertForm_left">
					생일
				</div>
				<div class="celeb_insertForm_right">
					<input type="date" name="celeb_dateofbirth">
				</div>
				<div class="celeb_insertForm_left">
					데뷔
				</div>
				<div class="celeb_insertForm_right">
					<input type="date" name="celeb_debutdate">
				</div>
				<div class="celeb_insertForm_left">
					그룹이미지
				</div>
				<div class="celeb_insertForm_right">
					<input multiple="multiple" type="file" name="celeb_gimage">
				</div>
				<div class="celeb_insertForm_left">
					개인 이미지
				</div>
				<div class="celeb_insertForm_right">
					<input multiple="multiple" type="file" name="celeb_pimage">
				</div>
			</div>
			<div class="celeb_btn">
				<div>
					<input type="submit" value="등록">
				</div>
				<div>
					<input type="reset" value="다시작성">
				</div>
			</div>
		</form>
	</div>

</body>
</html>