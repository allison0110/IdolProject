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
                <c:set var="commentlist" value="${commentList}"/>  
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
                        <i class="fa-solid fa-comment"></i>&nbsp; ${commentCount } &nbsp;&nbsp;&nbsp;&nbsp;
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
                        <i class="fa-solid fa-comment"></i>&nbsp;${commentCount } &nbsp;&nbsp;&nbsp;&nbsp;
                        </div>
                        <div class="UpdateAndDelete">
                        	<button type="button" id="updateBtn" class="btn btn-outline-secondary">수정</button>
                        	<button type="button" id="deleteBtn" class="btn btn-outline-secondary">삭제</button>
                        </div>
                    </div>

                    <div class="formContainer">
                    <form method="post" action="<%=request.getContextPath()%>/community_commentWrite.do" onsubmit="return submitCheck();">
                        <div class="input-group">
                            <span class="input-group-text">${loginInfo.member_id }</span>
                            <textarea class="form-control"  rows="1" aria-label="With textarea" placeholder="댓글을 남겨보세요"
                            name="comment_cont"></textarea>
                            <button type="submit" class="btn btn-outline-secondary">댓글입력</button>
                        </div>
                        <input type="hidden" name="comment_writer" value="${loginInfo.member_id }">
                        <input type="hidden" name="community_nofk" value="${boardCont.community_no }">
                        <input type="hidden" name="category_cnofk" value="${boardCont.category_cnofk }">
                    </form>
                    </div>

                    <div class="commentCount">
                       			 댓글 ${commentCount }
                    </div>
                    
                    <!-- 댓글 출력구간 -->
                    <c:if test="${!empty commentlist }">
                    <c:forEach items="${commentlist}" var="cdto">
                    <form method="post" action="<%=request.getContextPath()%>/community_replyWrite.do" onsubmit="return replyCheck();">
                    <div class="comment">
                    	<c:if test="${cdto.comment_writer == writerInfo.member_id}">
                        <p class="commentUser">${cdto.comment_writer}&nbsp;&nbsp; <span style="color:red">작성자</span> </p>
                        </c:if>
                        
                        <c:if test="${cdto.comment_writer != writerInfo.member_id}">
                        <p class="commentUser">${cdto.comment_writer}</p>
                        </c:if>
                        
                        <p class="commentdetail">${cdto.comment_cont}</p>
                        <div class="commentBottom">
                        	<c:if test="${empty cdto.comment_update }">
                            <div class="commentInfo"><i class="fa-solid fa-clock"></i>&nbsp;${cdto.comment_date}작성</div>
                            </c:if>
                            <c:if test="${!empty cdto.comment_update }">
                            <div class="commentInfo"><i class="fa-solid fa-clock"></i>&nbsp;${cdto.comment_update}수정</div>
                            </c:if>
                            <div class="commentbtnGroup">
                            	<!-- 댓글 작성자 로그인한 유저와 댓글을 단 유저가 같으면 수정 삭제버튼을 보이게 처리한다.-->
                            	<input type="hidden"  class="commentWriter" value="${cdto.comment_writer}">
                                <button type="button" class="btn btn-outline-secondary comment-up">수정</button>
                                <button type="button" class="btn btn-outline-secondary comment-del">삭제</button>
                                <button type="button" class="btn btn-outline-secondary comment-reply">답글</button>
                            </div>
                        </div>
                        <!-- 대댓글 컨트롤러 로직 수행시 입력될 파라메터 -->
                        <input type="hidden"  name="comment_writer" value="${loginInfo.member_id }">
                        <input type="hidden"  name="comment_group" value="${cdto.comment_group}">
                        <input type="hidden"  name="comment_step" value="${cdto.comment_step}">
                        <input type="hidden"  class="comment_indent" name="comment_indent" value="${cdto.comment_indent}">
                        <input type="hidden"  name="community_nofk" value="${cdto.community_nofk}">
                        <input type="hidden"  name="category_cnofk" value="${cdto.category_cnofk}">
                        <div class="comment-input-group">
                            <span class="input-group-text">${loginInfo.member_id }</span>
                            <textarea class="form-control"  rows="1" aria-label="With textarea" name="comment_cont"></textarea>
                            <button type="submit" class="btn btn-outline-secondary">답글입력</button>
                        </div>
                    </div>
                    </form>
                    </c:forEach>
                    </c:if>

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