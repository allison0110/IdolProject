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

.w_ranking_title_value{
margin: 24px 0;

}

.overview_blocks{
padding: 8px;
}

.member_block{
display: flex;
text-align: center;
}

.member_block img{
align-items: center;
width: 32px;
height: 32px;
}
#member_nickname_div{
flex: 1;
min-width: 0;
vertical-align: top;
padding-left: 16px;
text-align: left;
}

#member_score_div{
padding-left: 16px;
padding-right: 16px;
}

#w_ranking_cate_value{
margin-bottom: 24px;
color: #7082A7
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
		<c:set var="plist" value="${pList }"/>
		<c:set var="melist" value="${meList }"/>
		<c:set var="milist" value="${miList }"/>
	<div class="w_ranking_title">
		<h1 class="w_ranking_title_value">Notable members</h1>
		
		<div>
		<a href="<%=request.getContextPath()%>/detail_ranking.do?key=point" id="w_ranking_cate_value">Most purchases</a>
		<c:forEach items="${plist }" var="pdto">
		<ol class="overview_blocks">
			<li class="overview_block">
				<h3 class="block_text_header">
				</h3>
				<ol>
					<div class="member_block">
						<img src="./resources/upload/${pdto.member_image }">
						<div id="member_nickname_div">
							<a href="<%=request.getContextPath()%>/myfeed.do">${pdto.member_nickname }</a>
						</div>
						<div id="member_score_div">
							${pdto.score }
						</div>
					</div>
				</ol>
				<div class="overview_block_seemore">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=point"></a>
				</div>
			</li>
		
		</ol>
		</c:forEach>
		<a href="<%=request.getContextPath()%>/detail_ranking.do?key=point" id="w_ranking_cate_value">Most messages</a>
		<c:forEach items="${melist }" var="medto">
		<ol class="overview_blocks">
			<li class="overview_block">
				<h3 class="block_text_header">
				</h3>
				<ol>
					<div class="member_block">
						<img src="./resources/upload/${medto.member_image }">
						<div id="member_nickname_div">
							<a href="<%=request.getContextPath()%>/myfeed.do">${medto.member_nickname }</a>
						</div>
						<div id="member_score_div">
							${medto.score }
						</div>
					</div>
				</ol>
				<div class="overview_block_seemore">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=point"></a>
				</div>
			</li>
		
		</ol>
		</c:forEach>
		</div>
	</div>
	</div>
	
	
	
	
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>