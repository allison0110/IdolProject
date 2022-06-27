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
<c:set var="icont" value="${iCont }" />
<c:set var="oldNo" value="${oldNo }" />
	<div class="admin_member_inquiryReply_wrapper">
	 	<div class="admin_member_inquiryReply_container">
	 		<form method="post" action="<%=request.getContextPath()%>/admin_inquiry_replayOk.do">
	 			<input type="hidden" name="inquiry_no" value="${icont.inquiry_no }">
	 			<input type="hidden" name="inquiry_group" value="${icont.inquiry_group }">
	 			<input type="hidden" name="inquiry_step" value="${icont.inquiry_step }">
	 			<input type="hidden" name="inquiry_indent" value="${icont.inquiry_indent }">
	 			<input type="hidden" name="inquiry_status" value="1">
	 			<input type="hidden" name="inquiry_userid" value="${admin_id }">
	 			<input type="hidden" name="product_no" value="${icont.product_no }">
	 			<input type="hidden" name="order_no" value="${icont.order_no }">
	 			<input type="hidden" name="inquiry_image" value="${icont.inquiry_image }">
	 			<input type="hidden" name="category_inofk" value="${icont.category_inofk }">
	 			<input type="hidden" name="originNo" value="${oldNo }">
				<div>
					<input name="inquiry_title" value="(RE임시)${icont.inquiry_title }">
				</div>
		 		<div>
		 			<textarea name="inquiry_cont" rows="20" cols="33"></textarea>
		 		</div>
				<input type="submit" value="GO!!">
				<input type="reset" value="RESET">
	 		</form>
	 	</div> <!-- admin_member_inquiryReply_container -->
	</div> <!-- admin_member_inquiryReply_wrapper -->



</body>
</html>