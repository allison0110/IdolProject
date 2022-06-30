<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN MEMBER ORDER GROUP LIST</title>
<style type="text/css">
	
	html, body {
		margin: 0px;
		padding: 0px;
		background-color: black;
	
	}
	
	.admin_order_cont_wrapper {
		min-height: 100vh;
		display: flex;
		flex-direction: column;
	}
	
	.order_container {
	
	}
	
	.order_cont_img {
		width: 200px;
		display: flex;
		flex-direction: row;
	}
	
	.order_cont_img img {
		width: 100%;
		
	}
	
	.order_cont_info {
		color: white;
	
	}
	
	.order_cont_wrapper {
		display: flex;
		flex-direction: row;
		
	}
	
	.order_cont_info_box {
		border: 1px solid pink;
		color: white;
	}




	.member_order_address {
		color: white;
	
	}
</style>
</head>
<body>
<c:set var="dto" value="${orderCont }" />
<c:set var="imgs" value="${imgsList }" />

<c:set var="olist" value="${oList }" />
<c:set var="oilist" value="${oimgsList }" />

	<div class="admin_order_cont_wrapper"> 
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_products_include.jsp" />
	
		<div class="order_container">
			
					
			
			 
			 
			<div class="order_cont_wrapper">
			 
			 <c:set var="sumQty" value="0" />
			 <c:set var="sumTotal" value="0" />
			 <c:forEach items="${olist }" var="odto" varStatus="i1">
			<!-- 
				 <div class="order_cont_img">
						<img alt="" src="./resources/upload/product/${oimgsList[i1.index] }">
					</div> <!-- order_cont_img -->
			 -->		
				<div class="order_cont_info_box">
					<div>
						주문 번호: ${odto.order_no }
					</div>
					<div>
						그룹 번호 :  ${odto.order_group }
					</div>
					<div>
						아이디 : ${odto.order_userid }
					</div>
					<div>
						상품명 : ${odto.order_pname }
					</div>
					<div>
						제품 수량: ${odto.order_qty }
					</div>
					<div>
						상품 가격: <fmt:formatNumber value="${odto.order_pprice }" />원
					</div>
					<div>
						총 금액: <fmt:formatNumber value="${odto.order_total }" />원
					</div>
					<div>
						운송비: <fmt:formatNumber value="${odto.order_tcost }" />원
					</div>
					
					<div>
						마일리지: <fmt:formatNumber value="${odto.order_mileage }" /> 마일리지
					</div>
					<div>
						<c:if test="${odto.order_type == '1' }">
							카드결제
						</c:if>
						<c:if test="${odto.order_type == '0' }">
							계좌이체
						</c:if>
					</div>
					<div>
						주문날짜: ${odto.order_date.substring(0, 10) }
					</div>
				
					
				</div> <!-- order_cont_info_box -->
				<c:set var="sumQty" value="${sumQty + odto.order_qty }" />
				<c:set var="sumTotal" value="${sumTotal + odto.order_total }" />
			</c:forEach>
			</div><!-- order_cont_wrapper -->
			
			<div class="test" style="color: white">
			<ul>
				<li>
					총 수량 : <fmt:formatNumber value="${sumQty }" /> 개
					
				</li>
				<li>
					총 구매 금액: <fmt:formatNumber value="${sumTotal }" /> 원
				</li>
				
			</ul> 
				
			</div>
		<div class="member_order_address">
			<div>
			[주소]
			</div>
			<c:forEach begin="0" end="0" items="${olist }" var="addr">
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
			
			
		</div> <!-- order_container -->
	
	</div> <!-- admin_order_cont_wrapper -->
</body>
</html>