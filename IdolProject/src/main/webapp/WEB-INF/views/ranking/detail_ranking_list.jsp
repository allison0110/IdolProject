<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rankWrapper{
	width: 980px;
	min-height: 80%;
	margin: 0 auto;
	margin-top: 40px;
	display: flex;
}
.sidenav {
  height: 100%;
  width: 240px;
  z-index: 1;
  top: 100px;
  left: 250px;
  background-color: white;
  overflow-x: hidden;
  padding-top: 20px;
  
}


.sidenav_menu{
padding-bottom: 16px;
}
.sidenav a {
  padding: 6px 6px 6px 6px;
  text-decoration: none;
  font-size: 20px;
  color: #242424;
  display: block;
  padding-bottom:
}
.sidenav a:hover {
  color: red;
}
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
}

.rank_header{
border-top: 1px solid lightgray;
height: 100%;
width: 720px;

}

.rank_header ul li{
border-bottom: 1px solid lightgray;
padding-top: 16px;
display:flex;
justify-content:center;

}
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 16px;}
}

.rankContent_row_image{
width:48px;
height:48px;
padding-bottom: 16px;
margin-right: 8px;

}

.rankContent_row_image img{
width:48px;
height:48px;

}

.rankContent_wrap{
width:550px;
height:80px;
}

</style>
</head>
<body>
	
	
	<%@include file="../include/user_top.jsp" %>	
	
	<div class="rankWrapper">
	<div class="sidenav">
			<div class="sidenav_menu">
				<a href="<%=request.getContextPath()%>/whole_ranking.do">Overview</a>
				<a href="<%=request.getContextPath()%>/detail_ranking.do?key=point">Most points</a>
  				<a href="<%=request.getContextPath()%>/detail_ranking.do?key=purchase">Most purchase</a>
  				<a href="<%=request.getContextPath()%>/detail_ranking.do?key=message">Most message</a>
  				<a href="<%=request.getContextPath()%>/detail_ranking.do?key=comment">Most comment</a>
  				<!-- 게시글 추천수 많은 순.. community_recommend -->
				<a href="<%=request.getContextPath()%>/detail_ranking.do?key=referrals">Most referrals</a>
  				<a href="<%=request.getContextPath()%>/detail_ranking.do?key=birth">Today's birthdays</a>
  				<a href="<%=request.getContextPath()%>/chat.do">chatting</a>
  			</div>
  			<form method="get" action='<%=request.getContextPath()%>/detail_ranking.do'>

				<div class="sidenav_container">
					<h3 class="container_header">
						Find member
					</h3>
					<div class="members_search_board">
						<input type="hidden" value='<%=request.getParameter("key") %>' name="key">
						<input type="text" class="input"name="keyword" placeholder="Nickname..">&nbsp;&nbsp;
						<input type="submit" value="검색">
					</div>
				</div>
			</form>
			
	</div>
		
		<c:set var="title" value="${title }" />
		<c:set var="list" value="${rankList }" />
		<div class="rank_wrapper">
			<h2>${title }</h2>
			<div class="rank_header">
			<c:if test="${list.size() <= 0 }">
				<div>
					
				</div>
			</c:if>
			<c:if test="${list.size() > 0}">
				<c:forEach items="${list }" var="dto">
					<ul>
						<li>
							<div class="rankContent_row_image">
								<img src="./resources/upload/member_image/1/${dto.member_image }">
							</div>
							<div class="rankContent_wrap">
								<div class="rankContent_row_header">
									<span >${dto.member_nickname }</span>
								</div>
								<div class="rankContent_row_introduce">
									<a>${dto.member_introduction }</a>
								</div>
							</div>
							
							<div class="rankContent_row_score">
								<fmt:formatNumber value="${dto.score }" />
							</div>
						</li>
					</ul>
				</c:forEach>
			</c:if>
			</div>
		</div>
	</div>
	<%@include file="../include/user_bottom.jsp" %>
</body>

<script type="text/javascript">
</script>
</html>