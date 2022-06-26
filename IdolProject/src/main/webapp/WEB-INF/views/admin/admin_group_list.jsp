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
	
	.admin_group_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
		
	}
	
	.admin_group_Container {
		display: flex;
		flex-direction: column;
		color: white;
		
	}
	
	li {
		list-style-type: none;
		
	}
	
	a {
		text-decoration: none;
	}
	
	.admin_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	    flex: 50%;
	    
	}
	
	
	
	
	
	
	.admin_group_boxes {
		border: 2px solid red;
		width: 200px;
		height: 200px;
		color: white;
	}
	
	.admin_solo_boxes {
		border: 2px solid blue;
		width: 200px;
		height: 200px;
		color: white;
	}
	
	.tempBtn {
		
	}
</style>
</head>
<body>
	<c:set var="glist" value="${groupList }" />
	<c:set var="slist" value="${soloList }" />
	
	<div class="admin_group_wrapper">
		
		<jsp:include page="../include/admin_top_include.jsp" />
		<jsp:include page="../include/admin_group_include.jsp" />
	
		<div class="admin_group_Container">
			
			<!-- 그룹 파트 -->
			
			<div>
				<h2>그룹</h2>
			</div>
			<div class="admin_container">
				<c:forEach items="${glist }" var="gdto">
					<c:if test="${gdto.group_name != 'solo' }">
						<a href="<%=request.getContextPath()%>/admin_groupMember_list.do?gName=${gdto.group_name}">
							<div class="admin_group_boxes">
								<ul>
									<li>
										<label>그룹 이름 : </label>${gdto.group_name }
									</li>
									
								</ul>
							</div>
						</a>
					</c:if>	
				</c:forEach>
			</div> <!-- admin_group_container end -->
			
			<!-- 솔로 가수 파트 -->
			
			<div>
				<h2>솔로</h2>
			</div>
			<div class="admin_container">
				<c:forEach items="${slist }" var="sdto">
					<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${sdto.celeb_no}">
						<div class="admin_solo_boxes">
							<ul>
								<li>
									<label> 이름 : </label>${sdto.celeb_name }
								</li>
								
							</ul>
						</div>
					</a>
				</c:forEach>
			
			
			</div> <!-- admin_solo_container end -->
			
		</div> <!-- admin_group_Container end -->
		
		
		
	</div> <!-- admin_group_wrapper end  -->
	
	
	
</body>
</html>
