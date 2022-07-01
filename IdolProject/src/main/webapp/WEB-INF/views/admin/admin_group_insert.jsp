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
			padding: 0px;
			margin: 0px;
			height: 100%;
		}
		
		.admin_group_insertForm_wrapper {
			display: flex;
			flex-direction: column;
			height: 100vh;
			align-items: center;
			justify-content: center;
			
		}
		
		.admin_celeb_insertForm_div {
			
		}
		
		.celeb_form {
			
		}
		.admin_group_insertForm_container {
			width: 400px;
		}
		
		.group_btn {
			display: flex;
    		flex-direction: row;
    		justify-content: flex-start;
		}
		
		
		
		
		
		
	</style>
	
</head>
<body>
	
	<div class="admin_group_insertForm_wrapper">
	
		<div class="admin_celeb_insertForm_div">
			
			<form class="celeb_form" enctype="multipart/form-data" method="post"  
				action="<%=request.getContextPath()%>/admin_group_insert_ok.do">
				
				<div class="admin_group_insertForm_container">
					
					
					<div >
						그룹 명: <input name="group_name">
					</div>
					
					<div>
						<textarea rows="17" cols="25" name="group_info"></textarea>
					</div>
					
					<div>
						<input multiple="multiple" type="file" name="file1">
					</div>
				
				
					<div class="group_btn">
						<div>
							<input type="submit" value="등록" id="inset_btn">
						</div>
						<div>
							<input type="reset" value="다시작성">
						</div>
						<input type="button" value="!" class="switch">
						
					</div>
				</div>
			</form>
	
		</div> <!-- admin_celeb_insertForm_div -->
	</div> <!-- admin_group_insertForm_wrapper end -->

</body>
</html>