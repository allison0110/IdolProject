<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADMIN MEMBER CONTENT</title>

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
<!-- 멤서 상세 내용 및 맴버가 좋아하는 셀럽 리스트 -->
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
				<c:if test="${!empty mdto.member_introduction }">
				INTRODUCTION : ${mdto.member_introduction }
				</c:if>
				<c:if test="${empty mdto.member_introduction }">
				[아직 자기소개가 없습니다.]
				</c:if>
				</div>
			</div> <!-- member_content -->
			
		<div class="member_favorite_celeb">
			
			<div>
			[FAVORITE CELEB]
			</div>
			
			<c:if test="${!empty celebs}">
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
			</c:if>
			<c:if test="${empty celebs }">
				[좋아하는 셀럽이 아직 없습니다 :( ]
			</c:if>
		</div> <!-- member_favorite_celeb -->
			
			
			
		<div class="member_inquiry_wrapper">
			
			<div>
			[INQUIRY BOARD]
			</div>
			
			<c:if test="${!empty inquirylist }">
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
			</c:if>
			<c:if test="${empty inquirylist }">
				THERE ARE NO AVAILABLE DATA...
			</c:if>
			
			
			
			<c:if test="${!empty inquirylist }">
			<div>
			[답변완료]
			</div>
			<c:forEach items="${inquirylist }" var="i">
				<c:if test="${i.inquiry_status =='1' }">
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
						</a>
					</div>
				</c:if>
			</c:forEach>
			</c:if>
			<c:if test="${empty inquirylist }">
			<div>이 멤버의 문의 게시글이 없습니다.</div>
			</c:if>
		</div> <!-- member_inquiry -->
		
			
		<div class="community_board_wrapper">
			<div>
			[COMMUNITY BOARD]
			</div>
			<c:if test="${!empty commlist }">
				<c:forEach items="${commCategory }" var="comCate">
					<div class="member_commnuity_container" style="border:1px solid black">
					<span>${comCate.category_cno }. [${comCate.category_cname }]</span>
							<c:forEach items="${commlist }" var="comdto">
								<c:if test="${comdto.category_cnofk == comCate.category_cno }">
									<div class="member_community_boxes" style="border:1px solid red">
										<div>
											${comdto.community_no }
										</div>
										<div>
											${comdto.community_userid }
										</div>
										<div>
											${comdto.community_title }
										</div>
										<div>
											${comdto.community_cont }
										</div>
										<div>
											${comdto.community_hit }
										</div>
										<c:if test="${comdto.community_update != null }">
											<div>
												${comdto.community_update.substring(0, 10) }
											</div>
										</c:if>
										<c:if test="${comdto.community_update == null }">
											<div>
												${comdto.community_date.substring(0, 10) }
											</div>
										</c:if>
										<div>
											${comdto.community_recommend }
										</div>
									</div> <!-- member_community_boxes -->
								</c:if>
							</c:forEach>
						</div> <!-- member_commnuity_container -->
				</c:forEach>
			</c:if>
			<c:if test="${empty commlist }">
				<span>아직 커뮤니티 게시판 첫글을 작성하지 않았습니다.</span>
			</c:if>
			
			
			<div style="color: blue">[커뮤니티 게시판 댓글]</div>
			<c:if test="${!empty commCommlist }">
				<c:forEach items="${commCategory }" var="cCate">
					<div class="member_commu_reply_boxes">
					<span>${cCate.category_cno }. [${cCate.category_cname }]</span>
						<c:forEach items="${commCommlist }" var="ccdto">
							<c:if test="${ccdto.category_cnofk == cCate.category_cno}">
								<div class="member_comm_reply_box" style="border: 2px solid red">
									<div>
										No. ${ccdto.comment_no }
									</div>
									<div>
										작성자: ${ccdto.comment_writer }
									</div>
									<div>
										내용: ${ccdto.comment_cont }
									</div>
									<div>
										<c:if test="${!empty ccdto.comment_update }">
											작성일: ${ccdto.comment_update.substring(0, 10) }
										</c:if>
										<c:if test="${empty ccdto.comment_update }">
											수정일: ${ccdto.comment_date.substring(0, 10) }
										</c:if>
									</div>
									<div>
										그룹: ${ccdto.comment_group }
									</div>
									<div>
										스탭: ${ccdto.comment_step }
									</div>
									<div>
										indent: ${ccdto.comment_indent }
									</div>
									
								</div>
							</c:if>
						</c:forEach>
					</div> <!-- member_commu_reply_boxes -->
				</c:forEach>
			</c:if>
			<c:if test="${empty commCommlist }">
				<div>아직 첫 게시판 댓글이 없습니다.</div>
			</c:if>
		</div>	<!-- community_board_wrapper -->
			
			
			
			
			
			
	</div> <!-- member_cont_container -->
		
		
	</div> <!-- member_cont_wrapper -->
	


</body>
</html>