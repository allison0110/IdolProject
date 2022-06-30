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

.w_rank_cont_wrap{
display: flex;

}


</style>
</head>
<body>
<%@include file="../include/user_top.jsp" %>
	
	<div class="rankWrapper">	
<%@include file="../include/ranking_sidebar.jsp" %>
		<c:set var="milist" value="${miList }"/>
		<c:set var="plist" value="${puList }"/>
		<c:set var="melist" value="${meList }"/>
		<c:set var="biList" value="${birthList }"/>
		<c:set var="reList" value="${reList }"/>
		<c:set var="coList" value="${coList }"/>
		
		<div class="w_rank_cont_wrap">
		<div class="w_ranking_title">
			<h1 class="w_ranking_title_value">Notable members</h1>
		</div>
		
		
		<div class="overview_wrap">
			<ul class="overview_blocks">
				<li class="overview_blocks.li">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=point" id="w_ranking_cate_value">Most points</a>
					<c:forEach items="${milist }" var="midto">
						<li class="overview_block">
							<h3 class="block_text_header"></h3>
							<ol>
								<li class="member_block">
									<img src="./resources/upload/${midto.member_image }">
									<div id="member_nickname_div">
										<a href="<%=request.getContextPath()%>/myfeed.do?no=${midto.member_no}">${midto.member_nickname }</a>
									</div>
									<div id="member_score_div">
										${midto.score }
									</div>
								</li>
							</ol>
						</li>
					</c:forEach>
					<div class="overview_block_seemore">
						<a href="<%=request.getContextPath()%>/detail_ranking.do?key=point">See more</a>
					</div>
				</li>
				
				<li class="overview_blocks.li">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=purchase" id="w_ranking_cate_value">Most purchases</a>
					<c:forEach items="${plist }" var="pdto">
						<li class="overview_block">
							<h3 class="block_text_header"></h3>
							<ol>
								<li class="member_block">
									<img src="./resources/upload/${pdto.member_image }">
									<div id="member_nickname_div">
										<a href="<%=request.getContextPath()%>/myfeed.do?no=${pdto.member_no}">${pdto.member_nickname }</a>
									</div>
									<div id="member_score_div">
										${pdto.score }
									</div>
								</li>
							</ol>
						</li>
					</c:forEach>
					<div class="overview_block_seemore">
						<a href="<%=request.getContextPath()%>/detail_ranking.do?key=purchase">See more</a>
					</div>
				</li>
			
			
			
				<li class="overview_blocks.li">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=message" id="w_ranking_cate_value">Most messages</a>
					<c:forEach items="${melist }" var="medto">
					<li class="overview_block">
						<h3 class="block_text_header"></h3>
						<ol>
							<li class="member_block">
								<img src="./resources/upload/${medto.member_image }">
								<div id="member_nickname_div">
									<a href="<%=request.getContextPath()%>/myfeed.do?no=${medto.member_no}">${medto.member_nickname }</a>
								</div>
								<div id="member_score_div">
									${medto.score }
								</div>
							</li>
						</ol>
					</li>
				</c:forEach>
				<div class="overview_block_seemore">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=message">See more</a>
				</div>
				</li>
				
				
				<li class="overview_blocks.li">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=comment" id="w_ranking_cate_value">Most comment</a>
					<c:forEach items="${coList }" var="cdto">
					<li class="overview_block">
						<h3 class="block_text_header"></h3>
						<ol>
							<li class="member_block">
								<img src="./resources/upload/${cdto.member_image }">
								<div id="member_nickname_div">
									<a href="<%=request.getContextPath()%>/myfeed.do?no=${cdto.member_no}">${cdto.member_nickname }</a>
								</div>
								<div id="member_score_div">
									${cdto.score }
								</div>
							</li>
						</ol>
					</li>
				</c:forEach>
				<div class="overview_block_seemore">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=comment">See more</a>
				</div>
				</li>
				
				
				<li class="overview_blocks.li">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=referrals" id="w_ranking_cate_value">Most referrals</a>
					<c:forEach items="${reList }" var="rdto">
					<li class="overview_block">
						<h3 class="block_text_header"></h3>
						<ol>
							<li class="member_block">
								<img src="./resources/upload/${rdto.member_image }">
								<div id="member_nickname_div">
									<a href="<%=request.getContextPath()%>/myfeed.do?no=${rdto.member_no}">${rdto.member_nickname }</a>
								</div>
								<div id="member_score_div">
									${rdto.score }
								</div>
							</li>
						</ol>
					</li>
				</c:forEach>
				<div class="overview_block_seemore">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=referrals">See more</a>
				</div>
				</li>
				
				
				<li class="overview_blocks.li">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=birth" id="w_ranking_cate_value">Today's birthdays</a>
					<c:forEach items="${biList }" var="bdto">
					<li class="overview_block">
						<h3 class="block_text_header"></h3>
						<ol>
							<li class="member_block">
								<img src="./resources/upload/${bdto.member_image }">
								<div id="member_nickname_div">
									<a href="<%=request.getContextPath()%>/myfeed.do?no=${bdto.member_no}">${bdto.member_nickname }</a>
								</div>
								<c:if test="${bdto.score <= 0 }">
									<div>
										
									</div>
								</c:if>
								<c:if test="${bdto.score > 0 }">
									<div id="member_score_div">
									${bdto.score }
									</div>
								</c:if>
								
							</li>
						</ol>
					</li>
				</c:forEach>
				<div class="overview_block_seemore">
					<a href="<%=request.getContextPath()%>/detail_ranking.do?key=birth">See more</a>
				</div>
				</li>
				
				
				
				
				
				
			</ul>
			</div>
			</div>
		</div>

	
	
	
	
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>