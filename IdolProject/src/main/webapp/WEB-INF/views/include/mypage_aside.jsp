<%@page import="com.idol.model.MemberDAOImpl"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<link rel="stylesheet" href="./resources/css/member.css">
<style type="text/css">

	.profile_image_wrap{
		position:relative;
	}

	#image_setting{
		/* display:none; */
	}
	
	.profile_image_wrap label{
		font-size:1.7em;
		top: 160px;
    	left: 200px;
		
	}
	
	.image_setting{
	    position: absolute;
   		 top: 120px;
   		 left: 160px;
	
	}
	
	.image_setting i{
		font-size: 2em;
  		  color: #bebdbd;
   	 text-shadow: 2px 1px 2px black;
	}
	
	
	/********* 레이어 팝업창 ***************/
	.editProfile{
		display: none;
		
		position:fixed;
		left: 20%;
		top:10%;
		translate: (-50%, -50%);
		
		width:600px;
		height:170px;
		border:3px solid #000;
		box-shadow: 1 1 20px rgb(0,0,0,0.5);
		background-color:#fff;
		
		box-sizing:border-box;
		text-align: center;
		padding:30px;
		z-index:100;
	}
	
	.editProfile .popup_close {
		
		position: absolute;
		right: 0 ; top:0;
		width: 20px;
		height: 20px;
		background: url(..image/close.png) no-repeat;
		/* color:transparent; */
	
	}
	
	.edit_dim {
		display:none;
		position:fixed;
		left:0; 
		top:0;
		width:100%;
		height:100%;
		background-color: rgb(0,0,0,0.5);
		z-index:99;
	}
	
	.edit_btn{
		
			width: 110px;
	    	height: 35px;
	  	  border-radius: 0px;
	 	   background-color: black;
	  	  color: white;
	 	   font-size: 0.8em;
		}
		
	.cancel_btn{
		
			width: 110px;
	    	height: 35px;
	  	  border-radius: 0px;
	 	   background-color: white;
	  	  color: black;
	 	   font-size: 0.8em;
		}
	
</style>
</head>
<body>
	<c:set var="dto" value="${loginInfo }"/>
	<%-- <c:set var="dto" value="${memInfo }"/>	 --%>
	<aside class="mypage_aside">
			<div class="profile_box">
				<div class="profile_image_wrap">
				<div class="profile_image">
					<c:if test="${!empty dto.getMember_image() }">
					<img src="./resources/upload/member_image/${dto.getMember_no() }/${dto.getMember_image() }" alt="member_image">
					</c:if>
					<c:if test="${empty dto.getMember_image() }">
						<i class="bi bi-card-image" style="font-size: 5em;text-align: center;margin-left: 25px;"></i>
					</c:if>
				</div>
				<a href="#editProfile" class="image_setting"><i class="bi bi-gear-fill"></i></a>
				</div>
				
				<!-- **************레이어 팝업창*********************              -->
				<div id="editProfile" class="editProfile">
					<form class="frm" method="post" action="<%=request.getContextPath() %>/editProfile.do" 
							enctype="multipart/form-data"> 
							
					<input type="hidden" name="member_no" value="${dto.getMember_no() }">
					<input type="hidden" name="member_id" value="${dto.getMember_id() }">
					<input type="hidden" name="old_img" value="${dto.getMember_image() }">
					<input type="hidden" name="uri" value="<%=request.getRequestURI()%>">
					<p>Upload Profile</p>
					<br>
					<input type="file" name="file1"><br>
					<input type="submit" class="edit_btn" value="적용">
					<input type="button" class="cancel_btn" value="취소" >
					</form>
				</div><!-- class="editProfile" -->
				<div class="edit_dim">
					
				</div>
				<!-- **************레이어 팝업창 script*********************-->
				<script type="text/javascript">
				
				$(".image_setting").on("click",function(){
					$(".editProfile").show();
					$(".frm").show();
					$(".edit_dim").show();
				});
				
				$(".editProfile .cancel_btn").on("click", function(){
					$(this).parent().hide();
					$(".edit_dim").hide();
					$(".editProfile").hide();
					
					}); 
				
				
				</script>
				<!-- **************레이어 팝업창*********************-->
				
				
				<div class="info">
					<div class="info_cont">
					<span class="nickname">${dto.getMember_nickname() }님</span><br> <!-- 닉네임 -->
					<span>	<!-- 아이디 -->
						<c:if test="${dto.getMember_id().length() <= 4 }">
							${dto.getMember_id().substring(0,2) }
							<c:forEach begin="1" end="${dto.getMember_id().substring(2).length() }">
								*
							</c:forEach>
						</c:if>
						<c:if test="${dto.getMember_id().length() > 4 }">
						${dto.getMember_id().substring(0,4) }
						<c:forEach begin="1" end="${dto.getMember_id().substring(4).length() }">
									*
						</c:forEach>
						</c:if>
					</span>
					</div>
				</div>
			
			</div><!-- class="profile_box" end -->
			
			<div class="mypage_menu">
					<ul>
						<li><a href="<%=request.getContextPath()%>/mypage.do">마이페이지</a></li>
						<li><a href="<%=request.getContextPath()%>/mySettings.do">회원정보관리</a></li>
						<li><a href="<%=request.getContextPath()%>/order_list.do">주문내역</a></li>
						<li><a href="<%=request.getContextPath()%>/inquiry_list.do">문의내역</a></li>
						<li><a href="<%=request.getContextPath()%>/logout.do">로그아웃</a></li>
					</ul>
			
			</div> <!-- class="mypage_menu" end -->
		
		</aside><!-- class="mypage_aside" end -->

</body>
</html>