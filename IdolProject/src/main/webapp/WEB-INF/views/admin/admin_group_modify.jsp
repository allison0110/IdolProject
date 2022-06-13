<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:set var="dto" value="${groupCont }" />
	
	<div class="admin_group_modify_wrapper">
		
		<div class="admin_group_modify_container">
		
			<form method="post" enctype="multipart/form-data" 
				action="<%=request.getContextPath()%>/admin_group_modify_ok.do">
			
			<input type="hidden" value="${dto.group_no }" name="group_no">
			<input type="hidden" value="${dto.group_image }" name="oldImgs">
			
				<div class="admin_group_modify_form">
					<div>
						그룹 명 : <input value="${dto.group_name }" name="group_name" readonly>
					</div>
					<div>
						<textarea rows="17" cols="25" name="group_info">${dto.group_info }</textarea>			
					</div>
					<div>
						<input multiple="multiple" type="file" name="file1">
					</div>
				</div>		
				<div>
					<input type="submit" value="수정"> 
					<input type="reset" value="다시작성"> 
				</div>
			</form>
		</div> <!-- admin_group_modify_wrapper -->
	
	</div> <!-- admin_group_modify_wrapper -->
	

</body>
</html>