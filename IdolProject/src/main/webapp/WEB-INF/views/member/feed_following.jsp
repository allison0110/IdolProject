<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${id }님의 피드 - 팔로잉</title>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" ></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript">


</script>
<style type="text/css">

	div{
		border:1px solid gray;
	}
	
	.myfeed_container{
		background-color: #d8e0e3;
	}

	.feed_title table{
		width:1000px;
		text-align: center;
		border-bottom: 1px solid gray;
		font-weight: bold;
	}
	
	.feed_title a{
		text-decoration: none;
		
	}
	
	.feed_introduction{
		background-color:white;
		
		padding:10px;
	}

</style>
</head>
<body>
	<c:set var="dto" value="${feedInfo.get('memInfo') }"/> <!-- 회원정보 -->
	<c:set var="cont" value="${followingCont }" /> <!-- 팔로잉들 회원정보 -->
	<c:set var="login_f" value="${feedInfo.get('login_follow') }"/> <!-- 팔로워 -->
	
	<div class="myfeed_container" align="center">
		<!-- myfeed_top include 추가  -->
		<jsp:include page="../include/feed_top.jsp"/>
		
		<div class="feed_main">
			<div class="feed_title">
				<table>
					<tr>
						<td >
							<a href="<%=request.getContextPath() %>/feed_follower.do?id=${id}" style="color: gray;">팔로워</a>
						</td>
						<td >
							<a href="<%=request.getContextPath() %>/feed_following.do?id=${id}" style="color: black;">팔로잉</a>
						</td >
					</tr>
				</table>
			</div><!-- class="feed_title"  end -->
			
			<div class="feed_fList">
				<c:if test="${!empty cont }"> <!-- 피드회원의 팔로잉리스트 데이터가 있다면 -->
				<c:forEach items="${cont }" var="cont">
				<div class="fList">
					<div class="fList_img">
						<img src="./resources/upload/member_image/${cont.getMember_no() }/${cont.getMember_image() }" alt="member_image">
					</div>
					<div class="fList_info">
						${cont.getMember_id() } / ${cont.getMember_nickname() }
					</div>
					<div class="fList_btn">
						<c:if test="${!empty login_f }"><!-- 로그인회원의 팔로우 리스트 데이터가 있다면  -->
						<c:forEach items="${login_f }" var="login">
							<!-- 팔로우가 되어있는 경우 -->
							<c:if test="${cont.getMember_id() == login.getFollow_name()}">
								<c:set var="check" value="1"/>
							</c:if>
							<!-- 팔로우 안되어 있는 경우  -->
							<c:if test="${cont.getMember_id() != login.getFollow_name()}">
								<c:set var="check" value="0"/>
							</c:if>
							<!-- 나 자신인 경우 -->
							<c:if test="${cont.getMember_id() == login_id}">
								<c:set var="check" value="-1"/>
							</c:if>
							
						</c:forEach>
						</c:if>
						<c:if test="${empty login_f }"> <!-- 로그인회원에게 팔로우리스트 데이터가 없으면 -->
							<c:set var="check" value="0"/>
						</c:if>
						<c:if test="${empty login_id }"> <!-- 비회원일 경우 -->
							<c:set var="check" value="-1"/>
						</c:if>
						
						
						<c:if test="${check == '1' }">
								<input type="button" value="팔로잉" onclick="location.href='unfollow.do?id=${cont.getMember_id()}'">
							</c:if>
						<c:if test="${check == '0' }">
								<input type="button" value="팔로우" onclick="location.href='follow.do?id=${cont.getMember_id()}'">
						</c:if>
						<c:if test="${check == '-1' }">
						</c:if>
					</div>				
				</div>
				</c:forEach>
				</c:if>
			</div><!-- class="feed_fList" -->
			
			
		
		</div><!-- class="feed_main" end -->
	
	</div><!-- class="myfeed_container" end -->
</body>
</html>