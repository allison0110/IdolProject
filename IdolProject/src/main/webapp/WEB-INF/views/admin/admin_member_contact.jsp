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
		font-family: 'Press Start 2P', 'Jua', monospace;
	}
	
	a {
		text-decoration: none;
		color: white;
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
		width: 80%;
	}
	
	.inquiry_box {
		display: flex;
    	flex-direction: row;
		gap: 20px;
		/*justify-content: center;*/
		margin: 13px 0px;
	}

	.border_radius {
		/*border: 1px solid white;*/
	    border-radius: 30px;
	    background-color: white;
		width: 500px;
		
		
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
    	display: flex;
    	/*display: grid;
    	grid-template-columns: 20% 80%;*/
    	
	}
	
	.member_communi_text {
		flex: 80%;
		max-width: 80%;
		display: flex;
	    flex-direction: column;
	    font-size: 0.8em;
    	justify-content: center;
    	margin: 10px;
	}
	
	
	.content_text {
		font-size: 0.8em;
	}
	.content_title {
		font-weight: bold;
		font-size: 1.3em;
	}
	.content_id {
		
	}
	
	.categoryNshowMore{
		display: flex;
    	justify-content: space-between;
    	margin-top: 30px;
	}
	
	.member_img_box {
		flex: 20%;
		max-width: 20%;
		height: 100%;
		border-radius: 30px;
		overflow: hidden;
	
	}
	
	.member_img {
		width: 100%;
		height: 100%;
		
	}
	
	
	.showAll{
		font-size: 0.9em;
	}
	
</style>
</head>
<body>
<!-- 문의게시판 리스트 -->
<c:set var="ilist" value="${iList }" />
<!-- 문의게시판 카테고리 리스트 -->
<c:set var="iclist" value="${icList }" />
<c:set var="mlist" value="${mList }" />

	<div class="admin_member_contact_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	<jsp:include page="../include/admin_member_include.jsp" />
	
		
		
	<div class="admin_member_contact_container">
	
		<div class="member_inquiry_category">
			<c:forEach items="${iclist }" var="ic"> <!-- 문의게시판 카테고리 리스트 -->
				<div class="categoryNshowMore">
					<div>[${ic.category_iname }]</div> 
					<a href="./resources/upload/member">
						<div class="showAll">Show ALL></div>
					</a>
				</div>
				
				<div class="inquiry_box">
					<c:forEach items="${ilist }" var="i"> <!-- 문의게시판 리스트 -->
						<c:if test="${ic.category_ino == i.category_inofk }"> <!-- c:if 카테고리가 같은  분류 뽑아내기 -->
							<c:if test="${i.inquiry_status == '0' }"> <!-- c:if 답변 대기만 표시하기  -->
								<c:forEach items="${mlist }" var="mdto">
								<c:if test="${mdto.member_id == i.inquiry_userid }">
								<div class="border_radius">
									<a class="member_box_link" href="<%=request.getContextPath()%>/admin_member_inquiryCont.do?no=${i.inquiry_no}
										&pno=${i.product_no}&ono=${i.order_no}&gno=${i.inquiry_group}">
											<div class="member_img_box">
												<img class="member_img" alt="" src="./resources/upload/member_image/${mdto.member_no }/${mdto.member_image}">
											</div>
											<div class="member_communi_text">
												<c:if test="${i.inquiry_indent > 0 }">
													<c:forEach begin="1" end="${i.inquiry_indent }">
														 <div class="content_title"> (RE) ${i.inquiry_title }</div>
													</c:forEach>
												</c:if>
												<c:if test="${i.inquiry_indent == 0 }">
													<div class="content_title">${i.inquiry_title }</div>	
												</c:if>
												<div class="content_id">${i.inquiry_userid }</div>
													
												<div class="content_text">${i.inquiry_cont }</div>		
											</div>
										</a> <!-- member_box_link -->
									</div> <!-- border_radius -->
								</c:if>
							</c:forEach>
							</c:if><!-- 답변 대기만 표시하기  -->
						</c:if> <!-- c:if 카테고리가 같은  분류 뽑아내기 -->
					</c:forEach> <!-- 문의게시판 리스트 -->
				</div> <!-- inquiry_box -->
			</c:forEach> <!-- 문의게시판 카테고리 리스트 -->
		</div> <!-- member_inquiry_category -->	
		
		
		
	
		<div class="member_inquiry_category">
			<div class="categoryNshowMore">
				<div style="color:gold">[답변완료] </div>
				<a href="#">
					<div class="showAll">Show ALL></div>
				</a>
			</div>
			<div class="inquiry_box"> 
				<c:forEach items="${ilist }" var="i"> <!-- 문의게시판 리스트 -->
				<c:if test="${i.inquiry_status == '1' && i.inquiry_step == '0' }"> <!-- c:if 답변 완료만 뽑아내기 -->
					<c:forEach items="${mlist }" var="mdto">
					<c:if test="${mdto.member_id == i.inquiry_userid }">
					<div class="border_radius">
						<a class="member_box_link" href="<%=request.getContextPath()%>/admin_member_inquiryCont.do?no=${i.inquiry_no}
							&pno=${i.product_no}&ono=${i.order_no}&gno=${i.inquiry_group}">
							<div class="member_img_box">
								<img class="member_img" alt="" src="./resources/upload/member_image/${mdto.member_no }/${mdto.member_image}">
							</div>
							<div class="member_communi_text">
								<div class="content_title">${i.inquiry_title }</div>
								<div class="content_id">${i.inquiry_userid }</div>
								<div class="content_text">${i.inquiry_cont }</div>
							</div>
						</a> <!-- member_box_link -->
					</div> <!-- border_radius -->
					</c:if>
				</c:forEach>
				</c:if> <!-- c:if 답변 완료만 뽑아내기 -->
			</c:forEach> <!-- 문의게시판 리스트 -->
			</div> <!-- inquiry_box -->
	
		</div>	<!-- member_inquiry_category -->
		
	</div> <!-- admin_member_contact_container -->
			
		
	</div> <!-- admin_member_contact_wrapper -->
	
	



</body>
</html>