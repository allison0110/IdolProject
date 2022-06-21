<%@page import="java.text.DecimalFormat"%>
<%@page import="com.idol.model.OrderDTO"%>
<%@page import="java.util.HashMap"%>
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
<title>마이페이지> 주문내역</title>
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
	
	.order_list{
	   margin: 30px 0;
       border: 1px solid gray;
       border-radius: 10px;
       padding: 10px;
	}
	
		.order_item{
		display: flex;
		margin:20px 10px;
	}
	
	.order_item .order_photo {
		width:100px;
		height:100px;
		border-radius: 10px;
		margin-right:20px;
	}
	
	.order_photo img{
		width:100%;
		height:100%;
		border: 1px solid #8b8989;
	}
	
	.order_item .order_info{
		line-height: 1.5;
	}
	


</style>


<script type="text/javascript">



</script>
</head>
<body>
	<c:set var="dto" value="${loginInfo }"/> <!--로그인회원 정보 저장 -->
	<c:set var="list" value="${dateMap }"/>
	
	<%@include file="../include/user_top.jsp" %>
	<div class="mypage_container">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main" style="margin-left: 20px; margin-top: 50px;">
		<div class="qna_top">
		<h2>고객문의 내역</h2>
		</div>
		<hr style="border: 2px solid black;">

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
		
		<form id="frm">
		<input type="hidden" name="viewCount" id="viewCount" value="0">
		<input type="hidden" name="startCount" id="startCount" value="0">
		<div class="order_main">

			<c:if test="${!empty dateMap }">
		<%
			HashMap<String, List> map = (HashMap<String, List>)request.getAttribute("dateMap");
			List<String> dates = (List<String>)request.getAttribute("dates");
			
			for(int i=0; i<dates.size(); i++){//map과 date 사이즈 같음
				
				String date = dates.get(i);//날짜
				List list = map.get(i);//날짜에 해당하는 구매리스트를 담은 리스트 (ex. 0916구매 총 6건 )
		%>		
			<div class="order_list">
				<h2>구매날짜 : <%=date %></h2>
				
				<% 		//구매리스트 for문
						int group =1;//구매 group 구분지을 변수
						
				for(int j=0; j< list.size(); j++){
					
					OrderDTO dto = (OrderDTO)list.get(j);
					
					DecimalFormat format = new DecimalFormat("###,###");
					String price = format.format(dto.getOrder_total());
					
					if(dto.getOrder_group() == group ){ %>
				<div class="order_item">

					<div class="order_photo">
						<img
							src="./resources/upload/product/<%=dto.getOrder_pimage()%>">
					</div>
					<div class="order_info">
						<span style="font-size: 15px; color: gray;"> <%=dto.getOrder_date().substring(0, 10)%>
						</span> <br> <span style="font-size: 1.2em; font-weight: bold;">
							<%=dto.getOrder_pname()%></span><br> <span
							style="font-size: 0.9em;"><%=dto.getOrder_qty()%>개 </span>| <span
							style="font-size: 0.9em;"> <%=price%>원
						</span>
					</div>
					
							</div>
						<!-- class="order_item" -->


				<% 			}else{
				%>
						<hr>	
						<div class="order_item">

							<div class="order_photo">
								<img
									src="./resources/upload/product/<%=dto.getOrder_pimage()%>">
							</div>
							<div class="order_info">
								<span style="font-size: 15px; color: gray;"> <%=dto.getOrder_date().substring(0, 10)%>
								</span> <br> <span style="font-size: 1.2em; font-weight: bold;">
									<%=dto.getOrder_pname()%></span><br> <span
									style="font-size: 0.9em;"><%=dto.getOrder_qty()%>개 </span>| <span
									style="font-size: 0.9em;"> <%=price%>원
								</span>
							</div>

						</div>
						<!-- class="order_item" -->

				<%
						group++;
				}//if - else%>
							
							
				<%		}//날짜별 구매리스트 for문
				%>		
				</div> <!-- class=" "order_list" -->
			<% 		}//바깥 map.size  for문%>
					
			</c:if>
		</div>	<!-- class="order_main"  -->
		<br><br>
		
		<div id="more_btn" align="center">
			<a id="more_btn_a" href="javascript:moreContent('order_item', 6)"> 더보기(more)</a>
		</div>
		</form>
		
		
	
		
		
		</div><!-- class="mypage_main" end -->
	
	</div><!-- class="mypage_container" end -->
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>