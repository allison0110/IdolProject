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
		background-color: black;
		
	}
	
	a {
		text-decoration: none;
	}
	.admin_content_wrapper {
		display: flex;
		flex-direction: column;
		/*height: 100%;*/
		
	}
	
	ul {
		list-style-type: none;
	}
	
	.testImage {
		width: 200px;
		height: 200px;
	}
	
	.testImage img {
		width: 100%;
		height: 100%;
	}
	
	.admin_cont_imageBox {
		display: flex;
		flex-direction: row;
	}
	
	.admin_cont_imageBox img {
		width: 100%;
		height: 100%;
	}
	
	.admin_content_box {
		color: white;
		font-family: 'VT323', 'Jua', monospace;
		font-size: 1.7em;
		font-family: 
		
	}
	
	.admin_content_container {
		display: flex;
   		flex-direction: column;
		align-items: center;
	}
	
	.content_btns input{
		font-family: 'Creepster', cursive;
		color: white;
		background-color: black;
		cursor: pointer;
		font-size: 1.3em;
	}
	
	.content_btns input:hover {
		color: red;
	}
	
	.celeb_noticeNevent_box {
		width: 600px;
		height: 400px;
	
	}
	
	.celeb_noticeNevent_box {
		color: white;
	
	}
</style>

<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&family=Creepster&family=East+Sea+Dokdo&family=Jua&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Kirang+Haerang&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Press+Start+2P&family=VT323&display=swap" rel="stylesheet">

</head>
<body>
	
	<!-- 셀럽 개인 정보 불러고익 by no -->
	<c:set var="cont" value="${celebContByNo }" />
	<!-- 개인 이미지 배열 불러오기 -->
	<c:set var="imgs" value="${arrtokened }" />
	<!-- 셀럽에 관련된 공지 & 이벤트 정보 리스트 -->
	<c:set var="clist" value="${cList }" />
	
	<div class="admin_content_wrapper">
	
		<jsp:include page="../include/admin_top_include.jsp" />
		<jsp:include page="../include/admin_link_include.jsp" />
	
		<div class="admin_content_container">
		
			<div class="admin_cont_imageBox">
				<c:forEach items="${arrtokened }" var="imgs">
					<div class="testImage">
						<img alt="" src="./resources/upload/celeb/${imgs }">
					</div>
				
				</c:forEach>
			</div>
			<div class="admin_content_box">
				<ul>
					<li>
						<c:if test="${cont.celeb_group != 'solo' }">
							group: ${cont.celeb_group }
						</c:if>
						<c:if test="${cont.celeb_group == 'solo' }">
						</c:if>
					</li>
					<li>
						NAME : ${cont.celeb_name } (${cont.celeb_realname })
					</li>
					<li>
						AGENT : ${cont.celeb_agency }
					</li>
					<li>
						BORN : ${cont.celeb_dateofbirth.substring(0, 10) }
					</li>
					<li>
						YEARS ACTIVE : ${cont.celeb_debutdate.substring(0, 10) }
					</li>
					
				</ul>
				<div class="content_btns">
					<input type="button" value="MODIFY"
					onclick="location.href='admin_celeb_modify.do?no=${cont.celeb_no}'">
					<input type="button" value="DELETE"
					onclick="if(confirm('삭제 하시겠습니까 ?? :(')){
						location.href='<%=request.getContextPath()%>/celeb_delete.do?no=${cont.celeb_no }&img=${cont.celeb_pimage }'
					}else {return}">
					<input type="button" value="BACK"
					onclick = "location.href='admin_celeb_list.do'">
				</div>
			</div> <!-- admin_content_box -->
			
			<c:forEach items="${clist }" var="cNdto">
				<c:if test="${!empty cNdto.celeb_name }">
					<div class="celeb_noticeNevent_box">
						<div>
							TITLE [${cNdto.notice_title }]
						</div>
						<div>
							${cNdto.notice_cont }
						</div>
						
			
					</div>
				</c:if>
			</c:forEach>
			
			
			
			
		</div> <!-- the end of admin_content_container -->
	</div> <!-- the end of admin_content_wrapper -->
</body>
</html>