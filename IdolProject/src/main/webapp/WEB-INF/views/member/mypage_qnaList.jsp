<%@page import="com.idol.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지> 문의내역</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./resources/js/member.js"></script>
<link rel="stylesheet" href="./resources/css/member.css">
<style type="text/css">
	
	/* ***********마이페이지 회원정보관리************* */
	
	.qna_notice{
		display:grid;
		grid-template-columns: 1fr 1fr;
	}
	
	.month_area ul{
		display:flex;
		list-style: none;
	}
	
	.quick_search{
	
		width:60px;
		height:25px;
		text-align:center;
		padding:1px;
		
	}
	.quick_search input{
		display:none;
	}
	.quick_search label{
		border:1px solid gray;
		width:100vw;
		height:100vh;
	}
	


</style>


<script type="text/javascript">



</script>
</head>
<body>
	<c:set var="dto" value="${loginInfo }"/> <!--로그인회원 정보 저장 -->
	<script type="text/javascript">
	

		
	</script>
	<div class="mypage_container" algin="center">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main" style="margin-left: 20px; margin-top: 50px;">
		<div class="qna_top">
		<h2>고객문의 내역</h2>
		</div>
		<hr style="border: 2px solid black;">
		<div class="qna_notice">
			<div class="notice_1">* 현재 답변 대기 중인 문의는 <span>0</span>건 입니다.</div>
			<div class="notice_2"><input type="button" value="문의하기"></div>
		</div>	
		<div class="qna_month">
			<table>
				<tr>
					<td>
						<div class="month_area">
							<ul>
								<li class="quick_search"><label for="MONTH0.03"><input id="MONTH0.03" type="checkbox">오늘</label></li>
								<li class="quick_search"><label for="MONTH0.25"><input id="MONTH0.25" type="checkbox">1주일</label></li>
								<li class="quick_search"><label for="MONTH1"><input id="MONTH1" type="checkbox">1개월</label></li>
								<li class="quick_search"><a href="#">3개월</a></li>
								<li class="quick_search"><a href="#">6개월</a></li>
								<li class="quick_search"><a href="#">1년</a></li>
							</ul>
						</div>
					</td>
					<td><input type="button" value="조회"></td>
				
				</tr>
			</table>
		</div>
		
		
		<table>
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>상품정보</th>
				<th>제목</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>
		</table>
			
		</div><!-- class="mypage_main" end -->
	
	</div><!-- class="mypage_container" end -->

</body>
</html>