<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="./resources/css/all.min.css">
		<link rel="preconnect" href="https://fonts.googleapis.com">
		<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
		<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@300;400;500;700&display=swap" rel="stylesheet">
	    <link rel="stylesheet" href="./resources/css/global.css" />
	    <link rel="stylesheet" href="./resources/css/gnb.css" />
	    <link rel="stylesheet" href="./resources/css/main.css" />
		<title>YOUR CELEB</title>
	</head>
	<body>
		<!-- include header -->
              <div id="g_nav">
                 <ul class="main_login_section">
				<% if(session.getAttribute("login_id") == null){ 
				 %>
           			<li><a href="#">Login</a></li>
          			<li><a href="#">Join</a></li>
				<%} else{ %>          			
                    <li><a href="#">Logout</a></li>
                <%} %>	
                 </ul>
              </div>
   		<header id="header">
      <div class="gnb">
        <div class="gnb-wrap">
	      <div class="logo"><a href="<%=request.getContextPath()%>/"><img src="././resources/upload/logo.png"></a></div>
          <div class="gnb-menu">
            <ul>
              <li>
                <a href="#" class="active-link" id="artist">ARTIST</a>
              </li>
              <li>
                <a href="#" class="active-link" id="product">PRODUCT</a>
              </li>
              <li><a href="#">FORUM</a></li>
              <li><a href="<%=request.getContextPath()%>/event_list.do?board_id=1&category_id=1">EVENT</a></li>
              <li><a href="<%=request.getContextPath()%>/member_ranking_list.do">MEMBERS</a></li>
              <li><a href="#">MARKET</a></li>
            </ul>
            
          </div>


          <div class="gnb-tool">
            <ul>
            <!-- 로그인이 안 되어 있을 경우 -->
            <% if(session.getAttribute("login_id")==null){ %>
              <li>
              <!-- MYPAGE -->
                <a href="#" onclick="loginAlert()"><i class="fa-solid fa-user"></i></a>
              </li>
              <!-- SEARCH -->
              <li><a href="#"><i class="fa-solid fa-magnifying-glass"></i></a></li>
				
			  <!-- CART -->
              <li><a href="#" onclick="loginAlert()"><i class="fa-solid fa-cart-shopping"></i></a></li>
            
            </ul>
            <%}else { %>
            <ul>
              <li>
              <!-- MYPAGE -->
                <a href="#"><i class="fa-solid fa-user"></i></a>
              </li>
              <!-- SEARCH -->
              <li><a href="#"><i class="fa-solid fa-magnifying-glass"></i></a></li>
			  <!-- CART -->
              <li><a href="#"><i class="fa-solid fa-cart-shopping"></i></a></li>
            </ul> 
            <%} %>
          </div>
        </div>
        <div class="menu" id="menu">
        <div class="menu-wrap">
          <!-- artist sub menu -->
          <div id="artist-box">
            <ul class="artist-menu">
              <li>
                <a href="#">SHINEE</a>
              </li>
              <li>
                <a href="#">싸이</a>
              </li>
              <li>
                <a href="#">(여자)아이들</a>
              </li>
              <li>
                <a href="#">AESPA</a>
              </li>
              <li>
                <a href="#">BTS</a>
              </li>
              <li>
                <a href="#">BLACK PINK</a>
              </li>
              <li>
                <a href="#">RED VELVET</a>
              </li>
              <li>
                <a href="#">박재범</a>
              </li>
              <li>
                <a href="#">STAYC</a>
              </li>
              <li>
                <a href="#">BEAST</a>
              </li>
              <li>
                <a href="#">IVE</a>
              </li>
              <li>
                <a href="#">LE SSERAFIM</a>
              </li>
            </ul>

            <div class="artist-album">
              <div>
                <div class="artist-album-img">
                  <img id="img" src="" />
                </div>
                <div class="artist-album-info">
                  <p class="artist-album-singer" id="singer"></p>
                  <p class="artist-album-tit" id="title"></p>
                  <a class="artist-album-detail-link" href="#">자세히보기</a>
                </div>
              </div>
            </div>
          </div>
          <!-- product sub menu -->
          <div id="product-box">
            <div class="product-wrap-vertical">
              <div class="product-wrap">
                <div class="tit"><a href="#">MUSIC</a></div>
                <ul class="product-menu">
                  <li>
                    <a href="#">CD</a>
                  </li>
                  <li>
                    <a href="#">DVD</a>
                  </li>
                  <li>
                    <a href="#">etc.</a>
                  </li>
                </ul>
              </div>

              <div class="product-wrap">
                <div class="tit"><a href="#">PHOTO</a></div>
                <ul class="product-menu">
                  <li>
                    <a href="#">Printed</a>
                  </li>
                  <li>
                    <a href="#">Photo Book</a>
                  </li>
                </ul>
              </div>

              <div class="product-wrap">
                <div class="tit"><a href="#">CONCERT</a></div>
                <ul class="product-menu">
                  <li>
                    <a href="#Official Fanlight">Official Fanlight</a>
                  </li>
                  <li>
                    <a href="#Concert Goods">Concert Goods</a>
                  </li>
                </ul>
              </div>
            </div>
            <div class="product-wrap">
              <div class="tit"><a href="#">LIVING</a></div>
              <ul class="product-menu">
                
                <li><a href="#">Home</a></li>
                <li><a href="#">Kitchen</a></li>
                <li><a href="#">F&B</a></li>
                <li><a href="#">Tech</a></li>
                <li><a href="#">Book</a></li>
                <li><a href="#">Pet</a></li>
              </ul>
            </div>
            <div class="product-wrap">
              <div class="tit"><a href="#">BEAUTY</a></div>
              <ul class="product-menu">
                
                <li><a href="#">Skin Care</a></li>
                <li><a href="#">Make Up</a></li>
                <li><a href="#">Cleansing</a></li>
                <li><a href="#">Body & Hair</a></li>
                <li><a href="#">Pack & Masks</a></li>
                <li><a href="#">Perfume</a></li>
	   			<li><a href="#">Tool</a></li>
	   			<li><a href="#">Men's</a></li>
              </ul>
        </div>
          <div class="product-wrap">
              <div class="tit"><a href="#">STATIONERY</a></div>
              <ul class="product-menu">
                
                <li><a href="#">Note</a></li>
                <li><a href="#">Office</a></li>
                <li><a href="#">Pen</a></li>
                <li><a href="#">Deco</a></li>
                <li><a href="#">Binder</a></li>
                <li><a href="#">Toy</a></li>
              </ul>
        </div>
        <div class="product-wrap-vertical">
        <div class="product-wrap">
              <div class="tit"><a href="#">FASHION</a></div>
              <ul class="product-menu">
                
                <li><a href="#">Clothing</a></li>
                <li><a href="#">Acc</a></li>
                <li><a href="#">Jewelry</a></li>
              </ul>
         </div>
            
        <div class="product-wrap">
              <div class="tit"><a href="#">CUSTOMIZING</a></div>
              <ul class="product-menu">
                
                <li><a href="#">Phone Case</a></li>
                <li><a href="#">Fashion</a></li>
                <li><a href="#">Acc</a></li>
              </ul>
        </div>
        
        </div>
        
        </div>
      </div>
      </div>
      </div>
    </header>
    <!-- include header -->
