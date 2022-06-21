<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../include/user_top.jsp" %>

	
	<div class="eventContWrap">
		
		<div class="event_wrap">
		<div class="event_content">
			<div class="event_title">
				<h2 id="event_h2">EVENT</h2>
				<ul>
					<li class="tab_li"><a href="<%=request.getContextPath()%>/event.do?board_id=1&category_id=1">CELEB EVENT</a></li>
					<li class="tab_li"><a href="<%=request.getContextPath()%>/event.do?board_id=1001&category_id=1">CONCERT INFO</a></li>
				</ul>

			</div>
			
			<div class="event_menu">	
				<ul>
					<li class="event_category_li">
						<a href="<%=request.getContextPath()%>/event.do?board_id=1&category_id=1" id="doEvent">진행중 이벤트</a>
					</li>
					
					<li class="event_category_li">
						<a href="<%=request.getContextPath()%>/event.do?board_id=1&category_id=2" id="endEvent">종료 이벤트</a>
					</li>
				</ul>
			</div>
			<c:set var="dto" value="${Cont }"/>
				<input type="hidden" value="${dto.celeb_name }">
				<input type="hidden" value="${dto.group_name }">
			<table>
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
					
					
				</tbody>
			
			</table>
			
		</div>
	</div>
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
		window.location.href="<%=request.getContextPath()%>/idol_event.do?board_id="+schema.get("board_id")+"&category_id="+(i+1)
	})
})
</script>
</html>