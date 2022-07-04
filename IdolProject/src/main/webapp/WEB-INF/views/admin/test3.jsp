<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>



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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawVisualization);

      function drawVisualization() {
        // Some raw data (not necessarily accurate)
        var data = google.visualization.arrayToDataTable([
          ['Month', '잡화', 'DVD', '포스터', '문구', '응원봉', '카드', '의류', '악세사리', '총매출'],
          ['2022/02',  165,      938,         522,            998,          998,    450,       450,   450,      614.6],
          ['2022/03',  135,      1120,        599,            1268,         998,    450,       450,   288,      682],
          ['2022/04',  157,      1167,        587,            807,          998,    450,       450,   397,      623],
          ['2022/05',  139,      1110,        615,            968,          998,    450,       450,   215,      609.4],
          ['2022/06',  136,      691,         629,            1026,         998,    450,       450,   366,      569.6]
        ]);

        var options = {
          title : 'IdolProject Sales Management Chart',
          vAxis: {title: 'Goods'},
          hAxis: {title: 'Month'},
          seriesType: 'bars',
          series: {8: {type: 'line'}}
        };

        var chart = new google.visualization.ComboChart(document.getElementById('chart_div'));
        chart.draw(data, options);
      }
    </script>
    
    
    <style type="text/css">
    
    .notice_cont_slider {
		/*width: 500px;*/
		/*height: 600px;*/
		width: 40%;
		height: 40%;
	}
	
	.notice_cont_slider img{
		width: 100%;
		height: 100%;
		cursor: pointer;
	}
	
	
	.draggable {
   		height: 100%;
		width: 100%;
	}
	
	.slick-track {
		height: 100%;
		width: 100%;
	}
	
	.slick-dots {
		display: flex;
		color: white;
		background-color: black;
		font-family: 'Press Start 2P', cursive;
		
	}
    
    
    </style>
    
</head>
<body>
<c:set var="orderlist" value="${orderList }" />
<c:set var="rdate" value="${rangeDate }" />
<c:set var="testlist" value="${testList }" />
<c:set var="gdto" value="${grouCont }" />
<c:set var="gimgs" value="${arrayGrouImage }" />





<form action="<%=request.getContextPath() %>/test_result.do">
	<input name="daterange">
	<input type="submit" value="GO">
</form>

	<h1>
		${gdto.group_name }
	</h1>

	<div class="notice_cont_slider">
		<c:forEach items="${arrayGrouImage }" var="gimg">
	    	<img alt="" src="./resources/upload/group/${gimg }">
	    </c:forEach>
	 </div> <!-- notice_cont_slider -->


<div>
	<c:forEach items="${testlist }" var="dto">

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

<div id="chart_div" style="width: 900px; height: 500px;"></div>






<script type="text/javascript">

$('.notice_cont_slider').slick({
	  slidesToShow: 3,
	  slidesToScroll: 1,
	  autoplay: true,
	  autoplaySpeed: 2000,
	});
							

</script>





</body>
</html>