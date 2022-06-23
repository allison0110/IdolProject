<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${id }님의 피드 - about</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="./resources/css/member.css?v=2022062212">
<style type="text/css">
	
	
	
	.feed_introduction{
		background-color:white;
		padding:20px;
		font-size:0.95em;
	}
	
	
	.feed_introduction table td{
		padding : 6px
	}
	
	.feed_introduction table tr{
		height: 80px;
	}
	
	.fav_list{
		display:flex;
	}
	
	.fav_img{
		display:block;
		overflow:hidden;
		border-radius: 50%;
		width:50px;
		height:50px;
	}
	
	.fav_img >img{
		display:block;
		width:120%;
		height:100%;
		margin-left: -5px;
	}
	
	.fav_item{
	
		margin:0 10px;
		text-align:center;
	}
	
	.fav_item a{
		text-decoration: none;
		color: black;
	}
	
	.fav_name{
		font-size:0.8em;
		
	}

</style>
</head>
<body>
	<c:set var="dto" value="${feedInfo.get('mInfo') }"/> <!-- 회원정보 -->
	<c:set var="fav" value="${favList }"/> <!-- 좋아하는 가수 정보가 들은 리스트  -->
	<%@include file="../include/user_top.jsp" %>
	
	<div class="feed_wrapper" align="center">
	<div class="myfeed_container" align="center">
		<!-- myfeed_top include 추가  -->
		<jsp:include page="../include/feed_top.jsp"/>
		
		<div class="feed_main">
			<div class="feed_title">
				<table>
					<tr>
						<td style="border-bottom:1px solid #2a3a52">
							<a href="<%=request.getContextPath() %>/myfeed.do?id=${dto.getMember_id()}" style="color: black; ">
							ABOUT
							</a>
						</td>
						<td >
							<a href="#" style="color: gray;">POSTING</a>
						</td >
						<td >
							<a href="<%=request.getContextPath() %>/feed_like.do?id=${dto.getMember_id()}" style="color: gray;">LIKE♥</a>
						</td>
					</tr>
				</table>
			</div><!-- class="feed_title"  end -->
			<div class="feed_introduction" align="left">
				<div class="introduction_cont">
				<p>${dto.getMember_introduction() }</p>
				</div>
				<hr>
				<table>
					<tr>
						<td>
							gender:
						</td>
						<td colspan="4">
						 <c:if test="${dto.getMember_gender() == 'M' }">
						  &nbsp;MALE
						 </c:if>
						 <c:if test="${dto.getMember_gender() == 'F' }">
						   &nbsp; FEMALE
						 </c:if>
						</td>
					</tr>
					<tr>
						<td>
						Favorite Celeb:
						</td>
						<td colspan="4">
						<c:if test="${!empty fav }">
						<div class="fav_list" >
						<c:forEach items="${fav }" var="list">
						<c:if test="${list[3] == 'solo' }"> <!-- 솔로 가수인 경우 -->
						
							<div class="fav_item" >
							<a href="#">
							<div class="fav_img" >
								<img src="./resources/upload/celeb/${list[2] }" alt="celeb_image">
							</div>
							<div class="fav_name">
								${list[1] } <!-- 가수정보로 넘어가는 a태그 번호 list[0] -->
							</div>
							</a>
							</div><!-- class="fav_item" -->
						
						</c:if>
						<c:if test="${list[3] != 'solo' }"> <!-- 그룹가수인 경우 -->
							<div class="fav_item">
							<a href="#">
							<div class="fav_img">
								<img src="./resources/upload/group/${list[2] }" alt="group_image">
							</div>
							<div class="fav_name">
								${list[1] } <!-- 가수정보로 넘어가는 a태그 번호 list[0] -->
							</div>
							</a>
							</div>
						</c:if>
						</c:forEach>
						</div><!-- class="fav_list" -->
						</c:if>
						<c:if test="${empty fav }">
						<div class="fav_list" >
							<p>선택한 가수가 없습니다.</p>
						</div>
						</c:if>
						
						</td>
					</tr>
				</table>
				<hr>
			</div><!-- class="feed_introduction" -->
			<div class="feed_posting">
			
			
			</div>
		
		</div><!-- class="feed_main" end -->
	
	</div><!-- class="myfeed_container" end -->
	</div>
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>