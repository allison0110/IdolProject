<<<<<<< HEAD
<%@page import="com.idol.model.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<title>Home</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">
<style type="text/css">
*{
	margin:0;
	box-sizing: border-box;
}

body{
	font-family: "Roboto", sans-serif;
	background-color: #f7f6ff;
}

h2{
	margin: 16px;
}

.container{
	margin-top: 100px;
	padding:32px;
}


</style>
</head>
<body>

	 <div align="center">
	 
	 <a href="<%=request.getContextPath() %>/join.do">회원가입</a>
	 <a href="<%=request.getContextPath() %>/login.do">로그인</a>
	 <br><br>
	 <a href="<%=request.getContextPath() %>/mypage.do">마이페이지</a><br>
	 <br>
	 <a href="<%=request.getContextPath() %>/myfeed.do?id=hong">hong 피드</a> &nbsp;
	 <a href="<%=request.getContextPath() %>/myfeed.do?id=choi">choi 피드</a> &nbsp;
	 <a href="<%=request.getContextPath() %>/myfeed.do?id=funfun">funfun 피드</a> &nbsp;
	 </div>
	 
	 <% HttpSession session = request.getSession(); 
	 MemberDTO dto =null;
	 	try{
	 		dto = (MemberDTO)session.getAttribute("loginInfo");
	 	}catch (Exception e){
	 		System.out.println("오류발생");
	 	}finally{
	 		if(dto == null){
		 		System.out.println("로그인아이디: null");
		 	}else{
		 		System.out.println("로그인아이디:"+dto.getMember_id());
		 	}
	 		
	 		
	 	}
	 	
	 	
	 %>
	 
	 
	 
	 
	 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pprn3073KE6tl6bjs2QrFaJGz5/SUsLqktiwsUTF55Jfv3qYSDhgCecCxMW52nD2" crossorigin="anonymous"></script>
</body>
</html>
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@include file="./include/user_top.jsp" %>
    <link
      rel="stylesheet"
      href="https://unpkg.com/swiper@8/swiper-bundle.min.css"
    />
    
    <script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
    <style>
    
    main{
    position: relative;
    }
    
    #main-bg{
    position: absolute;
    top: 0;
    left:0;
    height: 600px;
    width: 100%;
    transition: all 0.25s;
    transform: translateY(-98px);
    }
      #mainSwiper {
        width: 100%;
        height: 630px;
      }
	 
	 #mainH1{
	 margin-top: 24px;
	 margin-bottom: 40px;
     font-size: 40px;
     font-weight: 700;
     text-align: center;
	 
	 }
	  .item-sec .productSwiper swiper-wrapper swiper-slide{
	  	width: 100%;
	  	heigth: 500px;
	  }
	  
	  #issueSwiper{
	  	width: 100%;
	  	heigth: 500px;
	  }
      .swiper-slide-img-wrap {
        width: 880px;
        height: 575px;
        margin: 0 auto;
      }

      .swiper-slide-img-wrap img {
        object-fit: cover;
        height: 100%;
        width: 100%;
      }
 
     
      .swiper-slide img {
        display: block;
        width: 100%;
        height: 100%;
        object-fit: cover;
      }
      
      .swiper-slide-items-wrap{
      width: 230px;
      height: 300px;
      }
      .swiper-slide .swiper-slide-items-wrap a img{
       width: 230px;
       height: 250px;
       margin: 25px auto;
       box-sizing: border-box;
       border:0;
      }
      .swiper-slide .swiper-slide-issue-wrap a img{
      width: 320px;
      height: 480px;
      }
      
      .swiper-slide .swiper-slide-album-wrap a img{
      width: 300px;
      height: 300px;
      margin: 0 auto;
      }
      
      .main_section02{
      height: 500px;
      width: 1100px;
      margin: 0 auto;
      }
      
      .main_section03{
      height: 700px;
      width: 1100px;
      margin: 0 auto;
      }
      
      .main_section04{
      height: 500px;
      width: 1100px;
      margin: 0 auto;
      }
    </style>
    
    <main>
    	<div id="main-bg"></div>
      <!-- Slider main container -->
      <div class="swiper" id="mainSwiper">
        <!-- Additional required wrapper -->
        <div class="swiper-wrapper">
          <!-- Slides -->
          
     		<!-- <c:forEach items="${images }" var="dto">
     	     <div class="swiper-slide" id="main_img1">
        	    <div class="swiper-slide-img-wrap" >
            	  <img
                	src="${dto.getImage_path() }"/>
            	</div>
          	 </div>
          </c:forEach> -->
          
          <div class="swiper-slide">
            <div class="swiper-slide-img-wrap">
              <img
                src="./resources/upload/bts.jpg"/>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="swiper-slide-img-wrap">
              <img
                src="./resources/upload/stayc.jpg"/>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="swiper-slide-img-wrap">
              <img
                src="./resources/upload/ive.jpg"/>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="swiper-slide-img-wrap">
              <img
                src="./resources/upload/psy.jpg"/>
            </div>
          </div>
          <div class="swiper-slide">
            <div class="swiper-slide-img-wrap">
              <img
                src="./resources/upload/르세라핌.jpg"/>
            </div>
          </div>
        </div>
        <!-- If we need pagination -->
        <div class="swiper-pagination"></div>

        <!-- If we need navigation buttons -->
        <div class="swiper-button-prev"></div>
        <div class="swiper-button-next"></div>
      </div>
    </main>

		
		<!-- 상품swiper -->
		<div class="main_section02">
		<div class="item-sec">
			<h1 align="center" id="mainH1">New Items</h1>
  	 		<div class="swiper productSwiper">
     			<div class="swiper-wrapper">
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-items-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-items-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-items-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-items-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-items-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-items-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		
	      		</div>
	      		<div class="swiper-button-next"></div>
	      		<div class="swiper-button-prev"></div>
	      		<div class="swiper-scrollbar"></div>
      			</div>
    		</div>
			</div>
		
		<!-- 이슈swiper -->
		<div class="main_section03">
			<div>
			<h1 align="center" id="mainH1">New Issue</h1>
  	 		<div class="swiper issueSwiper">
     			<div class="swiper-wrapper">
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-issue-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-issue-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-issue-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-issue-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-issue-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-issue-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        	</div>
	        	 <!-- If we need pagination -->
		        <div class="swiper-pagination"></div>
		
			</div>
			</div>
		</div>



		<div class="main_section04">
			<div>
			<h1 align="center" id="mainH1">New Album</h1>
  	 		<div class="swiper albumSwiper">
     			<div class="swiper-wrapper">
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-album-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-album-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-album-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-album-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-album-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        		<div class="swiper-slide">
	        			<div class="swiper-slide-album-wrap">
	        				<a href="#"><img src=""></a>
	        			</div>
	        		</div>
	        	</div>
	        	 <!-- If we need pagination -->
		        <div class="swiper-scrollbar"></div>
		
			</div>
			</div>
		</div>
		
<!-- 		<form id="popUp">
			<input type="hidden" name="popUp" value="">
		</form> -->
		
  <script>
  function loginAlert() {
      alert("사용 권한이 없습니다. 로그인 해주세요");
  }
  
    const swiper = new Swiper("#mainSwiper", {
      loop: true,
      autoplay: {
        delay: 3000,
      },

      // If we need pagination
      pagination: {
        el: ".swiper-pagination",
      },

      // Navigation arrows
      navigation: {
        nextEl: ".swiper-button-next",
        prevEl: ".swiper-button-prev",
      },
    });

  	var itemSwiper = new Swiper(".productSwiper", {
        slidesPerView: 3,
        spaceBetween: 30,
        loop: true,
        autoplay: {
            delay: 4000,
          },
        scrollbar: {
            el: ".swiper-scrollbar",
            hide: true,
          },
      navigation: {
          nextEl: ".swiper-button-next",
          prevEl: ".swiper-button-prev",
        },
      centeredSlides: true,
    });
  	
  	var issueSwiper = new Swiper(".issueSwiper", {
        slidesPerView: 3,
        spaceBetween: 30,
		loop: true,
        grabCursor: true,
        pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
    });

  	var albumSwiper = new Swiper(".albumSwiper", {
        slidesPerView: 3,
        spaceBetween: 30,
		loop: true,
        grabCursor: true,
        pagination: {
            el: ".swiper-scrollbar",
            clickable: true,
          },
        navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
        },
    });
  	
  	var backSwiper = new Swiper(".bg-swiper",{
  		spaceBetween: 30,
        centeredSlides: true,
        autoplay: {
          delay: 2500,
          disableOnInteraction: false,
        },
        
  	});
  	const mainBG = document.querySelector("#main-bg")
  	const colors = ["#CC99FF", "aqua","#99FFCC", "pink", "#FFFF99", "#A7EEFF"]
  	
  	function changeBackground(activeIndex){
  		const index = Math.floor(Math.random() * colors.length);
  		console.log(index)
  		mainBG.style = "background-color:" + colors[index];
  		console.log(mainBG)
  	}
  	
  	changeBackground(1);
  	
  	swiper.on("slideChange", function(){
  		changeBackground(this.activeIndex);
  	});
  	
  </script>

  <%@include file="./include/user_bottom.jsp" %>

>>>>>>> 00b8ab7eb6df08154ca6a7505ea0f255452312d8
