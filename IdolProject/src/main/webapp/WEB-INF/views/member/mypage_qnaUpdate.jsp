<%@page import="com.idol.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지> 문의글 수정</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./resources/js/member.js"></script>
<link rel="stylesheet" href="./resources/css/member.css">
<style type="text/css">
	
	/* ***********마이페이지 회원정보관리************* */
	
	.qna_cont, .qna_reply{
		padding: 20px 30px;
	}
	
	.qna_cont table, .qna_reply table{
		width: 100%;
	}
	
	.qna_cont table th{
		width: 20%;
	}
	
	.inquiry_img {
		display: flex;
	}
	
	.inquiry_img .img_item{
	
		width:100px;
		height:100px;
	}
	
	.img_item img{
		width:100%;
		height:100%;
	}


</style>


<script type="text/javascript">



</script>
</head>
<body>
	<c:set var="dto" value="${loginInfo }"/> <!--로그인회원 정보 저장 -->
	<c:set var="cont" value="${Cont }"/>
	<c:set var="page" value="${page }"/>
	<script type="text/javascript">
	

		
	</script>
	<div class="mypage_container">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main" style="margin-left: 20px; margin-top: 50px;">
		<div class="qna_top">
		<h2>고객문의 내용 수정</h2>
		</div>
		<hr style="border: 2px solid black;">
		<br>
			<div class="qna_cont">
			<form method="post" action="<%=request.getContextPath() %>/inquiry_updateOk.do"
			  enctype="multipart/form-data">
			  <input type="hidden" name="inquiry_no" value="${cont.getInquiry_no() }"> 
			  <input type="hidden" name="inquiry_image" value="${cont.getInquiry_image() }"> 
			  <input type="hidden" name="inquiry_userid" value="${cont.getInquiry_userid() }"> 
			  <input type="hidden" name="page" value="${page}"> 
			<table border="1">
				<tr>
					<th>작성자</th>
					<td>${cont.getInquiry_userid()}</td>
				</tr>
				<tr>
					<th>상품 정보</th>
					<td>
					<c:if test="${!empty cont.getProduct_no() }">
							상품사진? or 상품이름
					</c:if>
					</td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
					<c:choose>
							<c:when test="${cont.getCategory_inofk() == 1 }">취소/환불</c:when>						
							<c:when test="${cont.getCategory_inofk() == 2 }">상품문의</c:when>						
							<c:when test="${cont.getCategory_inofk() == 3 }">배송</c:when>						
							<c:when test="${cont.getCategory_inofk() == 4 }">교환</c:when>						
							<c:when test="${cont.getCategory_inofk() == 5 }">기타</c:when>						
					</c:choose>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="inquiry_title" value="${cont.getInquiry_title() }"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea name="inquiry_cont" rows="10" cols=""> ${cont.getInquiry_cont() }</textarea>
					</td>
				</tr>
				<tr>
					<th>파일</th>
					<td>
						<input type="file" name="file2" multiple="multiple">
					</td>
				</tr>
				<tr>
					<td colspan="2" align="right">
					<input  type="submit" value="수정" onclick="location.href='inquiry_update.do?no=${cont.getInquiry_no()}&page=${page}">
					<input  type="button" value="뒤로가기" onclick="location.href='inquiry_cont.do?no=${cont.getInquiry_no()}&page=${page}'">
					</td>
				</tr>
			
			</table>
			</form>
		</div><!-- class="qna_cont" -->
		
		
		
		
		</div><!-- class="mypage_main" end  -->
	
	</div><!-- class="mypage_container" end -->

</body>
</html>