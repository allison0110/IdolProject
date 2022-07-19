<%@page import="java.text.DecimalFormat"%>
<%@page import="com.idol.model.OrderDTO"%>
<%@page import="com.idol.model.InquiryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.idol.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<link rel="stylesheet" href="./resources/css/member.css?v=2022063010">
<style type="text/css">
	
	
	
	.mypage_main_top {
	
		margin-bottom:50px;
		display: flex;
		justify-content: space-between;
		
		background-color: #f7f8f8;
	}
	
	.mypage_main_top a{
		text-decoration: none;
		color:black;
		font-weight:bold;
	}
	
	.mypage_main_top span{
		font-size:2em;
		font-weight: 400;	
		
	}
	
	
	.main_top_icon{
		display:block;
		overflow:hidden;
		border-radius: 50%;
		width:60px;
		height:60px;
		margin-bottom: 10px;
	}
	
	.main_top_icon label{
		display:block;
		margin-left:auto;
		font-size: 35px;
		color:white;
		cursor: pointer;
	}
	
	.top_item {
		padding:20px;
		width:34%;
		
		border:1px solid #ececec;
	
	}
	.icon_point{
		background-color:#ffc1cc;
	}
	
	.icon_delivery{
		background-color:#ae84cd;
	}
	
	.icon_qna{
		background-color:#a3d9ef;
	}


	.recent_order, .recent_qna{
		/* margin-left:35px;
		margin-bottom: 50px; */
		
		padding: 40px;
	}
	.recent_qna i , .recent_order i{
		font-size:2em;
	}
	
	.recent_qna a , .recent_order a{
		text-decoration: none;
		color:black;
	}
	
	.recent_title{
		font-size: 1.3em;
		font-weight: bold;
	}
	
	.recent_qna_content a {
		text-decoration: none;
		color: black;
	}
	
	.order_item{
		display: flex;
		margin:20px 10px;
	}
	
	.order_item .order_photo {
		width:100px;
		height:100px;
		border-radius: 10px;
		margin-right:20px;
	}
	
	.order_photo img{
		width:100%;
		height:100%;
		}
	
	.order_item .order_info{
		line-height: 1.5;
	}
	
	.qna_item{
		margin: 10px;
		padding: 10px 0;
		line-height: 1.5;
	}
	.qna_item:hover, .order_item:hover {
		background-color:rgba(236,236,236,0.5);
		opaciy: 50%
	}
	
	.qna_item span{
		font-size: 1em;
	}

</style>
</head>
<body>
	
	<c:set var="mileage" value="${mileage }"/>	
	

	<%@include file="../include/user_top.jsp" %>
	<div class="mypage_container" >
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage">
			<div class="mypage_main_top" algin="center">
			
				<div class="top_item" align="center">
				 <a href="<%=request.getContextPath()%>/mileage_list.do">
					<div class="main_top_icon icon_point">
						<label for="icon_point" class="bi bi-wallet2"></label>
					</div>
				마일리지
				<br>
				
				<span>
					<fmt:formatNumber value="${mileage}" /> 
				</span>
				</a>
				</div>
				
				<div class="top_item" align="center">
				<a href="<%=request.getContextPath()%>/order_list.do">
					<div class="main_top_icon icon_delivery">
						<label for="icon_delivery" class="bi bi-truck"></label>
					</div>
				주문/배송
				<br>
				<span>
					<fmt:formatNumber value="${threedays}" /> 
				</span>
				</a>
				</div>
				
				<div class="top_item" align="center">
				<a href="<%=request.getContextPath()%>/inquiry_list.do">
					<div class="main_top_icon icon_qna">
						<label for="icon_qna" class="bi bi-chat-left-dots"></label>
					</div>
				온라인문의
				<br>
				<span>
					<c:if test="${empty waiting }">0</c:if> 
					<c:if test="${!empty waiting }">
					<fmt:formatNumber value="${waiting }" /> 
					</c:if>
				</span>
				</a>
				</div>
			</div> <!-- class="mypage_main_top" end -->
		
			<div class="recent_order">
			<a href="<%=request.getContextPath()%>/order_list.do"> <span class="recent_title">최근 주문내역</span>&nbsp;<i class="bi bi-plus"></i></a> 
			<hr align="left" width="100%" color="lightgray">
			<!-- 최근 구매내역 3개까지 -->
			<div class="recent_order_content">
			<!-- 구매내역 없음  -->
			<c:if test="${empty oList }">
			<span>구매내역 없음</span>
			</c:if>
			
			<!-- 구매내역 있으면 for문돌려 3개까지 보이기(order_item) -->
			<c:if test="${!empty oList }">
			<c:set var="olist" value="${oList }"/>
			
			<c:set var="orderCount" value="1"/> 
			<c:set var="orderFlag" value="false"/> 
			<c:forEach items="${olist }" var="order">
				<c:if test="${not orderFlag }">
				<a href="<%=request.getContextPath()%>/orderlist_cont.do?ogno=${order.getOrder_group()}">
					<div class="order_item">
					
					<div class="order_photo">
					<img src="./resources/upload/product/${order.getOrder_pimage() }" >
					</div>
					<div class="order_info">
						<span style="font-size:15px; color: gray;">
						${order.getOrder_date().substring(0,10) }
						</span> <br>
						<span style="font-size:1.2em; font-weight:bold;">
						${order.getOrder_pname() }</span><br>
						<span style="font-size:0.9em;">${order.getOrder_qty() }개 </span>|
						<span style="font-size:0.9em;"> <fmt:formatNumber value="${order.order_total }"/>원 </span>
					</div> 
					
					</div> <!-- class="order_item" -->
					</a>
					<c:set var="orderCount" value="${orderCount +1 }"/>				
				</c:if>
				<c:if test="${orderCount == 4 }">
					<c:set var="orderFlag" value="true"/>
				</c:if>
			</c:forEach>
			
			
			</c:if>
			</div><!-- class="recent_order_content" end -->
			
			</div> <!-- class="recent_order" end -->
		
			<div class="recent_qna">
			<a href="<%=request.getContextPath()%>/inquiry_list.do"> <span class="recent_title">최근 문의내역</span>&nbsp; <i class="bi bi-plus"></i></a>
			<hr align="left"  width="100%" color="lightgray">
			<div class="recent_qna_content"> 
			<!-- 문의내역 최신 3개만 보이기 -->
			<c:if test="${!empty iList }">
			
			<c:set var="inquiry" value="${iList }"/>
			<c:set var="flag" value="false"/> <!-- jstl 반복문 break -->
			<c:set var="count" value="1"/>
			<c:forEach items="${inquiry }" var="i">
				<c:if test="${not flag }">
					<a href="<%=request.getContextPath()%>/inquiry_cont.do?no=${i.getInquiry_no() }&page=1">
				<div class="qna_item">
					<span style="color: #1f3093;font-size: 0.9em;">
					<c:choose>
								<c:when test="${i.getCategory_inofk() ==1}">[취소/환불]</c:when>
								<c:when test="${i.getCategory_inofk() ==2}">[상품문의]</c:when>
								<c:when test="${i.getCategory_inofk() ==3}">[배송]</c:when>
								<c:when test="${i.getCategory_inofk() ==4}">[교환]</c:when>
								<c:when test="${i.getCategory_inofk() ==5}">[기타]</c:when>
					</c:choose>
					</span>
					&nbsp;<span>${i.getInquiry_title() }</span><br>
					<span style="color: #858080;font-size: 0.9em; font-weight:normal;">
					${i.getInquiry_date().substring(0, 10) }</span>│ 
					<c:if test="${i.inquiry_status == 0 }">
					<span style="color:#ff5722;font-size: 0.9em;">답변대기 </span>
					</c:if>
					<c:if test="${i.inquiry_status == 1 }">
					<span style="color:black;font-size: 0.9em;">답변완료 </span>
					</c:if>
				</div><!-- class="qna_item" end -->
				</a>
				<c:set var="count" value="${count +1 }"/>
				</c:if>
				
				<c:if test="${count == 4 }">
				 <c:set var="flag" value="true"/>
				</c:if>
			</c:forEach>
			</c:if>
			<c:if test="${empty iList }">
			<span>문의내역 없음</span>
			</c:if>
			</div><!-- class="recent_qna_content" end -->
			
			</div>
			
		</div><!-- class="mypage_main" end -->
	
	</div><!-- class="mypage_container" end -->
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>