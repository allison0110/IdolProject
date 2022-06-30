<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

	html, body {
		padding: 0px;
		margin: 0px;
		height: 100%;
		background-color: black;
	}
	
	.product_cont_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	.product_cont_container {
		display: flex;
		flex-direction: column;
		
	}
	.product_cont_div_forCenter {
		display: flex;
    	flex-direction: column;
    	align-items: center;
	}
	
	.product_imgs {
		width: 199px;
		height: 220px;
		display: flex;
   		flex-direction: row;
   		justify-content: center;
	}
	.product_imgs img {
		width: 100%;
		height: 100%;
	}
	
	.product_cont_detail {
		color: white;
		font-family: 'Press Start 2P', 'Gugi', cursive;
		font-size: 0.7em;
	
	}
	
	
	
	
	
	/*************** 버튼 ***************//
	.celeb_btn {
		display: flex;
		flex-direction: row;
		justify-content: center;
	}
	
	.celeb_btn input {
		color: white;
		background-color: black;
	}
	
	.inset_btn {
		font-family: 'Creepster', cursive;

		font-size: 1.9em;
		cursor: pointer;	
	}
	
	.inset_btn:hover {
		color: red;
	}
	
	.rightBtn {
		margin-right: 80px;
	}
	
	.select {
		height: 27px;
	}
	
	
</style>


<link href="https://fonts.googleapis.com/css2?family=Bungee+Shade&family=Creepster&family=East+Sea+Dokdo&family=Gamja+Flower&family=Gugi&family=Jua&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Kirang+Haerang&family=Nosifer&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Press+Start+2P&family=VT323&display=swap" rel="stylesheet">


</head>
<body>
	<c:set var="dto" value="${productCont }" />
	<c:set var="imgs" value="${imgsList }" />
	
	<div class="product_cont_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_products_include.jsp" />
		
		<div class="product_imgs"> 
			<c:forEach items="${imgsList }" var="img2">
				<img alt="" src="./resources/upload/product/${img2}">
			</c:forEach>
		</div> <!-- product_imgs -->
		
		
		<div class="product_cont_container">
			
			<div class="product_cont_div_forCenter">
				
				
				
				<div class="product_cont_detail">
					<div>
						${dto.product_name }
					</div>
					<div>
						수량 : ${dto.product_qty }
					</div>
					<div>
						가격: ${dto.product_price }
					</div>
					<c:if test="${dto.product_size != null }">
						사이즈 : ${dto.product_size }
					</c:if>
					<c:if test="${dto.product_color != null }">
						색상 : ${dto.product_color }
					</c:if>
					<div>
						상세정보 : ${dto.product_detail }
					</div>
					<div>
						마일리지:  ${dto.product_mileage }
					</div>
					<div>
						입고일 : ${dto.product_input.substring(0, 10) }
					</div>
					
				
				</div> <!-- product_cont_detail -->
				
				<div class="celeb_btn">
					<input type="button" value="MODIFY" class="inset_btn"
					onclick="location.href='admin_product_update.do?no=${dto.product_no}'">
					
					<input type="button" value="DELETE" class="inset_btn"
					onclick="if(confirm('상품을 삭제하시겠습니까? :(')){
						location.href='admin_product_delete.do?no=${dto.product_no}&imgs=${dto.product_image }'
					}else{return; }">
					
					<input type="button" value="BACK" class="inset_btn"
					onclick="location.href='admin_products_list.do'">
				</div>
				
				
			</div> <!-- product_cont_div_forCenter -->
			
		</div> <!-- product_cont_container -->
		
	</div> <!-- product_cont_wrapper -->
	


<script type="text/javascript">

		$('.product_imgs').slick({
		  dots: false,
		  infinite: true,
		  speed: 500,
		  fade: true,
		  cssEase: 'linear',
		  autoplay: true,
		  adaptiveHeight: true,
		  arrows: false,
		  pauseOnFocus: true
		 
		  
		});
							

</script>
	
</body>
</html>