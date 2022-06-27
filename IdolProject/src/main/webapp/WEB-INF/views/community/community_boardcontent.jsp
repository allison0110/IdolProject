<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 상세정보페이지</title>
    <script src="https://kit.fontawesome.com/3de1cbcb05.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<script src="//cdn.jsdelivr.net/npm/sweetalert2@11"></script>
	<link rel="stylesheet" href="css/community_boardcontent.css">
</head>
<body>
<%@include file="../include/user_top.jsp" %>
	    <div id="wrap">
        <div id="container">
            <div id="content">
                <!-- 게시물 상세내용 -->
                <div id="leftContent">     
                <c:set var="clist" value="${cList}"/>  
                <c:set var="mlist" value="${mList}"/>  
                <input type="hidden" id="loginId" value="${loginInfo.member_id }">
                <input type="hidden" id="writerId" value="${boardCont.community_userid }">
                <input type="hidden" id="bno" value="${boardCont.community_no }">
                    <div class="topic">
                                           
                        <c:if test="${!empty clist}">
                        	<c:forEach items="${clist }" var="cdto">
                        		<c:if test="${cdto.category_cno == boardCont.category_cnofk }">
                        			<span>토픽</span> &nbsp;&nbsp;>&nbsp;&nbsp; 
                        			<span>
                        			 <a href="<%=request.getContextPath()%>/community_topicList.do?cno=${cdto.category_cno}">
                        			 	${cdto.category_cname }
                        			 </a>
                        			</span>
                        		</c:if>
                        	</c:forEach>
                        </c:if>
                        
                    </div>

                    <div class="title">
                        <h3>${boardCont.community_title }</h3>
                    </div>

                    <div class="user">
                    	<c:if test="${!empty writerInfo.member_nickname }">
                        ${writerInfo.member_id } | ${writerInfo.member_nickname }
                        </c:if>
                        <c:if test="${empty writerInfo.member_nickname }">
                        ${writerInfo.member_id } 
                        </c:if>
                    </div>

                    <div class="info1">
                    	<c:if test="${empty boardCont.community_update }">
                        <i class="fa-solid fa-clock"></i>&nbsp;작성일:${boardCont.community_date.substring(0,10) }&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                        <c:if test="${!empty boardCont.community_update }">
                        <i class="fa-solid fa-clock"></i>&nbsp;수정일:${boardCont.community_update.substring(0,10) }&nbsp;&nbsp;&nbsp;&nbsp;
                        </c:if>
                        <i class="fa-solid fa-eye"></i>&nbsp;${boardCont.community_hit } &nbsp;&nbsp;&nbsp;&nbsp;
                        <i class="fa-solid fa-comment"></i>&nbsp;댓글 &nbsp;&nbsp;&nbsp;&nbsp;
                    </div>
                   
                    <div class="borderLine"></div>

                    <div class="detail">
                        	${boardCont.community_cont }
                    </div>
                    
                    
					<c:if test="${!empty mlist }">
					<c:forEach items="${mlist}" var="mdto">
						<div class="imgBox">
                        	<img src="community/${mdto}" alt="게시글이미지">
                   		</div>
					</c:forEach>
					</c:if>
                    

                    <div class="info2">
                    	<div class="HitandComment">
                        <i class="fa-solid fa-thumbs-up"></i>&nbsp;${boardCont.community_recommend } &nbsp;&nbsp;&nbsp;&nbsp;
                        <i class="fa-solid fa-comment"></i>&nbsp;댓글 &nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="UpdateAndDelete">
                        	<button type="button" id="updateBtn" class="btn btn-outline-secondary">수정</button>
                        	<button type="button" id="deleteBtn" class="btn btn-outline-secondary">삭제</button>
                        </div>
                    </div>

                    <div class="borderLine"></div>

                                     
                    <div class="formContainer">
                    <form action="">
                        <div class="input-group">
                        	<c:if test="${!empty loginInfo }">
                            <span class="input-group-text">${loginInfo.member_id }</span>
                            </c:if>
                            <c:if test="${empty loginInfo }">
                            <span class="input-group-text">로그인필요</span>
                            </c:if>
                            
                            <textarea class="form-control"  rows="1" aria-label="With textarea" placeholder="댓글을 남겨보세요"></textarea>
                            <button type="button" class="btn btn-outline-secondary">댓글입력</button>
                        </div>
                    </form>
                    </div>

                    <div class="commentCount">
                       			 댓글 0
                    </div>

                    <div class="comment">
                        <p class="commentUser">hong 홍길동</p>
                        <p class="commentdetail">홍길동님이 임시댓글을 남기셨습니다.</p>
                        <p class="commentInfo"><i class="fa-solid fa-clock"></i>&nbsp;날짜</p>
                    </div>

                    <div class="comment-reply">
                        <p class="comment-replyUser">hong 홍길동</p>
                        <p class="comment-replydetail">홍길동님이 임시대댓글을 남기셨습니다.</p>
                        <p class="comment-replyInfo"><i class="fa-solid fa-clock"></i>&nbsp;날짜</p>
                    </div>

                    <div class="comment">
                        <p class="commentUser">hong 홍길동</p>
                        <p class="commentdetail">홍길동님이 임시댓글을 남기셨습니다.</p>
                        <p class="commentInfo"><i class="fa-solid fa-clock"></i>&nbsp;날짜</p>
                    </div>

                </div> <!-- leftContent end --> 


                <!-- 유저랭킹 or 인기게시물 순위 -->
                <div id="rightContent">

                </div>
            </div> <!-- contnet -->
        </div>
    </div>  
	
<%@include file="../include/user_bottom.jsp" %>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script type="text/javascript" src="js/community_boardcontent.js"></script>
</body>
</html>