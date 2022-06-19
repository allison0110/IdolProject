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
	
	
	a {
		text-decoration: none;
	}
	
	li {
		list-style-type: none;
		
	}
	
	.admin_notice_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
	
	}
	
	
	.admin_notice_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	}
	
	.admin_notice_content{
		border: 1px solid pink;
		width: 200px;
		height: 200px;
		color: white;
	}
	
	
</style>
</head>
<body>
	<c:set var="list" value="${noticeList }" />
	
	<div class="admin_notice_wrapper">
	
		<jsp:include page="../include/admin_top_include.jsp" />
		<jsp:include page="../include/admin_notice_include.jsp" />
	
	
		<div class="admin_notice_container">
		
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<a href="<%=request.getContextPath()%>/admin_notice_content.do?no=${dto.notice_no}">
						
						<div class="admin_notice_content">
							<ul>
								
								<li>
									관리자 아이디 : ${dto.admin_id }
								</li>
								<li>
									제목 : ${dto.notice_title }
								</li>
								
								<li>
									<c:if test="${dto.notice_update == null }">
										등록 일 : ${dto.notice_date.substring(0, 10) }
									</c:if>
									<c:if test="${dto.notice_update != null }">
										수정 날짜 : ${dto.notice_update.substring(0, 10) }
									</c:if>
								</li>
								
								<li>
									종료일 : ${dto.notice_enddate.substring(0, 10) }
								</li>
								
							</ul>
						</div> <!-- admin_notice_content -->
					</a>
				</c:forEach>
			</c:if>	
			
		</div> <!-- admin_notice_container -->
	</div> <!-- admin_notice_wrapper -->
	
	
	
</body>
</html>