<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="./resources/css/global.css" />
	<link rel="stylesheet" href="./resources/css/main.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	
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
	
	.event_title ul{
		display: flex;
	}
	
	.event_title ul li{
		border-bottom: 2px solid lightgray;
		width: 50%;
		margin: 70px auto;
		height: 45px;
		line-height:45px;
	}
	
	.event_title ul li.active{
		border-bottom-color: red;
		color: red;
	}
	
	.event_menu ul{
		display: flex;
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
	
	.event_menu ul li { 
		height: 20px;
	    line-height: 20px;
	    margin-right: 16px;
	}
	
	.event_cont_table{
	border-bottom: 2px solid lightgray;
    padding-left: 30px !important;
    width: 980px !important;
    display: block;
    margin-top: 24px;
    padding: 16px;
    border-collapse: collapse;
    overflow: hidden;
  	box-shadow: 0 0 20px rgba(0,0,0,0.1);
	
	}
	
	#event_cont_tr{
	border-bottom: 2px solid lightgray;
	}
	
	#event_cont_title{
	padding: 16px;
	
	}
	
	.event_cont_wrap{
	margin: 0 auto;
	width: 980px;
	height: auto;
	}
	
	#notice_cont_area{
	width: 100%;
	box-sizing: border-box;
	resize: none;
	padding: 16px;
	border: none;
	outline: none;
	text-align: center;
	}
	
	.cont_to_list{
    padding-top: 24px;
	padding-bottom: 24px;
    float: right;
	}
	.cont_to_list a{
	margin: 0 auto;
	margin-top: 16px;
    width: 170px;
    height: 48px;
    background-color: #fff;
    color: #2d2f43;
    font-size: 14px;
    font-weight: 400;
    display: block;
    text-align: center;
    line-height: 48px;
    border-radius: 50px;
    border: 1px solid #b4b5c1;
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
		<div class="event_cont_wrap">
			<table class="event_cont_table">
				<tbody>
					<tr id="event_cont_tr">
						<td id="event_cont_title">
							${dto.notice_title }
						</td>
					</tr>
					<tr id="event_cont_tr">
						<td id="notice_cont_area">
							<c:forEach items="${dto.notice_images }" var="filename">
								<img src="./resources/upload/notice/${filename }">
							</c:forEach>
						<% pageContext.setAttribute("replaceChar", "\n"); %>
				  			<c:set var="content" value="${fn:replace(dto.notice_cont, replaceChar, '<br>') }"/>
				  			${content }
						</td>
						
					</tr>
					
					<tr class="event_btn">
						<td class="cont_to_list">
							<a href="<%=request.getContextPath()%>/event_list.do?board_id=1&category_id=1">전체 목록</a>
						</td>
					</tr>
					

					<c:if test="${dto.notice_update==null }">
						<tr>
							<td id="event_cont_td" align=left>
								${dto.notice_date }
							</td>
							<td id="event_cont_hit" align=right>
								조회수 ${dto.notice_hit }
							</td>
							
						</tr>
					</c:if>
					
					<c:if test="${dto.notice_update!=null }">
						<tr>
							<td>
								${dto.notice_update }
							</td>
							
							<td id="event_cont_hit">
							조회수 
								${dto.notice_hit }
							</td>
						</tr>
					</c:if>
					
				</tbody>
			
			</table>
		</div>
		

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