<%@page import="com.idol.model.CelebDTO"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.idol.model.GroupDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&family=Creepster&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gugi&family=Jua&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Kirang+Haerang&family=Nosifer&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Press+Start+2P&family=VT323&family=Wallpoet&display=swap" rel="stylesheet">

<style type="text/css">
	
	html, body {
		margin: 0px;
		padding: 0px;
		height: 100%;
		background-color: black;
	}
	
	.admin_main_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	.admin_main_container {
		color: white;
    	font-family: 'Jua', sans-serif;
    	display: flex;
    	margin-top: 3%;
	}
    
    .team_member_name{
    	color: white;
    	font-size: 1.5em;
    }
    
    .about_project_leftSide {
    	flex: 50%;
    	max-width: 50%;
    	display: flex;
	    flex-direction: column;
	    align-items: center;
	    margin-left: 100px;
    }
    
    .about_project_rightSide {
    	flex: 50%;
    	max-width: 50%;
    	display: flex;
	    flex-direction: row;
	    justify-content: center;
	    align-self: center;
/* 	    margin: 0px 30px; */
/* 	    border: 2px solid red; */
	    justify-content: space-evenly;
	    margin-right: 100px;
    }
    
    
    .front_page {
/*     	border: 2px solid gold; */
    }
    
    .back_page {
/*    		border: 2px solid blue;  */
    }
    
    .pimg {
    	width: 100px;
    	height: 100px;
    	border-radius: 50px;
    	
    }
    
    .final_title {
    	font-size: 1.3em;
    	font-family: 'Press Start 2P', cursive;
    	margin-bottom: 30px;
    }
    
    .title {
    	font-size: 4em;
    	font-family: 'Press Start 2P', cursive;
    	margin-bottom: 30px;
    }
    
    .page_title {
    	font-size: 2.2em;
    }
    
    .row_info {
    	font-size: 1.5em;
    	line-height: 1.6;
    	display: flex;
	    flex-direction: column;
	    align-items: center;
    }
    
    .front_page{
        width: 230px;
        align-items: center;
	    display: flex;
	    flex-direction: column;
    }
    
    .back_page{
    	width: 230px;
    	align-items: center;
	    display: flex;
	    flex-direction: column;
    }
    .project_title {
    	color: white;
    	display: flex;
	    flex-direction: column;
	    align-items: center;  
    	margin-top: 20px
    }
    
    .personal_box {
        display: flex;
    	align-items: center;
    	margin: 10px 0px;
    }
    
    .name {
    	margin-left: 20px;
    }
</style>

<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&family=Creepster&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gugi&family=Jua&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Kirang+Haerang&family=Nosifer&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Press+Start+2P&family=VT323&display=swap" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.13.0/jquery-ui.js" integrity="sha256-xH4q8N0pEzrZMaRmd7gQVcTZiFei+HfRTBPJ1OGXC0k=" crossorigin="anonymous"></script>
<script type="text/javascript">

	$(function(){
		$('#test').click(function(){
			$(this).animate({opacity:0, fontSize:'0px'}, 1500, 'easeInOutElastic', 
					function(){
						$(this).animate({opacity:1, fontSize: '110px'}, 500);
			});
		});
	});

</script>
</head>
<body>
	
	<div class="admin_main_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	
		<div class="project_title">
			
			<div class="title">
				IDOL PROJECT
			</div>
			<div class="final_title">
				FINAL PROJECT TEAM NO. ONE
			</div>
		</div>
		
		<div class="admin_main_container">
		
				
			
			<div class="about_project_leftSide">
			
				
				
				<div class="team_member_name">		
					<div class="personal_box">
						<img class="pimg" alt="" src="./resources/icon/duck.gif">
						<div class="name">김희원</div>
					</div>
					<div class="personal_box">
						<img class="pimg" alt="" src="./resources/icon/pizza.jpg">
						<div class="name">신경연</div>
					</div>
					<div class="personal_box">
						<img class="pimg" alt="" src="./resources/icon/star_stick.jpg">
						<div class="name">안이슬</div>
					</div>
					<div class="personal_box">
						<img class="pimg" alt="" src="./resources/icon/ghost2.gif">
						<div class="name">정원석</div>
					</div>
					<div class="personal_box">
						<img class="pimg" alt="" src="./resources/icon/ghost3.jpg">
						<div class="name">박정환</div>
					</div>
				</div>	
			</div>
			
			
			<div class="about_project_rightSide">
			
				<div class="front_page" >
					<div class="page_title">
						메인 페이지
					</div>
					<div class="row_info">
						<div>
						팬 커뮤니티
						</div>
						<div>
							굿즈 쇼핑몰
						</div>
						<div>
							아이돌 및 앨범 정보
						</div>
						<div>
							이벤트 정보	
						</div>
						<div>
							회원 랭킹 시스템
						</div>
						<div>
							중고 거래
						</div>
						<div>
							팝업창
						</div>
						<div>
							1:1 대화
						</div>
					</div>
					
				</div>
				
				<div class="back_page">
					<div class="page_title">
						관리자 페이지
					</div>
					<div class="row_info">
						<div>
							가수 편집 
						</div>
						<div>
							음원 편집  
						</div>
						<div>
							공지 및 이벤트 관리 
						</div>
						<div>
							상품 관리
						</div>
						<div>
							고객 구매 내역
						</div>
						<div>
							회원 관리
						</div>
					</div>
					
				</div>
			
			</div> <!-- about_project_rightSide -->
			
		</div>	
			
		
		
	</div> <!-- admin_main_wrapper end -->
	
	
</body>
</html>