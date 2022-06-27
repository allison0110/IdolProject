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
	
	
	.admin_member_contact_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	
	
	
	.member_contact_wrapper {
		display: flex;
	    flex-direction: column;
	    row-gap: 17px;
	
	}
	.member_box_link {
		text-decoration: none;
		color: white;
		width: 100%;
	}
	.member_contact_box {
		border:1px solid pink;
		display: flex;
		flex-direction: row;
		height: 77px;
    	width: 100%;
    	justify-content: space-evenly;
	}
	
	.member_inquiry_category {
		border: 1px solid gold;
		color: white;
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
		<div class="admin_member_contact_container">
		
			<div class="member_contact_wrapper">
			
			<c:forEach items="${iclist }" var="ic"> <!-- 문의게시판 카테고리 리스트 -->
				<div class="member_inquiry_category">
					${ic.category_ino }. [${ic.category_iname }]
					<c:forEach items="${ilist }" var="i"> <!-- 문의게시판 리스트 -->
						<c:if test="${ic.category_ino == i.category_inofk }"> <!-- c:if 카테고리가 같은  분류 뽑아내기 -->
							<c:if test="${i.inquiry_status == '0' }"> <!-- c:if 답변 대기만 표시하기  -->
								<a class="member_box_link" href="<%=request.getContextPath()%>/admin_member_inquiryCont.do?no=${i.inquiry_no}
									&pno=${i.product_no}&ono=${i.order_no}&gno=${i.inquiry_group}">
									<div class="member_contact_box">
										<div class="img">
											
										</div>
										<div>
											NO. ${i.inquiry_no }
										</div>
										<div>
											<c:if test="${!empty i.inquiry_indent }">
												<c:forEach begin="1" end="${i.inquiry_indent }">
													  ㄴ(임시)
												</c:forEach>
											</c:if>
										</div>
										<div>
											TITLE: ${i.inquiry_title }
										</div>
										<div>
											WRITER: ${i.inquiry_userid }
										</div>
										<div>
											${i.inquiry_cont }
										</div>
										<div>
											HITS: ${i.inquiry_hit }
										</div>
										<div style="color:gold">
											<c:if test="${empty i.inquiry_update }">
												${i.inquiry_date.substring(0, 10) }
											</c:if>
											<c:if test="${!empty i.inquiry_update }">
												${i.inquiry_update.substring(0, 10) }
											</c:if>
										</div>
										
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
										<div>
											GROUP: ${i.inquiry_group }
										</div>
										<div>
											STEP: ${i.inquiry_step }
										</div>
										<div>
											IDENT: ${i.inquiry_indent }
										</div>
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
									</div> <!-- member_contact_box -->
								</a> <!-- member_box_link -->
							</c:if><!-- 답변 대기만 표시하기  -->
						</c:if> <!-- c:if 카테고리가 같은  분류 뽑아내기 -->
					</c:forEach> <!-- 문의게시판 리스트 -->
				</div> <!-- member_inquiry_category -->
			</c:forEach> <!-- 문의게시판 카테고리 리스트 -->
			
			<div class="admin_inquiry_replyOk">
				<span style="color:gold">답변완료 </span>
 			<c:forEach items="${ilist }" var="i"> <!-- 문의게시판 리스트 -->
				<c:if test="${i.inquiry_status == '1' && i.inquiry_step == '0' }"> <!-- c:if 답변 완료만 뽑아내기 -->
					<a class="member_box_link" href="<%=request.getContextPath()%>/admin_member_inquiryCont.do?no=${i.inquiry_no}
						&pno=${i.product_no}&ono=${i.order_no}&gno=${i.inquiry_group}">
						<div class="member_contact_box">
							<div class="img">
								
							</div>
							<div>
								NO. ${i.inquiry_no }
							</div>
							<div>
								<c:if test="${!empty i.inquiry_indent }">
									<c:forEach begin="1" end="${i.inquiry_indent }">
										  ㄴ(임시)
									</c:forEach>
								</c:if>
							</div>
							<div>
								TITLE: ${i.inquiry_title }
							</div>
							<div>
								WRITER: ${i.inquiry_userid }
							</div>
							<div>
								${i.inquiry_cont }
							</div>
							<div>
								HITS: ${i.inquiry_hit }
							</div>
							<div style="color:gold">
								<c:if test="${empty i.inquiry_update }">
									${i.inquiry_date.substring(0, 10) }
								</c:if>
								<c:if test="${!empty i.inquiry_update }">
									${i.inquiry_update.substring(0, 10) }
								</c:if>
							</div>
							
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
							<div>
								GROUP: ${i.inquiry_group }
							</div>
							<div>
								STEP: ${i.inquiry_step }
							</div>
							<div>
								IDENT: ${i.inquiry_indent }
							</div>
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
						</div> <!-- member_contact_box -->
					</a> <!-- member_box_link -->
				</c:if> <!-- c:if 답변 완료만 뽑아내기 -->
			</c:forEach> <!-- 문의게시판 리스트 -->
			</div> <!-- admin_inquiry_replyOk -->
			
				
				
			</div> <!-- member_contact_wrapper -->
		</div> <!-- admin_member_contact_container -->
	</div> <!-- admin_member_contact_wrapper -->
	
	



</body>
</html>