<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN MEMBER CONTACT</title>
<style type="text/css">

	html, body {
		padding: 0px;
		margin: 0px;
		height: 100%;
		background-color: black;
	}
	
	.admin_member_contact_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}

	.admin_member_contact_container {
		display: flex;
	    flex-direction: column;
	    row-gap: 17px;
		/*border: 1px solid gold;*/
		align-items: center;
	}
	
	
	.member_inquiry_category {
		/*border: 1px solid gold;*/
		color: white;
	}
	
	.inquiry_box {
		display: flex;
    	flex-direction: row;
		gap: 20px;
		/*justify-content: center;*/
		margin: 13px 0px;
	}

	/* a tag */
	.member_box_link {   
		text-decoration: none;
		color: black;
		width: 100%;
		/*border-radius: 30px;
		display: flex;
		flex-direction: column;*/
		height: 77px;
    	width: 100%;
    	display: grid;
    	grid-template-columns: 20% 80%;

	}
	
	.member_communi_text {
		display: flex;
	    flex-direction: column;
	    font-size: 0.8em;
	}
	
	
	
	
	.border_radius {
		/*border: 1px solid white;*/
	    border-radius: 30px;
	    background-color: white;
		width: 500px;
	}
	
	
</style>
</head>
<body>
<!-- 문의게시판 리스트 -->
<c:set var="ilist" value="${iList }" />
<!-- 문의게시판 카테고리 리스트 -->
<c:set var="iclist" value="${icList }" />

	<div class="admin_member_contact_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_member_include.jsp" />
	
	
		
		<div class="admin_member_contact_container">
		
			<div class="member_inquiry_category">
				<c:forEach items="${iclist }" var="ic"> <!-- 문의게시판 카테고리 리스트 -->
					<span>[${ic.category_iname }]</span>
					<div class="inquiry_box">
						<c:forEach items="${ilist }" var="i"> <!-- 문의게시판 리스트 -->
							<c:if test="${ic.category_ino == i.category_inofk }"> <!-- c:if 카테고리가 같은  분류 뽑아내기 -->
								<c:if test="${i.inquiry_status == '0' }"> <!-- c:if 답변 대기만 표시하기  -->
									<div class="border_radius">
									<a class="member_box_link" href="<%=request.getContextPath()%>/admin_member_inquiryCont.do?no=${i.inquiry_no}
										&pno=${i.product_no}&ono=${i.order_no}&gno=${i.inquiry_group}">
											<img alt="" src="">
											<div class="member_communi_text">
												<c:if test="${i.inquiry_indent > 0 }">
													<c:forEach begin="1" end="${i.inquiry_indent }">
														 <span> (RE) ${i.inquiry_title }</span>
													</c:forEach>
												</c:if>
												<c:if test="${i.inquiry_indent == 0 }">
													<span>${i.inquiry_title }</span>	
												</c:if>
												<span>${i.inquiry_userid }</span>
													
												<span>${i.inquiry_cont }</span>		
											</div>
											<!-- 
											<div style="color:gold">
												<c:if test="${empty i.inquiry_update }">
													${i.inquiry_date.substring(0, 10) }
												</c:if>
												<c:if test="${!empty i.inquiry_update }">
													${i.inquiry_update.substring(0, 10) }
												</c:if>
											</div>
											 -->
											
										<!-- 
												<c:if test="${i.inquiry_status == '0' }">
													<div style="color:red">
													답변 대기
													</div>
												</c:if>
												<c:if test="${i.inquiry_status == '1' }">
													<div style="color:gray">
													답변 완료
													</div>
												</c:if>
											 -->
											
											<!-- <div style="color:gold">
												<c:if test="${i.category_inofk =='1'}">
													${i.category_inofk}.취소/환불
												</c:if>
												<c:if test="${i.category_inofk =='2'}">
													${i.category_inofk}.상품문의
												</c:if>
												<c:if test="${i.category_inofk =='3'}">
													${i.category_inofk}.배송
												</c:if>
												<c:if test="${i.category_inofk =='4'}">
													${i.category_inofk}.교환
												</c:if>
												<c:if test="${i.category_inofk =='5'}">
													${i.category_inofk}.기타
												</c:if>
											</div> -->
											
									</a> <!-- member_box_link -->
									</div>
								</c:if><!-- 답변 대기만 표시하기  -->
							</c:if> <!-- c:if 카테고리가 같은  분류 뽑아내기 -->
							
						</c:forEach> <!-- 문의게시판 리스트 -->
					</div> <!-- inquiry_box -->
			</c:forEach> <!-- 문의게시판 카테고리 리스트 -->
		</div> <!-- member_inquiry_category -->	
			
			
			
		
		<div class="member_inquiry_category">
			<span style="color:gold">[답변완료] </span>
			<div class="inquiry_box"> 
 			<c:forEach items="${ilist }" var="i"> <!-- 문의게시판 리스트 -->
				<c:if test="${i.inquiry_status == '1' && i.inquiry_step == '0' }"> <!-- c:if 답변 완료만 뽑아내기 -->
					<div class="border_radius">
					<a class="member_box_link" href="<%=request.getContextPath()%>/admin_member_inquiryCont.do?no=${i.inquiry_no}
						&pno=${i.product_no}&ono=${i.order_no}&gno=${i.inquiry_group}">
						
						<img alt="" src="">
							
							
							<div class="member_communi_text">
								
								<span>${i.inquiry_title }</span>
								
								<span>${i.inquiry_userid }</span>
								<span>${i.inquiry_cont }</span>
							<!-- 
							<div style="color:gold">
								<c:if test="${empty i.inquiry_update }">
									${i.inquiry_date.substring(0, 10) }
								</c:if>
								<c:if test="${!empty i.inquiry_update }">
									${i.inquiry_update.substring(0, 10) }
								</c:if>
							</div>
							 -->
							 <!-- 
								<c:if test="${i.inquiry_status == '0' }">
									<div style="color:red">
									답변 대기
									</div>
								</c:if>
								<c:if test="${i.inquiry_status == '1' }">
									<div style="color:gray">
									답변 완료
									</div>
								</c:if>
							 -->
							 <!-- 
							<div>
								GROUP: ${i.inquiry_group }
							</div>
							<div>
								STEP: ${i.inquiry_step }
							</div>
							<div>
								IDENT: ${i.inquiry_indent }
							</div>
							 -->
							 <!-- 
							<div style="color:gold">
								<c:if test="${i.category_inofk =='1'}">
									${i.category_inofk}.취소/환불
								</c:if>
								<c:if test="${i.category_inofk =='2'}">
									${i.category_inofk}.상품문의
								</c:if>
								<c:if test="${i.category_inofk =='3'}">
									${i.category_inofk}.배송
								</c:if>
								<c:if test="${i.category_inofk =='4'}">
									${i.category_inofk}.교환
								</c:if>
								<c:if test="${i.category_inofk =='5'}">
									${i.category_inofk}.기타
								</c:if>
							</div>
							 -->
						</div>
					</a> <!-- member_box_link -->
					</div>
				</c:if> <!-- c:if 답변 완료만 뽑아내기 -->
			</c:forEach> <!-- 문의게시판 리스트 -->
			</div> <!-- admin_inquiry_replyOk -->

		</div>	
			
		</div> <!-- member_contact_wrapper -->
			
		
	</div> <!-- admin_member_contact_wrapper -->
	
	



</body>
</html>