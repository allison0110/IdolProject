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
	
	.admin_member_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
	
	}
	li {
		list-style-type: none;
		
	}
	
	.admin_member_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	}
	
	.admin_member_content{
		border: 1px solid pink;
		width: 200px;
		height: 200px;
	}
	
	a {
		text-decoration: none;
	}
	
	.group_content {
		border: 3px solid blue;
	}
	
	
	.admin_group_imageBox {
		display: flex;
		flex-direction: row;
	}
	
	.admin_group_imageBox img {
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
	<c:set var="mList" value="${gmList }" />
	<c:set var="cont" value="${gCont }" />
	<c:set var="gimgs" value="${arrGourpImg }" />
	
	<div class="admin_member_wrapper">
		
		<div class="admin_group_imageBox">
			<c:forEach items="${arrGourpImg }" var="gimgs">
				<div class="groupImage">
					<img alt="" src="./resources/upload/group/${gimgs }">
				</div>
			
			</c:forEach>
		</div>
		
		
		<div class="group_content">
			<div>
				그룹명 : ${cont.group_name }
			</div>
			<div>
				그룹 정보 : ${cont.group_info }
			</div>
			<div>
				<input type="button" value="수정"
				onclick="location.href='admin_group_modify?no=${cont.group_no}'">
				
				<input type="button" value="삭제"
				onclick="if(confirm('그룹을 삭제 하시렵니까? :(')){
					 location.href='admin_group_delete.do?no=${cont.group_no}'
				}else {return; }">
			</div>
		</div>
	
	
		<div class="admin_member_container">
			<c:if test="${!empty mList }">
				<c:forEach items="${mList }" var="dto">
					<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${dto.celeb_no}">
						<div class="admin_member_content">
							<ul>
								<li>
									그룹 명 : ${dto.celeb_group }
								</li>
								<li>
									가수 명 : ${dto.celeb_name }
								</li>
								<li>
									본명 : ${dto.celeb_realname }
								</li>
								<li>
									소속사 : ${dto.celeb_agency }
								</li>
								<li>
									생일 : ${dto.celeb_dateofbirth.substring(0, 10) }
								</li>
								<li>
									데뷔 일 :${dto.celeb_debutdate.substring(0, 10) }
								</li>
							</ul>
						</div>
					</a>
				</c:forEach>
			</c:if>	
			
		</div> <!-- admin_member_container -->
		
	</div><!-- admin_member_wrapper -->
	
	
	
</body>
</html>