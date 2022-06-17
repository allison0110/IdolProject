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
	
	.admin_navbar {
		
		display: flex;
		flex-direction: row;
	}
	.admin_link ul {
		
		display: flex;
	    
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
		
			<div class="title">
				<h2>YOUR CELEB</h2>
			</div>
			<div class="admin_link">
				<ul>
					<li>
						<a href="<%=request.getContextPath() %>/admin_celeb_list.do">
							가수
						</a>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_celeb_insert.do">
									등록
								</a>
							</li>
								
							<li>
								<ul>
									<li>
										<a href="<%=request.getContextPath() %>/admin_group_list.do">
											그룹
										</a>
										<ul>
											<li>
												<a href="<%=request.getContextPath() %>/admin_group_insert.do">
													등록
												</a>
											</li>
										</ul>
									</li>
									
								</ul>
							</li>
						</ul>
					</li>
						
					<li>
						<a href="<%=request.getContextPath() %>/admin_music_list.do">
							음원
						</a>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_music_insert.do">
									등록
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="<%=request.getContextPath() %>/admin_images_list.do">
							메인 페이지 이미지 관리
						</a>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_image_insert.do">
									등록 
								</a>
							</li>
						</ul>
					</li>
					<li>
						공지 관리
					</li>
					<li>
						팝업 관리
					</li>
					<li>
						판매관리
					</li>
					<li>
						굿즈 관리						
							<ul>
								<li>등록</li>
								<li>수정</li>
								<li>리스트</li>
							</ul>						
					</li>
					<li>
						${admin_id }님 환영합니다 :D
					</li>
				</ul>
				
			</div> <!-- admin_link -->
		</div> <!-- admin_navbar end -->
			
	
	</div> <!-- admin_main_wrapper end -->
	
	
</body>
</html>