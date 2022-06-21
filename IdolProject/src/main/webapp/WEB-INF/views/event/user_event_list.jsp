<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	height: 800px;
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
</style>
</head>
<body>
<%@include file="../include/user_top.jsp" %>

	<div class="event_wrap">
		<div class="event_content">
			<div class="event_title">
				<h2 id="event_h2">EVENT</h2>
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
			
			<c:set var="list" value="${noticeList }"/>
			<%-- <c:set var="paging" value="${Paging }"/> --%>
			
			
			<c:if test="${list.size() > 0}">
				<c:forEach items="${list}" var="dto">
				<div>
					<ul>
						<li>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link"><img src=""><!-- ${i.notice_image} --></a>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link">${dto.notice_title }</a>
						</li>					
						<li>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link"><img src=""><!-- ${i.notice_image} --></a>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link">${dto.notice_title }</a>
						</li>					
						<li>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link"><img src=""><!-- ${i.notice_image} --></a>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link">${dto.notice_title }</a>
						</li>					
						<li>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link"><img src=""><!-- ${i.notice_image} --></a>
							<a href="<%=request.getContextPath() %>/event_cont.do?no=${dto.notice_no}" class="img_link">${dto.notice_title }</a>
						</li>					
					</ul>
				</div>
				</c:forEach>
			</c:if> 
			
			<c:if test="${list.size() == 0}">
				<div>
					<ul>
						<li>
							<p>검색 결과가 없습니다</p>
						</li>
					</ul>
				</div>
			</c:if>
			
			
			<div class="event_page_section">
				
			</div>
		</div>
	</div>
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
	<%@include file="../include/user_bottom.jsp" %>
</body>
</html>