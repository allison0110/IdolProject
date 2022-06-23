<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 리스트 페이지</title>
    <script src="https://kit.fontawesome.com/3de1cbcb05.js" crossorigin="anonymous"></script>
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
    <link rel="stylesheet" href="css/community_boardList.css">
</head>
<body>
<%@include file="../include/user_top.jsp" %>
    <div id="wrap">
        <div id="container">
            <div id="topic-container">
                <div id="search-container">
                    <form method="post" action="<%=request.getContextPath()%>/admin_user_search.do">          
                        <div class="input-group mb-3">
                            <button class="btn btn-outline-secondary" type="submit" id="button-addon2">
                                <i class="fa-solid fa-magnifying-glass fa-2x"></i>
                            </button>
                            <input type="text" name="search_keyword" class="search_keyword" required placeholder="관심있는 내용을 검색해 보세요!">
                       </div>
                    </form> 
                </div>
                <c:set var="categorylist" value="${categoryList}"/>
                <c:set var="bestlist" value="${bestList}"/>
                <c:set var="baordlist" value="${baordList}"/>

                <!-- 베스트 게시글 start  -->
                <div class="topit-list-best">
                    <div class="topic-title">
                        <i class="fa-solid fa-crown fa-2x"></i>
                        <h2>베스트 게시글</h2>
                        <div class="view-more">
                            <a href="#">더보기></a>
                        </div>
                    </div>
                    <div class="topic-list">
                    	<c:if test="${!empty bestlist}">
                    	<c:forEach items="${bestlist}" var="bestdto" begin="0" end="4" step="1">
                        <div class="article">
                            <div class="topicAndtitle">
                            <c:forEach items="${categorylist }" var="cdto">
                            <c:if test="${cdto.category_cno == bestdto.category_cnofk }">
                            <span class="topic"><a href="#" class="">${cdto.category_cname}</a></span>
                            </c:if>
                            </c:forEach> 
                            <a href="#" class="article-title">${bestdto.community_title }</a> 
                            </div>
                            <div class="likeAndComment">
                                <a href="#"><i class="fa-solid fa-thumbs-up"></i>${bestdto.community_recommend }</a> 
                                <a href="#" class="#"><i class="fa-solid fa-comment"></i>20</a> 
                            </div>
                        </div>     
                        </c:forEach>
                        </c:if>            
                    </div>
                    
                </div> 
                <!-- 베스트 게시글 end  -->

                <!-- 일반 게시글 start -->
                <c:if test="${!empty categorylist }">
                <c:forEach items="${categorylist}" var="cdto">
                <div class="topit-list-topic">
                    <div class="topic-title">
                        <i class="${cdto.category_icname}"></i>
                        <h2>${cdto.category_cname}</h2>
                        <div class="view-more">
                            <a href="#">더보기></a>
                        </div>
                    </div>
                    <c:if test="${!empty baordlist}">
                    <c:forEach items="${baordlist}" var="boarddto" varStatus="status" step="1" >
                    <c:if test="${boarddto.category_cnofk == cdto.category_cno }">
                    <div class="topic-list">
                        <div class="article">
                            <div class="topicAndtitle">
                            <!-- <span class="topic"><a href="#" class="">TV·연예</a></span>  -->
                            <a href="#" class="article-title">${boarddto.community_title }</a> 
                            </div>
                            <div class="likeAndComment">
                                <a href="#"><i class="fa-solid fa-thumbs-up 0.5x"></i>${boarddto.community_recommend }</a> 
                                <a href="#" class="#"><i class="fa-solid fa-comment fa-0.5x"></i>20</a> 
                            </div>
                        </div>
                    </div>
                    </c:if>
                    </c:forEach>
                    </c:if>
                </div>
                </c:forEach>
                </c:if>
                <!-- 일반 게시글 end -->
                
                
            </div>




            <div id="ranking-container">

            </div>
        </div>
    </div>  
		
<%@include file="../include/user_bottom.jsp" %>
</body>
</html>