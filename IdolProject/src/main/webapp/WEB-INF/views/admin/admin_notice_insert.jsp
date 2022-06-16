<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	
	<div class="admin_notice_insert_wrapper">
		<div class="admin_notice_insert_form">
			<form method="post" enctype="multipart/form-data" 
				action="<%=request.getContextPath()%>/admin_notice_insert_ok.do">
			<input type="hidden" name="admin_id" value="${admin_id }">
				<ul>
					<li>
						제목 : <input name="notice_title">
					</li>
					<li>
						내용: <textarea rows="17" cols="25" name="notice_cont"></textarea>
					</li>
					<li>
						종료일<input type="date" name="notice_enddate">
					</li>
					<li>
						이미지<input type="file" multiple="multiple" name="file">
					</li>
					<li>
						<input type="submit" value="등록">
						<input type="reset" value="다시작성">
					</li>
					
					
				</ul>
			</form>		
		</div>
	
	</div> <!-- admin_notice_insert_wrapper -->
</body>
</html>