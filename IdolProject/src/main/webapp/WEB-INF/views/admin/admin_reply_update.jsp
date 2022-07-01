<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
</head>
<body>
<c:set var="dto" value="${replyCont }" />
<c:set var="origin" value="${originNo }" />

<div class="admin_replay_updateForm_wrapper">
	<div class="admin_reply_updateForm_container">
		<form method="post" action="<%=request.getContextPath()%>/admin_reply_update_ok.do">
			<input type="hidden" name="inquiry_no" value="${dto.inquiry_no }">
			<input type="hidden" name="originNo" value="${origin }">
			<input type="hidden" name="product_no" value="${dto.product_no }">
			<input type="hidden" name="order_no" value="${dto.order_no }">
			
			<div class="reply_update_form">
				<span>
					${dto.inquiry_title }
				</span>
				<span>
					${dto.inquiry_userid }
				</span>
				<div>
				원글 번호 :  ${origin }
				</div>
				<span>
				<c:if test="${empty dto.inquiry_update }">
					${dto.inquiry_date.substring(0, 10) }
				</c:if>
				<c:if test="${!empty dto.inquiry_update }">
					${dto.inquiry_update.substring(0, 10) }
				</c:if>
				</span>
				내용<textarea rows="20" cols="30" name="inquiry_cont">${dto.inquiry_cont }</textarea>
			</div>
			
			<div class="reply_update_btn">
				<input type="submit" value="GO!!">
				<input type="reset" value="RESET">				
			</div> <!-- reply_update_btn -->
		</form> 
	</div> <!-- admin_reply_updateForm_container -->
</div><!-- admin_replay_updateForm_wrapper -->



</body>
</html>