<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/global.css" />
	<link rel="stylesheet" href="./resources/css/main.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	div{
	display: block;
	
	}
	.event_wrap{
	width: 980px;
	height: auto;
	margin: 0 auto;
	margin-top: 40px;
	
	}
	#event_h2{
		text-align: center;
		font-size: 40px;
		font-weight: 700;
		
	}
	
	event_wrap ul li a{
		text-decoration: none;
	}
	
	.event_title ul li{
		border-bottom: 2px solid lightgray;
		float:left;
		width: 50%;
		margin: 70px auto;
		height: 45px;
		line-height:45px;
		
	}
	
	.event_title ul li.active{
		border-bottom-color: red;
		color: red;
	}
	
	.event_menu ul li{
		color: lightgray;
	}
	
	.event_menu ul li a.active{
		color: red;
		font-weight: bold;
	}
	
	.event_title ul li a{
		text-align: center;
		font-size: 16px;
		display: block;
		
	}
	
	.event_menu ul li{
		float:left;
	}
	
	.event_cont_table{
	border-bottom: 1px solid #d5d5da;
    padding-left: 30px !important;
    width: 1170px !important;
    display: block;
	
	}
	
	
</style>
</head>
<body>
<%@include file="../include/user_top.jsp" %>

	
		
		<div class="event_wrap">
			<div class="event_content">
				<div class="event_title">
					<a href="<%=request.getContextPath() %>/event_list.do?board_id=1&category_id=1"><h2 id="event_h2">EVENT</h2></a>
					<ul>
						<li class="tab_li"><a href="<%=request.getContextPath()%>/event_list.do?board_id=1&category_id=1">CELEB EVENT</a></li>
						<li class="tab_li"><a href="<%=request.getContextPath()%>/event_list.do?board_id=1001&category_id=1">CONCERT INFO</a></li>
					</ul>

				</div>
			
			<div class="event_menu">	
				<ul>
					<li class="event_category_li">
						<a href="<%=request.getContextPath()%>/event_list.do?board_id=1&category_id=1" id="doEvent">진행중 이벤트</a>
					</li>
					
					<li class="event_category_li">
						<a href="<%=request.getContextPath()%>/event_list.do?board_id=1&category_id=2" id="endEvent">종료 이벤트</a>
					</li>
				</ul>
			</div>
			</div>
		</div>
		
			<c:set var="dto" value="${Cont }"/>
			<c:set var="paging" value="${Page }"/>
		
			<table class="event_cont_table">
				<tbody>
					<tr>
						<td>
							${dto.notice_title }
						</td>
					</tr>
					
					<c:if test="${dto.notice_update==null }">
						<tr>
							<td>
								${dto.notice_date }
							</td>
						</tr>
					</c:if>
					
					<c:if test="${dto.notice_update!=null }">
						<tr>
							<td>
								${dto.notice_update }
							</td>
						</tr>
					</c:if>
					
					<tr>
						<th>조회수</th>
						<td>
							${dto.notice_hit }
						</td>
					</tr>
					
					<tr>
						<td>
							${dto.notice_cont }
						</td>
					</tr>
				</tbody>
			
			</table>
		
		

<%@include file="../include/user_bottom.jsp" %>
</body>
<script type="text/javascript">
var search=window.location.search
var schema=new URLSearchParams(search)
console.log(schema.get("board_id"))
var tablis = document.querySelectorAll(".tab_li")
var categories = document.querySelectorAll(".event_category_li a")
if(schema.get("board_id") === "1"){
	tablis[0].classList.add("active")
}else if(schema.get("board_id")==="1001"){
	tablis[1].classList.add("active")
}
if(schema.get("category_id")==="1"){
	categories[0].classList.add("active")
}else if(schema.get("category_id")==="2"){
	categories[1].classList.add("active")
}
categories.forEach(function(anchor, i){
	anchor.addEventListener("click",function(ev){
		ev.preventDefault()
		window.location.href="<%=request.getContextPath()%>/event_list.do?board_id="+schema.get("board_id")+"&category_id="+(i+1)
	})
})
</script>
</html>