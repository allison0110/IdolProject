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
<link rel="stylesheet" href="./resources/css/member.css">
<style type="text/css">
	
	

	/* .mypage_container{
		display:flex;	
		width:80%;
		
		border:1px solid lightgray;
		
	}
	
	.mypage_aside{
		width:18%;
		border: 1px solid lightgray;
	}
	
	.profile_box{
		
		padding:20px;
		background-color:#dadbdb;
		
	}
	
	.profile_image{
		display:block;
		overflow:hidden;
		border-radius: 50%;
		width:175px;
		height:175px;
		margin-top:7%;
		margin-left: 15%;
	}

	.profile_image >img{
		display:block;
		width:auto;
		height:100%
	}
	
	.info{
		margin-top:5%;
		margin-bottom:30px;
		text-align: center;
	}
	
	.info_cont{
		padding:10px;
		font-weight: bold;
		color:white;
		
		
	}
	
	.info_cont .nickname{
		display:inline-block;
		font-size:1.2em;
		margin-bottom:5px;
	}
	
	.mypage_menu ul{
		list-style: none;
		line-height: 3;
		font-size: 1.2em;
	}
	
	.mypage_menu ul a{
		text-decoration: none;
		color:black;
	}
	
	.mypage_menu ul a:hover {
	
		color:green;
	}
	
	
	
	.mypage_main{
		width:90%;
	} */
	
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
		font-size:3em;
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
		width:30%;
		
		border:1px solid lightgray;
	
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
	
	.recent_order span, .recent_qna span{
		font-size: 1.3em;
		font-weight: bold;
	}

</style>
</head>
<body>
	
	
	<c:set var="mileDto" value="${mileage }"/>	
	<div class="mypage_container" algin="center">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main">
			<div class="mypage_main_top" algin="center">
			
				<div class="top_item" align="center">
				 <a href="#">
					<div class="main_top_icon icon_point">
						<label for="icon_point" class="bi bi-wallet2"></label>
					</div>
				포인트
				<br>
				
				<span>
					<c:if test="${empty mileDto.getMileage_remaining() }">0</c:if> 
					<c:if test="${!empty mileDto.getMileage_remaining() }">
					<fmt:formatNumber value="${mileDto.getMileage_remaining()}" /> 
					</c:if>
				</span>
				</a>
				</div>
				
				<div class="top_item" align="center">
				<a href="#">
					<div class="main_top_icon icon_delivery">
						<label for="icon_delivery" class="bi bi-truck"></label>
					</div>
				주문/배송
				</a>
				</div>
				
				<div class="top_item" align="center">
				<a href="#">
					<div class="main_top_icon icon_qna">
						<label for="icon_qna" class="bi bi-chat-left-dots"></label>
					</div>
				온라인문의
				</a>
				</div>
				
			
			</div> <!-- class="mypage_main_top" end -->
		
			<div class="recent_order">
			<span>최근 구매내역</span> <!-- 최근 구매내역 3개까지 -->
			<hr align="left" width="100%" color="lightgray">
			<div class="recent_order_content">
			
					<!-- 구매내역 없음  -->
			
					<!-- 구매내역 있으면 for문돌려 3개까지 보이기(order_item) -->
			<div class="order_item">
				<div class="order_photo">
					<a href="#"> <img > 제품이미지 </a>
				</div>
				<div class="order_info">
					<span>날짜</span>
					<a href="#">제품명</a>
					<span>가격</span>
				</div>
			</div>
			</div><!-- class="recent_order_content" end -->
			
			</div> <!-- class="recent_order" end -->
		
			<div class="recent_qna">
			<span>최근 문의내역</span>
			<hr align="left"  width="100%" color="lightgray">
			<div class="recent_qna_content">
			
			</div>
			
			</div>
			
		</div><!-- class="mypage_main" end -->
	
	</div><!-- class="mypage_container" end -->

</body>
</html>