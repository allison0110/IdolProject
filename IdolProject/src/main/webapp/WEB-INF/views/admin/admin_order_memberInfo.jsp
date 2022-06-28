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
<!-- 구매내역 리스트 by user_id -->
<c:set var="dto" value="${mList }" />

	<div class="admin_memberInfo_wrapper">
	
		<div class="admin_memberInfo_container">
		
			<h1>test</h1>
			
			<c:forEach items="${mList }" var="dto">
		
				<div>
					${dto.order_date.substring(0, 10) }
				</div>
				<div class="admin_member_purchase_detail">
					<div>
						No. : ${dto.order_no }
					</div>
					<div>
						ID : ${dto.order_userid }
					</div>
					<div>	
						${dto.order_mileage }
					</div>
					<div>
						수량 : ${dto.order_qty }
					</div>
					<div>
						개당 구매 금액 : ${dto.order_pprice }
					</div>
					<div>
						총 구매금액 : ${dto.order_total }
					</div>
					<div>
					<c:if test="${!empty dto.order_tcost }">
						배송료 : ${dto.order_tcost }
					</c:if>
					<c:if test="${empty dto.order_tcost }">
					
					</c:if>
					</div>
					
				</div> <!-- admin_member_purchase_detail -->
	
			</c:forEach>
				
		</div> <!-- admin_memberInfo_container -->
		
		<div class="member_order_address">
			<div>
			[주소]
			</div>
			<c:forEach begin="0" end="0" items="${mList }" var="addr">
				<div>			
					수령인 : ${addr.order_receivername }
				</div>
				<div>
					수령인 연락처: ${addr.order_receiverphone }
				</div>
				<div>
					수령인 주소: ${addr.order_receiveraddress }
				</div>
			</c:forEach>
		</div>
		
		
		
	</div> <!-- admin_memberInfo_wrapper -->

</body>
</html>