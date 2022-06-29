<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
</style>
</head>
<body>
	
	<div class="sidenav">
			<div class="sidenav_menu">
				<a href="<%=request.getContextPath()%>/ranking_detail.do?key=point">Most points</a>
  				<a href="<%=request.getContextPath()%>/ranking_detail.do?key=purchase">Most purchase</a>
  				<a href="<%=request.getContextPath()%>/ranking_detail.do?key=message">Most message</a>
  				<a href="<%=request.getContextPath()%>/ranking_detail.do?key=follower">Most follower</a>
  				<!-- 게시글 추천수 많은 순.. community_recommend -->
				<a href="<%=request.getContextPath()%>/ranking_detail.do?key=referrals">Most referrals</a>
  				<a href="<%=request.getContextPath()%>/ranking_detail.do?key=birth">Today's birthdays</a>
  			</div>
  			<form method="get" action='<%=request.getContextPath()%>/ranking_detail.do'>

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
	
</body>
</html>