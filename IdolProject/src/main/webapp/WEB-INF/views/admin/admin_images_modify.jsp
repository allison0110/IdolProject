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
	
	.admin_content_wrapper {
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
	
	.admin_content_box {
	
	
	}
	
	.admin_content_container {
		display: flex;
   		flex-direction: column;
		align-items: center;
	}
	
	
</style>
</head>
<body>

	<c:set var="cont" value="${imagesModify }" />
	<div class="admin_content_wrapper">
		<div class="admin_content_container">
		
			
			<div class="admin_content_box">
			<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath() %>/admin_images_modify_ok.do">
			
			<input type="hidden" name="image_no" value="${cont.image_no }">
			<input type="hidden" name="oldPath" value="${cont.image_path }">
			
				<ul>
					<li>
						이미지 링크 : <input name="image_link" value="${cont.image_link }">
					</li>
					<li>
						이미지 순서 : <input type="number" name="image_priority" value="${cont.image_priority }">
					</li>
					<li>
					<select name="image_visible">
						<option>
							on/off 선택
						</option>
						<c:if test="${cont.image_visible == 1 }">
							<option value="1" selected>
								on (val=1)
							</option>
							<option value="0">
								off (val=0)
							</option>
						</c:if>
						<c:if test="${cont.image_visible == 0 }">
							<option value="1">
								on (val=1)
							</option>
							<option value="0" selected>
								off (val=0)
							</option>	
						</c:if>
					</select>
					</li>
					<li>
						이미지 path: <input name="file" type="file" multiple="multiple">
					</li>
					
				</ul>
				
				<input type="submit" value="등록">
				<input type="reset" value="다시작성">
				<input type="button" value="리스트"
				onclick = "location.href='admin_main.do'">
				</form>
			</div> <!-- admin_content_box end  -->
		</div> <!-- the end of admin_content_container -->
	</div> <!-- the end of admin_content_wrapper -->
</body>
</html>