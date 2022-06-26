<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
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
	}
	.admin_member_inquiry_cont_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	
	
	
	.inquiry_reply_boxes {
		border: 1px solid gold;
	
	}

</style>

</head>
<body>
<!-- inquiry content -->
<c:set var="idto" value="${iCont }" />
<!-- product List -->
<c:set var="pcont" value="${pdto }" />
<!-- orderList -->
<c:set var="ocont" value="${odto }" />
<!-- product image list -->
<c:set var="plist" value="${pimgsList }" />
<!-- product order list -->
<c:set var="olist" value="${oimgsList }" />
<!-- inquiry group list [reply_list] -->	
<c:set var="glist" value="${gList }" />
<c:set var="imgslit" value="${imgsList }" />
	<div class="admin_member_inquiry_cont_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	
		<div class="admin_member_inquiry_container">
		
			<div>
				<c:forEach items="${imgsList }" var="imgs">
					<img alt="" src="./resources/upload/inquiry_board/${imgs }">
				</c:forEach>
			</div>
		
			<div class="member_inquiry_box">
			
				<c:if test="${!empty pcont.product_no }">
					<div class="member_inquiry_productInfo">
						<c:if test="${pcont.product_no == idto.product_no }">
							<div class="member_inquiry_product">
								<a href="<%=request.getContextPath() %>/admin_product_content.do?no=${idto.product_no}">
									<img alt="" src="./resources/upload/product/${plist[0] }">
									<div>
										상품 이름 : ${pcont.product_name}
									</div>
								</a>
							</div>
						</c:if>
					</div><!-- member_inquiry_productInfo -->
				</c:if>	
				<c:if test="${!empty ocont.order_no }">
					<div class="member_order_orderInfo">
						<c:if test="${ocont.order_no == idto.order_no }">
							<div class="member_inquiry_order">
								<a href="<%=request.getContextPath()%>/admin_order_productCont.do?no=${idto.order_no}">
									<img alt="" src="./resources/upload/product/${olist[0] }">
									<div>
										주문 번호 : ${ocont.order_no} / ${ocont.order_group }
									</div>
								</a>
							</div> <!-- member_inquiry_order -->
							
						</c:if><!-- member_order_productInfo -->
					</div>
				</c:if>
				
				<div>
					<img alt="" src="./resources/upload/member/">
				</div>
				
				<div>
					NO. ${idto.inquiry_no }
				</div>
				<div>
					ID: ${idto.inquiry_userid }
				</div>
				<div>
					CONTENT: ${idto.inquiry_cont }
				</div>
				<div>
					views: ${idto.inquiry_hit }
				</div>
				<div>
					<c:if test="${idto.inquiry_update == null}">
						DATE: ${idto.inquiry_date.substring(0, 10) }
					</c:if>
					<c:if test="${idto.inquiry_update != null}">
						UPDATE: ${idto.inquiry_update.substring(0, 10) }
					</c:if>
				</div>
				<div>
					PRODUCT No. ${idto.product_no }
				</div>
				<div>
					ORDER No. ${idto.order_no }
				</div>
				<div>
					<c:if test="${idto.inquiry_status == '0' }">
						답변대기
					</c:if>
					<c:if test="${idto.inquiry_status == '1' }">
						답변완료
					</c:if>
				</div>
				<div>
					GROUP No. ${idto.inquiry_group }
				</div>
				<div>
					STEP No. ${idto.inquiry_step }
				</div>
				<div>
					INDENT. ${idto.inquiry_indent }
				</div>
				<div>
					<input type="button" value="REPLY"
					onclick="location.href='admin_inquiry_reply.do?no=${idto.inquiry_no}'">
				</div>
			</div> <!-- member_inquiry_box -->
			
			
			<div class="member_inquiry_reply_box">
				<c:forEach items="${glist }" var="gdto">
					<c:if test="${idto.inquiry_no != gdto.inquiry_no }">
					<div class="inquiry_reply_boxes">
						<div>
							No. : ${gdto.inquiry_no }
						</div>
						<div>
							GROUP : ${gdto.inquiry_group }
						</div>
						<div>
							STEP : ${gdto.inquiry_step }
						</div>
						<div>
							ID : ${gdto.inquiry_userid }
						</div>
						<div>
							TITLE: ${gdto.inquiry_title }
						</div>
						<div>
							${gdto.inquiry_cont }
						</div>
						<div>
							<c:if test="${!empty gdto.inquiry_update }">
								${gdto.inquiry_update.substring(0, 10) }
							</c:if>
							<c:if test="${empty gdto.inquiry_update }">
								${gdto.inquiry_date.substring(0, 10) }
							</c:if>
						</div>
						<div>
						<input type="button" value="DOMIFY"
						onclick="#">
						<input type="button" value="DELETE"
						onclick="#">
						</div>
					</div> <!-- inquiry_reply_boxes -->
					</c:if>
				</c:forEach>
			</div> <!-- member_inquiry_reply_box -->
			
		</div> <!-- admin_member_inquiry_container -->
	</div> <!-- admin_member_inquiry_cont_wrapper -->



</body>
</html>