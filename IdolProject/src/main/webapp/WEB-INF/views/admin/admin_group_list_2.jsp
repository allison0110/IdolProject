<%@page import="java.util.StringTokenizer"%>
<%@page import="com.idol.model.GroupDTO"%>
<%@page import="java.util.List"%>
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
	
	.admin_group_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
		
	}
	
	.admin_group_Container {
		display: flex;
		flex-direction: column;
		color: white;
		
	}
	
	li {
		list-style-type: none;
		
	}
	
	a {
		text-decoration: none;
	}
	
	.admin_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	    flex: 50%;
	    
	}
	
	
	
	
	
	.admin_solo_boxes {
		border: 2px solid blue;
		width: 200px;
		height: 200px;
		color: white;
	}
	
	.admin_group_boxes {
		border: 2px solid red;
		width: 300px;
		height: 270px;
		color: white;
		display: flex;
		flex-direction: column;
	}
	
	.group_img_box {
		background-size: cover;
		/*border-bottom: 1px solid gray;*/
		overflow: hidden;
		flex: 83%;
		
	}
	.group_img_box img{
		width: 100%;
		height: 100%;
	}
	
	.admin_group_name {
		flex: 17%;
		color: white;
	}
</style>
</head>
<body>
	<c:set var="glist" value="${groupList }" />
	<c:set var="slist" value="${soloList }" />
	
	<div class="admin_group_wrapper">
		
		<jsp:include page="../include/admin_top_include.jsp" />
		<jsp:include page="../include/admin_group_include.jsp" />
	
		<div class="admin_group_Container">
			
			<!-- 그룹 파트 -->
			
			<div>
				<h2>GROUP MUSICAN</h2>
			</div>
			<div class="admin_container">
			
			<%
			System.out.println("==============grou list================");

			List<GroupDTO> list = (List<GroupDTO>)request.getAttribute("groupList");
				
			
			for(int i=0; i < list.size(); i++){
				
				GroupDTO dto = list.get(i);
				
				String imgs = dto.getGroup_image();
				
				
				StringTokenizer tokenizer = new StringTokenizer(imgs, "|");
				
				String[] arrayToekn = new String[tokenizer.countTokens()];
				
				
				for(int j =0; j < arrayToekn.length; j++ ) {
					arrayToekn[j] = tokenizer.nextToken();
					
				}
			%>
				
				<div class="admin_group_boxes">
					<a href="<%=request.getContextPath()%>/admin_groupMember_list.do?gName=<%=dto.getGroup_name()%>">
						<div class="group_img_box">
							<img alt="" src="./resources/upload/group/<%= arrayToekn[0] %>">
						</div>
						<div class="admin_group_name">
							<%=dto.getGroup_name() %>
						</div>
					</a>
				</div><!-- admin_group_boxes -->
				
			<%}%>
			
			
			</div> <!-- admin_container end -->
			
			
			
			
			<!-- 솔로 가수 파트 -->
			
			<div>
				<h2>SOLO MUSICAN</h2>
			</div>
			<div class="admin_container">
				<c:forEach items="${slist }" var="sdto">
					<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${sdto.celeb_no}">
						<div class="admin_solo_boxes">
							<ul>
								<li>
									<label> 이름 : </label>${sdto.celeb_name }
								</li>
								
							</ul>
						</div>
					</a>
				</c:forEach>
			
			
			</div> <!-- admin_solo_container end -->
			
		</div> <!-- admin_group_Container end -->
		
		
		
	</div> <!-- admin_group_wrapper end  -->
	
	
	
</body>
</html>
