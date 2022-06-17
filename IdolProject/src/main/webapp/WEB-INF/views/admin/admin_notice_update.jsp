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
	
	.admin_notice_modify_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	.admin_notice_modify_container{
		width: 100%;
		height: 100%;
		display: flex;
		flex-direction: row;
	}
	
	.notice_img_container {
		width: 100%;
		flex: 50%;
		
	}
	
	.notice_imgBoxes {
		width: 300px;
		height: 400px;
	}
	
	.notice_imgBoxes img{
		width: 100%;
		height: 100%;
	}
	
	.notice_modify_form {
		flex: 50%;
		display: flex;
    	align-items: center;
	}
</style>
</head>
<body>
	<c:set var="nCont" value="${noticeCont }" />
	<c:set var="imgs" value="${arrayImgs }" />
	
	<div class="admin_notice_modify_wrapper">
	
		<div class="admin_notice_modify_container">
		
			<div class="notice_img_container">
				<c:forEach items="${arrayImgs }" var="imgs">
					<div class="notice_imgBoxes">
						<img alt="" src="./resources/upload/notice/${imgs }">
					</div>
				</c:forEach>
			</div> <!-- notice_img_container -->
		
			<div class="notice_modify_form">
			
				<form enctype="multipart/form-data" method="post" 
					action="<%=request.getContextPath() %>/admin_notice_update_ok.do">
					
					<input type="hidden" value="${nCont.notice_image }" name="oldimgs">
					<input type="hidden" value="${nCont.notice_no }" name="notice_no">
					<input type="hidden" value="${nCont.admin_id }" name="admin_id">
					<input type="hidden" value="${nCont.notice_date }" name="notice_date">
					
					<div>
						<label for="title">제목</label> <input id="title" name="notice_title" value="${nCont.notice_title }" readonly>
					</div>
					<div>
						<select name="notice_type">
							<option value="CELEB">
								CELEB
							</option>
							<option value="CONCERT">
								CONCERT
							</option>
						</select>
					</div>
					<div>
						<label for="cont">내용</label> <textarea rows="20" cols="50" id="cont" name="notice_cont">${nCont.notice_cont }</textarea>
					</div>
					
					<div>
						<input type="file" name="file1" multiple="multiple">
					</div>
					
					<div>
						<label for="enddate">종료일</label> <input id="enddate" type="date" name="notice_enddate" value="${nCont.notice_enddate.substring(0, 10) }">
					</div>
					<div class="update_btn">
						<input type="submit" value="고!">
						<input type="reset" value="다시작성">
					</div>
				</form>
				
			</div> <!--notice_modify_form -->
			
			
			
			
			
			
			
		</div> <!-- admin_notice_modify_container -->
	</div> <!-- admin_notice_modify_wrapper -->

</body>
</html>