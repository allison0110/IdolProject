<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">
	
	
	/****** include tope    *****/
	.admin_navbar ul {
		
		display: flex;
	    flex-direction: row;
	    justify-content: space-evenly;
		
	}
	
	.admin_navbar ul div ul{
		
		display: flex;
	    flex-direction: column;
		
	}
	
	/****** include tope    *****/
	
	
	
	
	
	
	a {
		text-decoration: none;
	}
	
	li {
		list-style-type: none;
	}
	
</style>
</head>
<body>
	
	<div class="admin_main_wrapper">
	
		<!-- include  -->
		<div class="admin_navbar">
			<ul>
				<li>
					<a href="<%=request.getContextPath() %>/admin_celeb_list.do">
						가수
					</a>
					<div>
					
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_celeb_insert.do">
									등록
								</a>
							</li>
							<li>
								<a href="<%=request.getContextPath() %>/admin_group_list.do">
									그룹
								</a>
							</li>
							
						</ul>
					</div>
				</li>
				<li>
					<a href="<%=request.getContextPath() %>/admin_music_list.do">
						음원
					</a>
					<div>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_music_insert.do">
									등록
								</a>
							</li>
						</ul>
					</div>
				</li>
				<li>
					<a href="<%=request.getContextPath() %>/admin_images_list.do">
						메인 페이지 이미지 관리
					</a>
					<div>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_image_insert.do">
									등록 
								</a>
							</li>
						</ul>
					</div>
				</li>
				<li>
					이벤트 관리
				</li>
				<li>
					팝업 관리
				</li>
				<li>
					판매관리
				</li>
				<li>
					굿즈 관리
					<div>
						<ul>
							<li>등록</li>
							<li>수정</li>
							<li>리스트</li>
						</ul>
					</div>
				</li>
			</ul>
			<div>
				<c:set var="d" value="${date }" />
				<c:set var="t" value="${time }" />
				<c:forEach items="${d }" var="date">
					${date }홀 
				</c:forEach>
			</div>
			
		</div> <!-- admin_navbar end -->
			
	<c:set var="cdto" value="${cList }" />	
	<c:set var="gdto" value="${gList }" />			

		<div class="admin_main_container">	
			
			
		
			
			
			
			
		</div> <!-- admin_main_container end -->
		
	</div> <!-- admin_main_wrapper end -->
	
	
</body>
</html>