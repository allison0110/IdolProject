<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	.admin_member_purchase_detail {
		border: 1px solid black;
	
	}
</style>
</head>
<body>
<c:set var="dto" value="${mList }" />

	<div class="admin_memberInfo_wrapper">
		<div class="admin_memberInfo_container">
			
			<c:forEach items="${mList }" var="dto">
				<div>
					${dto.order_date.substring(0, 10) }
				</div>
				<div class="admin_member_purchase_detail">
					<div>	
						${dto.order_mileage }
					</div>
					<div>
						${dto.order_qty }
					</div>
					<div>
						${dto.order_total }
					</div>
					<div>
						${dto.order_tcost }
					</div>
				</div> <!-- admin_member_purchase_detail -->
	
			</c:forEach>
				
		</div> <!-- admin_memberInfo_container -->
	
	</div> <!-- admin_memberInfo_wrapper -->

</body>
</html>