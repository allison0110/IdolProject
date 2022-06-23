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
		
		.admin_product_insert_container {
			display: flex;
			flex-direction: row;
			justify-content: center;
		
		}
		
		.insert_category_form {
			color: white;
		}
		.insert_category {
			color: white;
		}
		
	
		.insert_product_form{
			color: white;
		}
	
		.product_category_list a{
			text-decoration: none;
			color: white;
		}
		.product_category_list a:hover {
			color: gold;
		}
		
		.product_category_list input {
			width: 73px;
		}
		
		.product_category_list span {
			cursor: pointer;
		}
		
		.product_category_list span:hover {
			color: red;
		}
		
	</style>
	

</head>
<body>

	<c:set var="clist" value="${cList }" />
	<c:set var="pclist" value="${pcList }" />

	<div class="admin_product_insert_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_products_include.jsp" />
	
		<div class="admin_product_insert_container">
			
			<div class="insert_category_form">
				<form method="post" action="<%=request.getContextPath()%>/admin_productCategory_insert_ok.do">
						<h4>카테고리 추가 하기 [임시]</h4>
					<div class="insert_category_no">
						번호 : <input name="category_pno">
					</div>
					<div class="insert_category_name">
						카테고리 네임<input name="category_name">
					</div>
					<div>
						<input type="submit" value="GO!!">
						<input type="reset" value="RESET">
					</div>
				</form>
				<c:if test="${!empty pclist}">
					<div class="product_category_list">
						<div>
							<ul>
								<c:forEach items="${pclist }" var="pcdto">
									<li>
										<a href="<%=request.getContextPath()%>/admin_product_categotry.do?no=${pcdto.category_pno}">
											${pcdto.category_name }</a> <input name="category_name"> <span>수정</span> <span>X</span>
										
									</li>
								</c:forEach>
							</ul>
						</div>
					</div> <!-- product_category_list -->
				</c:if>
				<c:if test="${empty pclist}">
					<h3>THERE ARE NO AVAILABLE ..</h3>
				</c:if>
				
			</div> <!-- insert_category_form -->
			
			
			
			
			
			<div class="insert_product_form">
				<h4>상품 추가 하기 [임시]</h4>
				<form method="post" enctype="multipart/form-data" action="<%=request.getContextPath()%>/admin_product_insert_ok.do">
					<div>
						상품명 :<input name="product_name">
					</div>
					<div>
						CELEB NO :
					
						<select name="celeb_no">	
							<option value="0">
								NONE
							</option>
							<c:forEach items="${clist }" var="c"> 
								<option value="${c.celeb_no }">
									 ${c.celeb_no }. ${c.celeb_name }
								</option>
							</c:forEach>
						</select>
					</div>
					<div>
						수량:<input name="product_qty" type="number" min="1" max="100">
					</div>
					<div>
						가격 :<input name="product_price">
					</div>
					<div>
						사이즈 :<input name="product_size">
					</div>
					<div>
						컬러 :<input name="product_color">
					</div>
					<div>
						설명 : <textarea name="product_detail" rows="20" cols="30"></textarea>
					</div>
					<div>
						마일리지:<input name="product_mileage">
					</div>
					<div>
						입고일 :<input name="product_input" type="date">
					</div>
					<div>
						카테고리 
						<select name="category_pnofk">
							<c:forEach items="${pclist }" var="pcdto">
								<option value="${pcdto.category_pno }">
									${pcdto.category_pno } [${pcdto.category_name }]
								</option>
							</c:forEach>
						</select>
					</div>
					<div>
						<input type="file" multiple="multiple" name="file">
					</div>
					
					<div>
						<input type="submit" value="GO!!">
						<input type="reset" value="RESET">
					
					</div>
					
				</form>
			</div> <!-- insert_product_form -->
			
			
		</div> <!-- admin_product_insert_container -->
	
	
	
	
	
	
	
	
	</div> <!-- admin_product_insert_wrapper -->





 





</body>
</html>