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

	<c:set var="cont" value="${imageCont }" />
	<c:set var="imgs" value="${arrayImgs }" />
	
	<div class="admin_content_wrapper">
	
		<div class="admin_content_container">
		
			
			<div class="admin_content_box">
				<ul>
					<li>
						이미지 NO. : ${cont.image_no }
					</li>
					<li>
						이미지 path: ${cont.image_path }
					</li>
					<li>
						이미지 링크 : ${cont.image_link }
					</li>
					<li>
						이미지 순서 : ${cont.image_priority }
					</li>
					<li>
						<c:if test="${cont.image_visible == 1 }">
						visible : on
						</c:if>
						<c:if test="${cont.image_visible == 0 }">
						visible : off
						</c:if>
					</li>
					
				</ul>
				
				<input type="button" value="수정"
				onclick="location.href='admin_images_modify.do?no=${cont.image_no}'">
				<input type="button" value="삭제"
				onclick="if(confirm('삭제 하시겠습니까 ?? :(')){
					location.href='<%=request.getContextPath()%>/admin_images_delete.do?no=${cont.image_no }&imgs=${cont.image_path }'
				}else {return}">
				<input type="button" value="메인으로"
				onclick = "location.href='admin_main.do'">
			</div>
		</div> <!-- the end of admin_content_container -->
	</div> <!-- the end of admin_content_wrapper -->
</body>
</html>