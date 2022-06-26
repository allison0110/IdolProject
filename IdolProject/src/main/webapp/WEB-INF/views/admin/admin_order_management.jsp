<%@page import="java.util.StringTokenizer"%>
<%@page import="com.idol.model.OrderDTO"%>
<%@page import="java.util.List"%>
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
		padding: 0px;
		margin: 0px;
		background-color: black;
		height: 100%;
	}
	a {
		text-decoration: none;
	}
	
	.products_order_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	.products_order_container {
		display: flex;
		flex-direction: column;
		align-items: center;
		row-gap: 10px;
	}
	
	.order_boxes_tag {
		
	}
	.order_boxes {
		border: 1px solid pink;
		width: 80%;
		height: 147px;
		display: flex;
		flex-direction: row;
		align-items: center;
	}
	
	.order_boxes a {
		color: white;
	}
	
	.order_img {
		flex: 10%;
		height: 100%;
	}
	.order_img img {
		width: 147px;
		height: 147px;
	}
	
	.order_detail {
		flex: 90%;
		color: white;
		display: flex;
	    flex-wrap: wrap;
	    flex-direction: row;	
	    justify-content: space-between;
	    align-items: center;
	    margin: 0px 20px;
	}
	
	
	
	
</style>
	
	
	
	
	
</head>
<body>
	<c:set var="olist" value="${oList }" />

	<div class="products_order_wrapper"> 
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_products_include.jsp" />
	
		<div class="products_order_container">
		
			<div class="order_calendar">
			</div> <!-- order_calendar -->
		<%
		List<OrderDTO> oList = (List<OrderDTO>)request.getAttribute("oList");
		
		for(int i = 0; i < oList.size(); i++){
			
			OrderDTO dto = oList.get(i);
			
			String img = dto.getOrder_pimage();
			
			StringTokenizer tokenizer = new StringTokenizer(img, "|");
			
			String[] imgList = new String[tokenizer.countTokens()];
			
			for(int j = 0; j <imgList.length; j++){
				
				imgList[j] = tokenizer.nextToken();
			}
		
		%>
		
			
				<div class="order_boxes">	
					<a class="order_boxes_tag" href="<%=request.getContextPath() %>/admin_order_productCont.do?no=<%=dto.getOrder_no()%>">
						<div class="order_img">
							<img alt="" src="./resources/upload/product/<%=imgList[0]%>">
						</div><!-- order_img -->
					</a> <!-- order_boxes_tag -->	
					
					<div class="order_detail">
				
						<div>
							<a href="<%=request.getContextPath()%>/admin_memeber_purchaseInfo.do?name=<%=dto.getOrder_userid()%>">
								주문자 ID: <%=dto.getOrder_userid() %>
							</a>
						</div>
				
						<div>
							<a href="<%=request.getContextPath()%>/admin_order_groupCont.do?no=<%=dto.getOrder_group()%>">
								주문 번호: <%=dto.getOrder_group() %>
							</a>
						</div>
						<div>
							수량: <%=dto.getOrder_qty() %>
						</div>
						<div>
							총금액: <%=String.format("%,d", dto.getOrder_total()) %> 원
						</div>
						<div>
							운송비 : <%=String.format("%,d", dto.getOrder_pprice()) %> 원
						</div>
						
						<div>
							수취인 : <%=dto.getOrder_receivername() %>
						</div>
						<div>
							수취인 연락처: <%=dto.getOrder_receiverphone() %>
						</div>
						<div>
							수취인 주소 : <%=dto.getOrder_receiveraddress() %>
						</div>
						<div>
							주문 날짜 : <%=dto.getOrder_date().substring(0, 10) %>
						</div>
					
					
					</div> <!-- order_detail -->
				</div> <!-- order_boxes -->
			
			
		<%}%>
			
			
		</div> <!-- products_order_container -->
	</div> <!-- products_order_wrapper -->


</body>
</html>