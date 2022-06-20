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
	.notice_1 span{
		color:#ff5722;
		font-weight: bold;
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
		border:1px solid black;
		
	}
	
	
	.quick_search input{
		display:none;
	}
	.quick_search label{
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
	<c:set var="list" value="${List }"/>
	<c:set var="paging" value="${paging }"/>
	
	<script type="text/javascript">
	

		
	</script>
	<div class="mypage_container">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main" style="margin-left: 20px; margin-top: 50px;">
		<div class="qna_top">
		<h2>고객문의 내역</h2>
		</div>
		<hr style="border: 2px solid black;">
		<div class="qna_notice">
			<div class="notice_1">* 현재 답변 대기 중인 문의는 
				<span>${waiting }</span>건입니다.</div>
			<div class="notice_2"><input type="button" value="문의하기" onclick="location.href='inquiry_write.do'"></div>
		</div>	
		<form method="post" action="<%=request.getContextPath() %>/inquiry_date.do">
		<div class="qna_month">
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
				
				var preValue=0;
				var count =0;
				/* 
				if($("input[name='search_date']:checked")){
					
					preValue =$(this).val();
				} */
				
				$("input[name='search_date']").click(function(){
					
					if(count >=1){
						$("#"+check).css('background-color','#e9e3e1');
						$("#"+preValue).css('background-color', 'white');
						preValue = String($(this).val());
					}
					
					var check = String($(this).val());
					preValue = String($(this).val());
					
					console.log("preValue:"+preValue);
					
					$("#"+check).css('background-color','#e9e3e1');
					
					count ++;
				
				});
				
				
			});
		
		
			/* if($(":radio[name='search_date']:checked")){
				var check = $(this).val();
				console.log(check);	
				
			} */
			
		
		</script>
		
		<div class="qna_table">
		<table border="1" >
			<tr>
				<th>번호</th>
				<th>구분</th>
				<th>상품정보</th>
				<th>제목</th>
				<th>등록일</th>
				<th>상태</th>
			</tr>
			<c:if test="${!empty List }">
				<c:forEach items="${list }" var="idto">
				<tr>
					<td>${idto.getInquiry_no() }</td>				
					<td>
						<c:choose>
							<c:when test="${idto.getCategory_inofk() == 1 }">취소/환불</c:when>						
							<c:when test="${idto.getCategory_inofk() == 2 }">상품문의</c:when>						
							<c:when test="${idto.getCategory_inofk() == 3 }">배송</c:when>						
							<c:when test="${idto.getCategory_inofk() == 4 }">교환</c:when>						
							<c:when test="${idto.getCategory_inofk() == 5 }">기타</c:when>						
						</c:choose>
					</td>				
					<td>
						<c:if test="${idto.getProduct_no() != 0 }">
							상품사진? or 상품이름
						</c:if>
					</td>
					<td>
						<a href="<%=request.getContextPath()%>/inquiry_cont.do?no=${idto.getInquiry_no()}&page=${paging.getPage()}">${idto.getInquiry_title() }</a>
					</td>				
					<td>${idto.getInquiry_date().substring(0,10) }</td>				
					<td>
						<c:if test="${idto.getInquiry_status() == 0 }">
						답변대기
						</c:if>
						<c:if test="${idto.getInquiry_status() == 1 }">
						답변완료
						</c:if>
					</td>				
				</tr>
				</c:forEach>
			</c:if>
		</table>
		<!-- 검색기능..할까말까... -->
		
		<!-- 페이징 처리 -->
		<div class="table_page">
		<c:if test="${paging.getPage() > paging.getBlock() }"> <!-- 현재 페이지가 4인데 block사이즈는 3이라면 -->
			<a href="inquiry_list.do?page=1">[맨 처음]</a>
			<a href="inquiry_list.do?page=${paging.getStartBlock()-1 }">◀</a>
		</c:if>

		<c:forEach begin="${paging.getStartBlock() }" end="${paging.getEndBlock() }" var="i">
			
			<c:if test="${i == paging.getPage() }">
			<b><a href="inquiry_list.do?page=${i }">[${i }]</a></b>
			</c:if>	
			
			<c:if test="${i != paging.getPage() }">
			<a href="inquiry_list.do?page=${i }">[${i }]</a>
			</c:if>
				
		</c:forEach>


		<c:if test="${paging.getEndBlock() < paging.getAllPage() }"> <!-- endBlock이 6인데 allPage가 7이라면 -->
			<a href="inquiry_list.do?page=${paging.getEndBlock()+1 }">▶</a>
			<a href="inquiry_list.do?page=${paging.getAllPage()}">[마지막으로]</a>
		</c:if>
		
		</div>
		
		</div>	<!-- class="qna_table"  -->
		
		
		</div><!-- class="mypage_main" end -->
	
	</div><!-- class="mypage_container" end -->

</body>
</html>