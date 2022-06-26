<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
						제품의 개당 가격: <fmt:parseNumber value="${odto.order_pprice }" />
					</div>
					<div>
						총금액: <fmt:parseNumber value="${odto.order_total }" />
					</div>
					<div>
						운송비: <fmt:parseNumber value="${odto.order_tcost }" />
					</div>
					
					<div>
						마일리지: <fmt:parseNumber value="${odto.order_mileage }" />
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
					<div>
						수취인: ${odto.order_receivername }
					</div>
					<div>
						수취인 주소: ${odto.order_receiveraddress }
					</div>
					<div>
						수취인 연락처: ${odto.order_receiverphone }
					</div>
					
				</div> <!-- order_cont_info_box -->
			
				</c:forEach>
			</div>
		</div> <!-- order_container -->
	
	</div> <!-- admin_order_cont_wrapper -->
</body>
</html>