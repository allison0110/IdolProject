<%@page import="com.idol.model.ProductDTO"%>
<%@page import="com.idol.model.InquiryDTO"%>
<%@page import="java.util.List"%>
<%@page import="com.idol.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지> 문의내역 날짜조회</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./resources/js/member.js"></script>
<link rel="stylesheet" href="./resources/css/member.css?v=2022062814">
<style type="text/css">
	.btn{
		    background-color: white;
    border: 1px solid #233044;
    padding: 5px 10px;
    border-radius: 21px;
    cursor: pointer;
	
	}
	
	.btn:hover {
		background-color: #2a3a52;
		color:white;
}

</style>


<script type="text/javascript">



</script>
</head>
<body>
	<c:set var="dto" value="${loginInfo }"/> <!--로그인회원 정보 저장 -->
	<c:set var="list" value="${List }"/>
	<c:set var="plist" value="${pCont }"/> <!-- 제품정보 -->
	<c:set var="paging" value="${paging }"/>
	<c:set var="search_date" value="${search_date }"/><!-- 날짜조회 -->
	
	<%@include file="../include/user_top.jsp" %>
	<div class="mypage_container">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main" style="margin-left: 20px; margin-top: 50px;">
		<div class="manage_top">
		고객문의 내역
		</div>
		<div class="qna_notice">
			<div class="notice_1">* 현재 답변 대기 중인 문의는 
				<span>${waiting }</span>건입니다.</div>
			<div class="notice_2" align="right"><input type="button" value="문의하기" onclick="location.href='inquiry_write.do?id=${dto.getMember_id()}'"></div>
		</div>	
		<form method="post" action="<%=request.getContextPath() %>/inquiry_date.do">
		<div class="qna_month" align="center">
			<table>
				<tr>
					<td>
						<div class="month_area">
							<ul>
								<li class="quick_search" id="0"><label for="MONTH0"><input id="MONTH0" type="radio" name="search_date" value="0" >오늘</label></li>
								<li class="quick_search" id="7"><label for="MONTH0.25"><input id="MONTH0.25" type="radio" name="search_date" value="7">1주일</label></li>
								<li class="quick_search" id="1"><label for="MONTH1"><input id="MONTH1" type="radio" name="search_date" value="1">1개월</label></li>
								<li class="quick_search" id="3"><label for="MONTH3"><input id="MONTH3" type="radio" name="search_date" value="3">3개월</label></li>
								<li class="quick_search" id="6"><label for="MONTH6"><input id="MONTH6" type="radio" name="search_date" value="6">6개월</label></li>
								<li class="quick_search" id="12"><label for="MONTH12"><input id="MONTH12" type="radio" name="search_date" value="12">1년</label></li>
							</ul>
						</div>
					</td>
					<td><input type="submit" value="조회"></td>
				</tr>
			</table>
		</div>
		</form>
		<script type="text/javascript">
			
			$(document).ready(function(){
				
				
				
				var preValue='<c:out value='${search_date}'/>';
				var count =0;
				
				console.log(preValue);
				console.log(typeof preValue);
				
				if(preValue != null){
					
					$("#"+preValue).css('background-color','#e9e3e1');
					count = 1;
				}
				
				$("input[name='search_date']").click(function(){
					
					var check = String($(this).val());
					
					
						$("#"+check).css('background-color','#e9e3e1');
						$("#"+preValue).css('background-color', 'white');
						preValue = String($(this).val());
					
					
				
				});
				
				
			});
		
		
			/* if($(":radio[name='search_date']:checked")){
				var check = $(this).val();
				console.log(check);	
				
			} */
			
		
		</script>
		
		<div class="qna_table">
		<table >
			<tr class="firstRow">
				<th>구분</th>
				<th>상품정보</th>
				<th>제목</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>
			<c:if test="${!empty List }">
				<c:forEach items="${list }" var="inquiry">
					<tr>
						<td class="qna_td">
							<c:choose>
								<c:when test="${inquiry.getCategory_inofk() ==1}">취소/환불</c:when>
								<c:when test="${inquiry.getCategory_inofk() ==2}">상품문의</c:when>
								<c:when test="${inquiry.getCategory_inofk() ==3}">배송</c:when>
								<c:when test="${inquiry.getCategory_inofk() ==4}">교환</c:when>
								<c:when test="${inquiry.getCategory_inofk() ==5}">기타</c:when>
							</c:choose>
						</td>
						<td class="qna_product"> 
							<c:forEach items="${plist }" var="p">
								<c:if test="${inquiry.getProduct_no() == p.getProduct_no() }">
								<a href="<%=request.getContextPath()%>/product_detail.do?pno=${p.getProduct_no() }">
								  ${p.product_name }</a>
								</c:if>
							</c:forEach>
						</td>
						<td class="qnaboard_title">
						<a href="<%=request.getContextPath()%>/inquiry_cont.do?no=${inquiry.getInquiry_no() }&page=${paging.getPage()}">${inquiry.getInquiry_title() }</a>
						</td>
						<td class="qna_td">${inquiry.getInquiry_date().substring(0,10) }</td>
						<td class="qna_td">	
						<c:if test="${inquiry.getInquiry_status() == 0 }">
						<span style="color:#ff5722;">답변대기</span>
						</c:if>
						<c:if test="${inquiry.getInquiry_status() == 1 }">
						답변완료
						</c:if>
						</td>
					</tr>
				
				</c:forEach>
			</c:if>
			<tr>
				<td colspan="6" align="right">
					<input class="btn" type="button" value="전체목록" onclick="location.href='inquiry_list.do'">
				</td>
			</tr>
		</table>
	
		
		<!-- 페이징 처리 -->
		<div class="table_page" align="center">
		<c:if test="${paging.getPage() > paging.getBlock() }"> <!-- 현재 페이지가 4인데 block사이즈는 3이라면 -->
			<a href="inquiry_date.do?page=1&search_date=${search_date }">[맨 처음]</a>
			<a href="inquiry_date.do?page=${paging.getStartBlock()-1 }&search_date=${search_date}">◀</a>
		</c:if>

		<c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
			
			<c:if test="${i == paging.getPage() }">
			<b><a href="inquiry_date.do?page=${i }&search_date=${search_date}">[${i }]</a></b>
			</c:if>	
			
			<c:if test="${i != paging.getPage() }">
			<a href="inquiry_date.do?page=${i }&search_date=${search_date}">[${i }]</a>
			</c:if>
				
		</c:forEach>


		<c:if test="${paging.getEndBlock() < paging.getAllPage() }"> <!-- endBlock이 6인데 allPage가 7이라면 -->
			<a href="inquiry_date.do?page=${paging.getEndBlock()+1 }&search_date=${search_date}">▶</a>
			<a href="inquiry_date.do?page=${paging.getAllPage()}&search_date=${search_date}">[마지막으로]</a>
		</c:if>
		
		</div><!-- class="table_page" -->
		
		</div>	<!-- class="qna_table"  -->
		
		
		</div><!-- class="mypage_main" end -->
	
	</div><!-- class="mypage_container" end -->
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>