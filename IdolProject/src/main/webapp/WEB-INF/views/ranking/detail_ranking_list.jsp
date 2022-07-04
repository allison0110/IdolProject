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

.rank_no_user li{
padding-bottom: 16px;
}

#rank_title{
padding: 0;
    margin: 0 0 3px;
    font-size: 2.6rem;
    font-weight: 400;
    margin-right: auto;
    min-width: 0;
    color: #384764;
    margin-bottom: 24px;
}
</style>
</head>
<body>
	
	
	<%@include file="../include/user_top.jsp" %>	
	
	<div class="rankWrapper">
	<%@include file="../include/ranking_sidebar.jsp" %>
		
		<c:set var="title" value="${title }" />
		<c:set var="list" value="${rankList }" />
		<div class="rank_wrapper">
			<h2 id="rank_title">${title }</h2>
			<div class="rank_header">
			<c:if test="${list.size() <= 0 }">
				<div class="rank_no_user">
					<ul>
						<li>No users match the specified criteria</li>
					</ul>
				</div>
			</c:if>
			<c:if test="${list.size() > 0}">
				<c:forEach items="${list }" var="dto">
					<ul>
						<li>
							<div class="rankContent_row_image">
								<img src="./resources/upload/member_image/*/${dto.member_image }">
							</div>
							<div class="rankContent_wrap">
								<div class="rankContent_row_header">
									<span >${dto.member_nickname }</span>
								</div>
								<div class="rankContent_row_introduce">
									<a>${dto.member_introduction }</a>
								</div>
							</div>
							
							<c:if test="${dto.score <= 0 }">
								<div>
									
								</div>
							</c:if>
							<c:if test="${dto.score > 0 }">
							<div class="rankContent_row_score">
								<fmt:formatNumber value="${dto.score }" />
							</div>
							</c:if>
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