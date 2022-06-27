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
	}
	
	.member_cont_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
	}
	.member_img {
		width: 300px;
		height: 300px;
	}
	.member_content img {
		width: 100%;
		height: 100%;
	}
	
	
	
	.member_inquiry_box ul{
		display: flex;
		border: 1px solid blue;
	    flex-direction: row;
	    width: 800px;
		justify-content: space-around;
	}
</style>
</head>
<body>
<c:set var="mdto" value="${mdto }" />
<c:set var="mceleb" value="${celebs }" />

<c:set var="orderlist" value="${orderList }" />

<c:set var="usedlist" value="${usedList }" />
<c:set var="usedCommlist" value="${usedCommList }" />
<c:set var="usedCategory" value="${used_category }" />

<c:set var="commlist" value="${commList }" />
<c:set var="commCommlist" value="${commCommList }" />
<c:set var="commCategory" value="${comm_category }" />

<c:set var="inquirylist" value="${inquiryList }" />
<c:set var="inquiryCategory" value="${inquiry_category }" />

<c:set var="celeblist" value="${celebList }" />
<c:set var="grouplist" value="${groupList }" />


	<div class="member_cont_wrapper">
	
	<jsp:include page="../include/admin_top_include.jsp" />
	
		<div class="member_cont_container">
		
			<div class="member_content">
			
				<div class="member_img">
					<img alt="" src="./resources/upload/member_image/${mdto.member_no }/${mdto.member_image} ">
				</div>
				<div>
				[MEMBER INFO]
				</div>
				<div>
				No. ${mdto.member_no }
				</div>
				<div>
				ID: ${mdto.member_id }
				</div>
				<div>
				이름: ${mdto.member_name }
				</div>
				<div>
				성별 : ${mdto.member_gender }
				</div>
				<div>
				이메일 : ${mdto.member_email }
				</div>
				<div>
				폰 번호 : ${mdto.member_phone }
				</div>
				<div>
				생일 : ${mdto.member_dateofbirth.substring(0, 10) }
				</div>
				<div>
				주소 : ${mdto.member_address }
				</div>
				<div>
				가입일 : ${mdto.member_join_date }
				</div>
				<div>
				<c:if test="${!empty mdto.member_update }">
				수정일 : ${mdto.member_update }
				</c:if>
				<c:if test="${empty mdto.member_update }">
				</c:if>
				</div>
				<div>
				CELEB : ${mdto.member_favorite_celeb }
				</div>
				<div>
				INTRODUCTION : ${mdto.member_introduction }
				</div>
			</div> <!-- member_content -->
			
			<div class="member_favorite_celeb">
			<div>
			[FAVORITE CELEB]
			</div>
				<c:forEach items="${celeblist }" var="c">
					<c:forEach items="${celebs }" var="mc">
						<c:if test="${c.celeb_no == mc }">
							<c:if test="${c.celeb_group != 'solo' }">
								<div>
								<a href="<%=request.getContextPath()%>/admin_groupMember_list.do?gName=${c.celeb_group}">
									${c.celeb_group }
								</a>
								</div>
							</c:if>
							<c:if test="${c.celeb_group == 'solo' }">
								<div>
								<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${c.celeb_no}">
									${c.celeb_name }
								</a>
							</div>
							</c:if>
							
						</c:if>
					</c:forEach>
				</c:forEach>
			</div>
			
			
			
			<div class="member_inquiry">
			
			<div>
			[INQUIRY BOARD]
			</div>
			
			<c:forEach items="${inquiryCategory}" var="icate">
				<div class="member_inquiry_category_box">
				${icate.category_ino }. [${icate.category_iname }]
					<c:forEach items="${inquirylist }" var="i">
						<c:if test="${icate.category_ino == i.category_inofk}">
							<c:if test="${i.inquiry_status =='0' }">
								<div class="member_inquiry_box">
								<a href="<%=request.getContextPath() %>/admin_member_inquiryCont.do?no=${i.inquiry_no}">
									<ul>
										<li>
											No. ${i.inquiry_no }
										</li>
										<li>
											ID : ${i.inquiry_userid }
										</li>
										<li>
											TITLE: ${i.inquiry_title }
										</li>
										<li>
											CONTENT : ${i.inquiry_cont }
										</li>
										<li>
											<c:if test="${!empty i.inquiry_update }">
												${i.inquiry_update.substring(0, 10) }
											</c:if>
											<c:if test="${empty i.inquiry_update }">
												${i.inquiry_date.substring(0, 10) }
											</c:if>
										</li>
										<li>
											<c:if test="${i.inquiry_status == '0' }">
												답변 대기
											</c:if>
											<c:if test="${i.inquiry_status == '1' }">
												답변 완료
											</c:if>
										</li>
										<li>
											STEP: ${i.inquiry_step }
										</li>
										<li>
											GROUP : ${i.inquiry_group }
										</li>		
									</ul>
								</a>
								</div> <!-- member_inquiry_box -->
							</c:if>
						</c:if>
					</c:forEach>
				</div>
			</c:forEach>
			<div>
			[답변완료]
			</div>
			<c:forEach items="${inquirylist }" var="i">
				<c:if test="${i.inquiry_status =='1' }">
					<div class="member_inquiry_box">
						<ul>
							<li>
								No. ${i.inquiry_no }
							</li>
							<li>
								ID : ${i.inquiry_userid }
							</li>
							<li>
								TITLE: ${i.inquiry_title }
							</li>
							<li>
								CONTENT : ${i.inquiry_cont }
							</li>
							<li>
								<c:if test="${!empty i.inquiry_update }">
									${i.inquiry_update.substring(0, 10) }
								</c:if>
								<c:if test="${empty i.inquiry_update }">
									${i.inquiry_date.substring(0, 10) }
								</c:if>
							</li>
							<li>
								<c:if test="${i.inquiry_status == '0' }">
									답변 대기
								</c:if>
								<c:if test="${i.inquiry_status == '1' }">
									답변 완료
								</c:if>
							</li>
							<li>
								<c:forEach items="${inquiryCategory}" var="icate">
									<c:if test="${icate.category_ino == i.inquiry_no}">
										${icate.category_iname }
									</c:if>
								</c:forEach>
							</li>
							<li>
								STEP: ${i.inquiry_step }
							</li>
							<li>
								GROUP : ${i.inquiry_group }
							</li>		
						</ul>
					</div>
				</c:if>
			</c:forEach>
			</div> <!-- member_inquiry -->
			
			
			
			
		</div> <!-- member_cont_container -->
		
		
	</div> <!-- member_cont_wrapper -->
	


</body>
</html>