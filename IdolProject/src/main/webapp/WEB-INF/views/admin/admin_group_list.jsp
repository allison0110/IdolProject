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
	}
	
	.admin_group_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
	
	}
	
	.admin_group_whollContainer {
		display: flex;
		flex-direction: row;
		width: 100%;
	}
	
	li {
		list-style-type: none;
		
	}
	
	.admin_group_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	    flex: 50%;
	}
	
	.admin_solo_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	    flex: 50%;
	}
	
	a {
		text-decoration: none;
	}
	
	.null {
		display: none;
	}
	
	.admin_group_boxes {
		border: 2px solid red;
		width: 200px;
		height: 200px;
	}
	
	.admin_solo_boxes {
		border: 2px solid blue;
		width: 200px;
		height: 200px;
	}
</style>
</head>
<body>
	<c:set var="glist" value="${groupList }" />
	<c:set var="clist" value="${celebList }" />
	<div class="admin_group_wrapper">
	
		<div class="admin_group_whollContainer">
			
			<!-- 그룹 파트 -->
			<div class="admin_group_container">
				<c:if test="${!empty glist }">
					<c:forEach items="${glist }" var="dto">
						<a href="<%=request.getContextPath()%>/admin_groupMember_list.do?gName=${dto.celeb_group}">
							<c:if test="${!empty dto.celeb_group }">
								<div class="admin_group_boxes">
									<ul>
										<li>
											<label>그룹 이름 : </label>${dto.celeb_group }
										</li>
										
										<li>
											<label>소속사 : </label>${dto.celeb_agency }
										</li>
										
										<li>
											<label>데뷔 : </label>${dto.celeb_debutdate.substring(0, 10) }
										</li>
										
									</ul>
								</div>
							</c:if>
							<c:if test="${empty dto.celeb_group }">
								<div class="null"></div>
							</c:if>
						</a>
					</c:forEach>
				</c:if>	
			</div> <!-- admin_group_container end -->
			
			<!-- 솔로 가수 파트 -->
			<div class="admin_solo_container">
				<c:if test="${!empty clist }">
					<c:forEach items="${clist }" var="cdto">
						<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${cdto.celeb_no}">
							<c:if test="${cdto.celeb_group == null }">
								<div class="admin_solo_boxes">
									<ul>
										<li>
											<label>가수 이름 : </label>${cdto.celeb_name }
										</li>
										
										<li>
											<label>소속사 : </label>${cdto.celeb_agency }
										</li>
										
										<li>
											<label>데뷔 : </label>${cdto.celeb_debutdate.substring(0, 10) }
										</li>
										
									</ul>
								</div>
							</c:if>
							<c:if test="${cdto.celeb_group != null}">
								<div class="null"></div>
							</c:if>
						</a>
					</c:forEach>
				</c:if>	
			</div> <!-- admin_solo_container end -->
		</div> <!-- admin_group_whollContainer end -->
		
		
		
		
	</div> <!-- admin_group_wrapper end  -->
	
	
	
</body>
</html>