<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style type="text/css">

		
	.admin_navbar {
		display: flex;
		flex-direction: row;
		background-color: black;
		width: 100%;
		/* 스크롤 다운 시 메뉴바 적용 후 사용
		position: sticky;
		top:0px;
		z-index: 99;
		*/
	}	
	.admin_link {
		display: flex;
		flex-direction: row;
		width: 100%;
		flex-wrap: wrap;
		justify-content: space-evenly;
    	padding-right: 10px;
		align-items: center;
	}
	
	
	.admin_link a {
		
		text-decoration: none;
		font-family: 'Press Start 2P', cursive;
		color: white;
	}
	
	
	
	.include_top_title {
		/*font-family: 'Bungee Shade', cursive;*/
		font-family: 'Press Start 2P', cursive;
		color: white;
		width: 130px;
	}
	
	li {
		list-style-type: none;
	}
	
	.include_top_title {
		cursor: pointer;
		margin-left: 100px;
	}
	
	.admin_id_session {
		width: 130px;
		color: white;
		font-family: 'Creepster', cursive;
		font-size: 1.3em;
	}
	
	
	
	
	
	.celeb a:hover {
		color: gold;
	}
	
</style>

<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&family=Creepster&family=Inconsolata:wght@200;300;400;500;600;700;800;900&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Merriweather&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Press+Start+2P&family=Source+Code+Pro&family=Titillium+Web:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>

<script type="text/javascript">

	$(function(){
		$('.include_top_title').click(function(){
			location.href='<%=request.getContextPath()%>/admin_main.do'
		});	
	});

</script>

</head>
<body>
	
	
		<!-- include  -->
		<div class="admin_navbar">
		
			<div class="include_top_title">
				<h2>YOUR CELEB</h2>
			</div>
			<div class="admin_link">
				<div class="celeb">
					<a href="<%=request.getContextPath() %>/admin_celeb_list.do">
						CELEB
					</a>
				</div>
				<!--<div>
					<a href="<%=request.getContextPath() %>/admin_celeb_insert.do">
						INSERT
					</a>
				</div>-->
				<div>
					<a href="<%=request.getContextPath() %>/admin_group_list.do">
						GROUP
					</a>
				</div>
				<!-- <div>
					<a href="<%=request.getContextPath() %>/admin_group_insert.do">
						INSERT
					</a> 
				</div>	-->
				<div>
					<a href="<%=request.getContextPath() %>/admin_music_list.do">
						MUSIC
					</a>
				</div>
				<!--<div>
					<a href="<%=request.getContextPath() %>/admin_music_insert.do">
						INSERT
					</a>
				</div>	-->			
				<div>
					<a href="<%=request.getContextPath() %>/admin_images_list.do">
						IMAGES
					</a>
				</div>
				<!--<div>
					<a href="<%=request.getContextPath() %>/admin_image_insert.do">
						INSERT 
					</a>
				</div>-->	
				<div>
					<a href="<%=request.getContextPath() %>/admin_notice_list.do">
						NOTICE
					</a>
				</div>
				
				<div>
					<a href="<%=request.getContextPath() %>/admin_products_list.do">
						PRODUCTS
					</a>
				</div>
				<div>
					<a href="<%=request.getContextPath() %>/admin_member_main.do">
						MEMBER						
					</a>
				</div>
				<!--<div>
					<a>INSERT</a>
				</div>-->	
				<div class="admin_id_session">
					WELLCOME ${admin_id } :D
				</div>
				
			</div> <!-- admin_link -->
			
		</div> <!-- admin_navbar end -->
			
	
	
	
</body>
</html>