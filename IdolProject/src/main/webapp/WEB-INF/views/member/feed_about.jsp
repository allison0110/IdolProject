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
<style type="text/css">

	body{
		
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
	<c:set var="dto" value="${feedInfo.get('mInfo') }"/> <!-- 회원정보 -->
	<c:set var="commList" value="${feedInfo.get('commList') }"/> <!-- 게시글 총 개수 -->
	<div class="myfeed_container" align="center">
		<!-- myfeed_top include 추가  -->
		<jsp:include page="../include/feed_top.jsp"/>
		
		<div class="feed_main">
			<div class="feed_title">
				<table>
					<tr>
						<td>
							<a href="<%=request.getContextPath() %>/myfeed.do?id=${dto.getMember_id()}" style="color: black;">ABOUT</a>
						</td>
						<td >
							<a href="#" style="color: gray;">POSTING</a>
						</td >
						<td >
							<a href="#" style="color: gray;">LIKE♥</a>
						</td>
					</tr>
				</table>
			</div><!-- class="feed_title"  end -->
			<div class="feed_introduction">
				<p>${dto.getMember_introduction() }</p>
				
				<hr width="50%" align="center">
				<table>
					<tr>
						<td>
							gender:
						</td>
						<td colspan="4">
						 <c:if test="${dto.getMember_gender() == 'M' }">
						 MALE
						 </c:if>
						 <c:if test="${dto.getMember_gender() == 'F' }">
						 FEMALE
						 </c:if>
						</td>
					</tr>
					<tr>
						<td>
						Favorite Celeb:
						</td>
						<td colspan="4">
						${dto.getMember_favorite_celeb() }
						</td>
					</tr>
				</table>
				<hr width="50%" align="center">
			
			</div><!-- class="feed_introduction" -->
			<div class="feed_posting">
			
			
			</div>
		
		</div><!-- class="feed_main" end -->
	
	</div><!-- class="myfeed_container" end -->
</body>
</html>