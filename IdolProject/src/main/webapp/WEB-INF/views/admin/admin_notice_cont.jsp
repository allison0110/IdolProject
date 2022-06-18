<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	
	html, body {
		margin: 0px;
		padding: 0px;
		height: 100%;
	
	}
	
	.admin_notice_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
		justify-content: center;
	    align-items: center;
	}
	
	ul {
		list-style-type: none;
	}
	
	.testImage {
		width: 450px;
		height: 500px;
	}
	
	.testImage img {
		width: 100%;
	}
	
	.admin_cont_imageBox {
		display: flex;
		flex-direction: row;
	}
	
	.admin_cont_imageBox img {
		width: 100%;
		height: 100%;
	}
	
	.admin_notice_box {
	
	
	}
	
	.admin_notice_container {
		display: flex;
   		flex-direction: column;
		align-items: center;
	}
	
	
</style>
</head>
<body>

	<c:set var="cont" value="${noticeCont }" />
	<c:set var="imgs" value="${arrToken }" />
	<div class="admin_notice_wrapper">
		<div class="admin_notice_container">
		
			<div class="admin_cont_imageBox">
				<c:forEach items="${arrToken }" var="imgs">
					<div class="testImage">
						<img alt="" src="./resources/upload/notice/${imgs }">
					</div>
				
				</c:forEach>
			</div>
			<div class="admin_notice_box">
				<ul>
					<li>
						제목 : ${cont.notice_title }
					</li>
					<li>
					<textarea rows="13" cols="33" id="lyrics" readonly>${cont.notice_cont }</textarea>
						
					</li>
					<li>
						<c:if test="${cont.group_name != null }">
							그룹 : ${cont.group_name }
						</c:if>
						<c:if test="${cont.group_name == null }">
							
						</c:if>
					</li>
					<li>
						<c:if test="${cont.celeb_name != null }">
							셀럽 : ${cont.celeb_name }
						</c:if>
						<c:if test="${cont.celeb_name == null }">
							
						</c:if>
					</li>
					<li>
						타입 : ${cont.notice_type}
					</li>
					<li>
						조회수 : ${cont.notice_hit}
					</li>
					<li>
						<c:if test="${cont.notice_update == null }">
							등록일 : ${cont.notice_date.substring(0, 10) }
						</c:if>
						<c:if test="${cont.notice_update != null }">
							수정일 : ${cont.notice_update.substring(0, 10) }
						</c:if>
					</li>
					<li>
						종료일 : ${cont.notice_enddate.substring(0, 10) }
					</li>
				</ul>
				
				<input type="button" value="수정"
				onclick="location.href='<%=request.getContextPath()%>/admin_notice_modify.do?no=${cont.notice_no }&imgs=${cont.notice_image }'">
				<input type="button" value="삭제"
				onclick="if(confirm('삭제 하시겠습니까 ?? :(')){
					location.href='<%=request.getContextPath()%>/admin_notice_delete.do?no=${cont.notice_no }&imgs=${cont.notice_image }'
				}else {return}">
				<input type="button" value="메인"
				onclick="location.href='admin_main.do'">
			</div>
		</div> <!-- the end of admin_notice_container -->
	</div> <!-- the end of admin_notice_wrapper -->
</body>
</html>