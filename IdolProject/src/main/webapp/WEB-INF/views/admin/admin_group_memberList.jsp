<%@page import="java.util.StringTokenizer"%>
<%@page import="com.idol.model.NoticeDTO"%>
<%@page import="java.util.List"%>
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
	
	
	li {
		list-style-type: none;
		
	}
	a {
		text-decoration: none;
	}
	
	
	
	.admin_member_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	
	}
	
	.group_member_container {
		
	}
	
	
	.group_info {
		border: 3px solid blue;
		color: white;
	}
	

	.admin_memberBoxes_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	    color: white;
	}
	
	.admin_member_box{
		border: 1px solid pink;
		width: 200px;
		height: 200px;
		color: white;
	}
	
	
	
	
	
	
	.admin_group_imageBox {
		display: flex;
		flex-direction: row;
		width: 1000px;
	}
	
	.admin_group_imageBox img {
		width: 100%;
		height: 100%;
	}
	
	.celeb_noticeNevent {
		color: white;
	}
	
	.celeb_noticeNevent a{
		color: white;
	}
	.celeb_notice_boexs {
		border: 1px solid gray;
	
	}
	.celeb_notice_imgs {
		width: 400px;
		height: 400px;
		
	}
	
	.celeb_notice_imgs img {
		width: 100%;
		height: 100%;
	}
</style>
</head>
<body>
	<c:set var="mList" value="${gmList }" />
	<c:set var="cont" value="${gCont }" />
	<c:set var="gimgs" value="${arrGourpImg }" />
	<c:set var="nlist" value="${nList }" />
	
	<div class="admin_member_wrapper">
		
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_group_include.jsp" />	
	
		<div class="group_member_container">
		
			<div class="admin_group_imageBox">
				<c:forEach items="${arrGourpImg }" var="gimgs">
					<div class="groupImage">
						<img alt="" src="./resources/upload/group/${gimgs }">
					</div>
				</c:forEach>
			</div>
			
			
			<div class="group_info">
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
						 location.href='admin_group_delete.do?no=${cont.group_no}&&imgs=${cont.group_image}'
					}else {return; }">
				</div>
			</div> <!-- group_info -->
		
		
			<div class="admin_memberBoxes_container">
				<c:if test="${!empty mList }">
					<c:forEach items="${mList }" var="dto">
						<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${dto.celeb_no}">
							<div class="admin_member_box">
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
							</div> <!-- admin_member_box -->
						</a>
					</c:forEach>
				</c:if>	
				
			</div> <!-- admin_memberBoxes_container -->
			
			<div class="celeb_noticeNevent">
				<c:forEach items="${nlist }" var="ndto">
					<c:if test="${!empty ndto.group_name}">
						<a href="<%=request.getContextPath()%>/admin_notice_content.do?no=${ndto.notice_no}">
							<div class="celeb_notice_boexs">
								<div>
									TITLE : [${ndto.notice_title }]
								</div>
								
								<div>
									${ndto.notice_cont }
								</div> 
							</div><!-- celeb_notice_boexs -->
						</a>
					</c:if>
				</c:forEach>
			</div> <!-- celeb_noticeNevent -->
			
			
		</div> <!-- group_member_container -->
	</div><!-- admin_member_wrapper -->
	
	
	
</body>
</html>