<%@page import="java.util.StringTokenizer"%>
<%@page import="com.idol.model.MusicDTO"%>
<%@page import="com.idol.model.FollowDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${id }님의 피드 - Like</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Icons"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols"
      rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="./resources/css/member.css?v=2022062212">
<style type="text/css">
	
.posting_cards{
	background-color:white;
	padding:30px;
	
	margin:0 auto;
	max-width: 1000px;
	display:grid;
	grid-template-columns:repeat(auto-fill,minmax(220px,1fr));
	gap:20px;
	
}
	
/* .card{
	box-shadow: 0 0 3px rgba(0,0,0, 0.1);
} */

.card_image {
	width:100%;
	display:block;
}

.card_category{
	font-size:0.8em;
	padding:10px;
	background:#fafafa;
	text-align: left;
}

.card_content{
	line-height: 1.5;
	font-size:0.9em;
	padding:10px;
	background:#fafafa;
	text-align: left;
}

.card_content >p:first-of-type{
	margin-top:0;
	margin-bottom:0;
}

.card_userid{
	display:flex;
	margin:10px;
	font-size:0.9em;
}

.card_userid>div:last-of-type{
	margin-left:8px;
}

.userid_img{

	display:block;
		overflow:hidden;
		border-radius: 50%;
		width:20px;
		height:20px;
}

.userid_img >img{
		display:block;
		width:auto;
		height:100%
	}


.card_info{
	padding:10px;
	display:flex;
	justify-content: space-between;
	align-items:center;
	background:#eeeeee;
	font-size:0.8em;
	border-bottom:2px solid #cccccc;
	color:#555555;
}

.material-symbols-outlined {
  font-variation-settings:
  'FILL' 100,
  'wght' 400,
  'GRAD' 0,
  'opsz' 48
}


.card_info i{
	font-size:0.95em;
	margin-right :5px;
	
}

.card_link {
	color:#626262;
	text-decoration: none;
}

.card_link:hover {
	text-decoration: underline;
}

</style>
</head>
<body>
	<c:set var="dto" value="${feedInfo.get('mInfo') }"/> <!-- 피드회원정보 -->
	<c:set var="comm" value="${feedInfo.get('commList') }"/> <!--피드 회원의 커뮤니티게시글 리스트 -->
	<%@include file="../include/user_top.jsp" %>
	
	<div class="feed_wrapper" align="center">
	<div class="myfeed_container" align="center">
		<!-- myfeed_top include 추가  -->
		<jsp:include page="../include/feed_top.jsp"/>
		
		<div class="feed_main">
			<div class="feed_title">
				<table>
					<tr>
						<td>
							<a href="<%=request.getContextPath() %>/myfeed.do?id=${dto.getMember_id()}" style="color: gray; ">
							ABOUT
							</a>
						</td>
						<td style="border-bottom:1px solid #2a3a52">
							<a href="#" style="color: black;">POSTING</a>
						</td >
						<td >
							<a href="<%=request.getContextPath() %>/feed_like.do?id=${dto.getMember_id()}" style="color: gray;">LIKE♥</a>
						</td>
					</tr>
				</table>
			</div><!-- class="feed_title"  end -->
			
			<div class="posting_cards">
			<c:if test="${empty comm }">
			<p> 작성한 게시글이 없습니다.</p>
			</c:if>
			<c:if test="${!empty comm }">
			<c:forEach items="${comm }" var="list">
			<div class="card">
				<img alt="" src="https://fakeimg.pl/400x300/009578/fff/" class="card_image">
				<div class="card_category">
				 <span>카테고리</span> | <span>${list.getCommunity_date().substring(0,10) }</span>
				</div>
				<div class="card_content">
				<p>
					<c:if test="${list.getCommunity_cont().length() > 30 }">
						${list.getCommunity_cont().substring(0,30) } ...
					</c:if>
					<c:if test="${list.getCommunity_cont().length() <= 30 }">
						${list.getCommunity_cont()}
					</c:if>
				</p>
			</div>
			<div class="card_userid">
				<div class="userid_img">
					<img src="./resources/upload/member_image/${dto.getMember_no() }/${dto.getMember_image() }" alt="member_image">
				</div>
				<div>
					${list.getCommunity_userid() }
				</div>
			</div>
			<div class="card_info">
				<div>
					<i class="material-symbols-outlined">thumb_up</i>${list.getCommunity_recommend() }
					&nbsp;&nbsp;<i class="material-symbols-outlined">visibility</i>${list.getCommunity_hit() }
				</div>
					<div>
					<a href="./" class="card_link">Read More</a>
				</div>
			</div>
		</div> <!-- class="card" end  -->
				
				</c:forEach>
			</c:if>
			</div><!-- class="posting_cards" -->
			
			
			
			
		
		</div><!-- class="feed_main" end -->
	
	</div><!-- class="myfeed_container" end -->
	</div>
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>