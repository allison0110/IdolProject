<%@page import="com.idol.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지> 문의글 작성</title>
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
	
	.qna_table{
		padding: 0 10px;
		
	}
	
	.qna_table table{
		width: 100%;
	}
	


</style>


<script type="text/javascript">



</script>
</head>
<body>
	<c:set var="dto" value="${loginInfo }"/> <!--로그인회원 정보 저장 -->
	<c:set var="category" value="${cList }"/> <!-- 문의게시글 카테고리 리스트 -->
	<c:set var="pCont" value="${pCont }"/> <!-- 제품정보 -->
	<script type="text/javascript">
	
		
	</script>
	
	<%@include file="../include/user_top.jsp" %>
	
	<div class="mypage_container">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main" style="margin-left: 20px; margin-top: 50px;">
		<div class="qna_top">
		<h2>고객문의 글 작성</h2>
		</div>
		<hr style="border: 2px solid black;">
		<br>
		
			<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/inquiry_write_ok.do">
			<table>
				<tr>
					<th>작성자</th>
					<td><input name="inquiry_userid" value="${dto.getMember_id()}" readonly></td>
				</tr>
				<tr>
					<th>상품 정보</th>
					<td>
					
					<c:if test="${!empty pCont }">
					<input name="product_name" value="${pCont.getProduct_name() }"> <!-- 상품정보 있는 경우 상품 이름이 들어가기 -->
					<input type="hidden" name="product_no" value="${pCont.getProduct_no() }">
					</c:if>
					
					<c:if test="${empty pCont }">
					<input name="product_name"> <!-- 상품정보 있는 경우 상품 이름이 들어가기 -->
					</c:if>
					<button type="button" class="product_search" 
					onclick="window.open( '<%=request.getContextPath()%>/inquiry_product.do', '', 'width=500,height=400, scrollbars=yes,directories=no') ">
					상품 검색
					</button></td>
				</tr>
				<tr>
					<th>분류</th>
					<td>
					<c:if test="${!empty cList }">
					<select name="category_inofk">
						<c:forEach items="${category }" var="c">
						<option value=${c.getCategory_ino() }> ${c.getCategory_iname() }</option>
						</c:forEach>
					</select>
					</c:if>
					</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input name="inquiry_title"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea rows="10" cols="30" name="inquiry_cont"></textarea>
					</td>
				</tr>
				<tr>
					<th>파일</th>
					<td><input type="file" name="file1" multiple="multiple"></td>
				</tr>
				<tr>
					<td colspan="2">
					<input type="submit" value="확인">
					<input type="reset" value="새로고침">
					</td>
				</tr>
			
			</table>
		</form>		
		
		
		</div><!-- class="mypage_main" end  -->
	
	</div><!-- class="mypage_container" end -->
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>