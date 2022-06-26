<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	html, body {
		padding: 0px;
		margin: 0px;
		height: 100%;
		background-color: black;
	}
	
	.member_atag {
		text-decoration: none;
		color: white;
	}
	
	.admin_member_main_wrapper{
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	
	}
	
	.member_container{
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
		
	}
	
	
	.member_img {
		width: 200px;
		height: 200px;
		
	
	}
	.member_img img {
		width: 100%;
		height: 100%;
	}

</style>
</head>
<body>
<c:set var="mlist" value="${mList }" />
	<div class="admin_member_main_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_member_include.jsp" />
	
		<div class="admin_member_main_container">
			<div class="member_container">
			<c:forEach items="${mlist }" var="dto">
				<a class="member_atag" href="<%=request.getContextPath()%>/admin_member_cont.do?no=${dto.member_no}">
					<div class="member_info">
					
						<div class="member_img">
					 		<img alt="" src="./resources/upload/member_image/${dto.member_no }/${dto.member_image}">
						</div>
						<div>
						아이디 :  ${dto.member_id }
						</div>
						<div>
						닉네임 : ${dto.member_nickname }
						</div>
						<div>
						이메일 : ${dto.member_email }
						</div>
						<div>
						 좋아하는 셀럽(임시) : ${dto.member_favorite_celeb }
						</div>
						<div>
						 ${dto.member_join_date.substring(0, 10) }
						</div>			
					</div> <!-- member_info -->
				</a>
			</c:forEach>
			</div><!-- member_container -->
			
		</div> <!-- admin_member_main_container -->
	
	</div> <!-- admin_member_main_wrapper -->


</body>
</html>