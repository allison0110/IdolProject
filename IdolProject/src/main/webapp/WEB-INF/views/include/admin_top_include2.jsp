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
		position: sticky;
		top: 0px;
		display: flex;
		flex-direction: row;
		background-color: black;
		width: 100%;
	}
	.admin_link ul {
		
		display: flex;
	    
	}
	
	.admin_link a {
		padding: 0px 20px;
		text-decoration: none;
		font-family: 'Press Start 2P', cursive;
		color: white;
	}
	
	
	
	.include_top_title {
		/*font-family: 'Bungee Shade', cursive;*/
		font-family: 'Press Start 2P', cursive;
		color: white;
	}
	
	li {
		list-style-type: none;
	}
	/****** include tope    *****/
	
	.include_top_title {
		cursor: pointer;
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
				<ul>
					<li>
						<a href="<%=request.getContextPath() %>/admin_celeb_list.do">
							CELEB
						</a>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_celeb_insert.do">
									INSERT
								</a>
							</li>
						</ul>		
					<li>	
						<a href="<%=request.getContextPath() %>/admin_group_list.do">
							GROUP
						</a>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_group_insert.do">
									INSERT
								</a>
							</li>
						</ul>											
					</li>					
					<li>
						<a href="<%=request.getContextPath() %>/admin_music_list.do">
							MUSIC
						</a>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_music_insert.do">
									INSERT
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a href="<%=request.getContextPath() %>/admin_images_list.do">
							IMAGES
						</a>
						<ul>
							<li>
								<a href="<%=request.getContextPath() %>/admin_image_insert.do">
									INSERT 
								</a>
							</li>
						</ul>
					</li>
					<li>
						<a>NOTICE</a>
					</li>
					<li>
						<a>POP_UP</a>
					</li>
					<li>
						<a>PRODUCTS</a>
						
					</li>
					<li>
						<a>
						GOODS						
						</a>	
						<ul>
							<li>
								<a>INSERT</a>
							</li>	
						</ul>						
					</li>
					<li>
						WELLCOME ${admin_id } :D
					</li>
				</ul>
				
			</div> <!-- admin_link -->
		</div> <!-- admin_navbar end -->
			
	
	
	
</body>
</html>