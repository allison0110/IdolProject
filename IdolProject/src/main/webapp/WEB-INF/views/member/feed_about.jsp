<%@page import="com.idol.model.BoardCategoryDTO"%>
<%@page import="com.idol.model.CommunityDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${id }λμ νΌλ - about</title>
<link href="https://fonts.googleapis.com/css2?family=Material+Icons"
      rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Material+Symbols"
      rel="stylesheet">
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200" />
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
	
	.feed_posting{
		background-color:white;
		padding:20px;
		
		margin:0 auto;
		max-width: 1000px;
		display:grid;
		grid-template-columns:repeat(auto-fill,minmax(220px,1fr));
		gap:20px;
		
	}
	
	.card_image {
	width:100%;
	height:269px;
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
	height:43px;
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
	<c:set var="dto" value="${feedInfo.get('mInfo') }"/> <!-- νμμ λ³΄ -->
	<c:set var="fav" value="${favList }"/> <!-- μ’μνλ κ°μ μ λ³΄κ° λ€μ λ¦¬μ€νΈ  -->
	<c:set var="comm" value="${community }"/> <!--νΌλ νμμ μ»€λ?€λν°κ²μκΈ λ¦¬μ€νΈ -->
	<%@include file="../include/user_top.jsp" %>
	
	<div class="feed_wrapper" align="center">
	<div class="myfeed_container" align="center">
		<!-- myfeed_top include μΆκ°  -->
		<jsp:include page="../include/feed_top.jsp"/>
		
		<div class="feed_main" >
			<div class="feed_title">
				<table>
					<tr>
						<td style="border-bottom:1px solid #2a3a52">
							<a href="<%=request.getContextPath() %>/myfeed.do?id=${dto.getMember_id()}" style="color: black; ">
							ABOUT
							</a>
						</td>
						<td >
							<a href="<%=request.getContextPath() %>/feed_posting.do?id=${dto.getMember_id()}" style="color: gray;">POSTING</a>
						</td >
						<td >
							<a href="<%=request.getContextPath() %>/feed_like.do?id=${dto.getMember_id()}" style="color: gray;">LIKEβ₯</a>
						</td>
					</tr>
				</table>
			</div><!-- class="feed_title"  end -->
			<div class="feed_introduction" align="left">
				<div class="introduction_cont">
				<% pageContext.setAttribute("replaceChar", "\n"); %>
				<p>
				  	<c:set var="content" value="${fn:replace(dto.getMember_introduction(), replaceChar, '<br>') }"/>
				  	${content }
				</p>
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
						<c:if test="${list[3] == 'solo' }"> <!-- μλ‘ κ°μμΈ κ²½μ° -->
						
							<div class="fav_item" >
							<a href="#">
							<div class="fav_img" >
								<img src="./resources/upload/celeb/${list[2] }" alt="celeb_image">
							</div>
							<div class="fav_name">
								${list[1] } <!-- κ°μμ λ³΄λ‘ λμ΄κ°λ aνκ·Έ λ²νΈ list[0] -->
							</div>
							</a>
							</div><!-- class="fav_item" -->
						
						</c:if>
						<c:if test="${list[3] != 'solo' }"> <!-- κ·Έλ£Ήκ°μμΈ κ²½μ° -->
							<div class="fav_item">
							<a href="#">
							<div class="fav_img">
								<img src="./resources/upload/group/${list[2] }" alt="group_image">
							</div>
							<div class="fav_name">
								${list[1] } <!-- κ°μμ λ³΄λ‘ λμ΄κ°λ aνκ·Έ λ²νΈ list[0] -->
							</div>
							</a>
							</div>
						</c:if>
						</c:forEach>
						</div><!-- class="fav_list" -->
						</c:if>
						<c:if test="${empty fav }">
						<div class="fav_list" >
							<p>μ νν κ°μκ° μμ΅λλ€.</p>
						</div>
						</c:if>
						
						</td>
					</tr>
				</table>
				<hr>
			</div><!-- class="feed_introduction" -->
			<c:if test="${!empty comm }">
			<div class="feed_posting">
			 <!-- μ»€λ?€λν°κ²μκΈ μ΅μ  3κ° λ³΄μ¬μ£ΌκΈ°  -->
			 <c:set var="recent" value="1"/>
			 <c:set var="recentFlag" value="false"/>
			 <c:forEach items="${comm }" var="c">
			 	<c:if test="${not recentFlag }">
			 	<div class="card">
			 		<c:if test="${not empty c.community_image}"> <!-- κ²μν μ΄λ―Έμ§κ° μλ κ²½μ° -->
			 		<c:set var="num" value="0"/> <!-- μ΄λ―Έμ§λ₯Ό μν num -->
			 		<c:set var="flag" value="false"/> <!-- μ΄λ―Έμ§λ₯Ό μν flag  -->
			 			<c:forTokens items="${c.community_image }" delims="|" var="image">
			 			<c:if test="${not flag }">
			 				<img alt="" src="./resources/upload/community/${image }" class="card_image"> 
			 				<c:set var="num" value="1"/>
			 			</c:if>
			 			<c:if test="${num == 1 }">
			 				<c:set var="flag" value="true"></c:set>
			 			</c:if>
			 			</c:forTokens>
			 		</c:if>
			 		<c:if test="${empty c.community_image }"> <!-- κ²μν μ΄λ―Έμ§κ° μλ κ²½μ° -->
			 		 <img alt="" src="./resources/upload/logo.png" class="card_image">
			 		</c:if>
					
					<c:set var="cList" value="${cList }"/>
					<div class="card_category">
					<c:forEach items="${cList }" var="category">
						<c:if test="${c.getCategory_cnofk() == category.getCategory_cno() }">
							 <span>${category.getCategory_cname() }</span> | <span>${c.getCommunity_date().substring(0,10) }</span>
						</c:if>
					</c:forEach>
					</div><!-- class="card_category" end -->
					
					<div class="card_content">
						<p> <c:if test="${c.getCommunity_cont().length() > 30 }">
							${c.getCommunity_cont().substring(0,30) }...
							</c:if>
							<c:if test="${c.getCommunity_cont().length() <= 30 }">
							${c.getCommunity_cont() }
							</c:if>
						</p>
					</div><!-- class="card_content" end -->
					
					<div class="card_userid">
					<div class="userid_img">
						<img src="./resources/upload/member_image/${dto.getMember_no() }/${dto.getMember_image() }" alt="member_image">
					</div>
					<div>
						${c.getCommunity_userid() }
					</div>
					</div><!-- class="card_userid" end -->
					
					<div class="card_info">
					<div>
						<i class="material-symbols-outlined">thumb_up</i>${c.getCommunity_recommend() }
						&nbsp;&nbsp;<i class="material-symbols-outlined">visibility</i>${c.getCommunity_hit() }
					</div>
						<div>
						<a href="<%=request.getContextPath()%>/community_boardContent.do?bno=${c.getCommunity_no()}" class="card_link">Read More</a>
					</div>
				</div> <!-- class="card_info" end -->
				
				
			</div> <!-- class="card" end  -->
			<c:set var="recent" value="${recent +1 }"/>
			 </c:if>
			 <c:if test="${recent == 4 }">
			 	<c:set var="recentFlag" value="true"/>
			 </c:if>
			 </c:forEach>
			
			</div> <!-- class="feed_posting" end -->
			</c:if>
		</div><!-- class="feed_main" end -->
	
	</div><!-- class="myfeed_container" end -->
	</div>
	<%@include file="../include/user_bottom.jsp" %>

	
	
</body>
</html>