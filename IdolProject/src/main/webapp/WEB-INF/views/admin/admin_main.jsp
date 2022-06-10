<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<div class="admin_main_wrapper">
		<div class="admin_main_container">
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
									<a href="<%=request.getContextPath() %>/ajaxTest.do?no=3">
										test1
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
						팝업 관리
					</li>
					<li>
						이벤트 관리
					</li>
					<li>
						메인 페이지 관리
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
				
			</div>
		</div>
	</div>
	
	
</body>
</html>