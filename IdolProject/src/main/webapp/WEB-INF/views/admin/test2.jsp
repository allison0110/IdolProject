<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />

<script type="text/javascript">
	$(function() {
		  $('input[name="daterange"]').daterangepicker({
	  locale: {
		      "separator": "-",                     // 시작일시와 종료일시 구분자
		      "format": 'YYYY/MM/DD',     // 일시 노출 포맷
		      },
		  
		  ranges: {
		        'Today': [moment(), moment()],
		        'Yesterday': [moment().subtract(1, 'days'), moment().subtract(1, 'days')],
		        'Last 7 Days': [moment().subtract(6, 'days'), moment()],
		        'Last 30 Days': [moment().subtract(29, 'days'), moment()],
		        'This Month': [moment().startOf('month'), moment().endOf('month')],
		        'Last Month': [moment().subtract(1, 'month').startOf('month'), moment().subtract(1, 'month').endOf('month')]
		    },
		    format: 'YYYY-MM-DD',
		    alwaysShowCalendars: true,
		    opens: 'conter'
		  }, function(start, end, label) {
		    console.log("A new date selection was made: " + start.format('YYYY-MM-DD') + ' to ' + end.format('YYYY-MM-DD'));
		  });
		});
</script>

</head>
<body>
<c:set var="orderlist" value="${orderList }" />
<c:set var="rdate" value="${rangeDate }" />
<c:set var="testlist" value="${testList }" />

<h1>TEST</h1>



<form action="<%=request.getContextPath() %>/test_result.do">
	<input name="daterange">
	<input type="submit" value="GO">
	
</form>
<c:forEach items="${rangeDate }" var="t">
	<div style="color:blue">
		${t }
	</div>
	
</c:forEach>

<div>
	<c:forEach items="${testlist }" var="dto">
		</div>
		<ul>
			<li>
				${dto.order_no }
			</li>
			<li>
				${dto.order_userid }
			</li>
			<li>
				${dto.order_pname }
			</li>
			<li>
				${dto.order_qty }
			</li>
			<li>
				${dto.order_total }
			</li>
			<li>
				${dto.order_tcost }
			</li>
			<li>
				${dto.order_mileage }
			</li>
			<li style="color: red">
				${dto.order_date }
			</li>
		</ul>


	</c:forEach>

</div>



</body>
</html>