<%@page import="com.idol.model.CelebDTO"%>
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
<title>ADMIN GROUP LIST</title>
<style type="text/css">
	html, body {
		padding: 0px;
		margin: 0px;
		height: 100%;
		background-color: black;
	}
	
	li {
		list-style-type: none;
		
	}
	
	a {
		text-decoration: none;
	}
	
	.admin_group_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		
	}
	
	.admin_group_Container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
		color: white;
	}

	.admin_group_boxes {
		border: 2px solid red;
		width: 200px;
		height: 200px;
		color: white;
		background-color: white;
	}
	
	.group_img {
		width: 100%;
		height: 100%;
	}
	
	.group_name {
		display: none;
	}
	
	
	
	
	.admin_solo_boxes {
		border: 2px solid blue;
		width: 200px;
		height: 200px;
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
	
		<div style="color: white">
			<h2>GROUP</h2>
		</div>
		<div class="admin_group_Container">
			
			<!-- 그룹 파트 -->
			
			<%
				List<GroupDTO> gList = (List<GroupDTO>)request.getAttribute("groupList");
				
			
				for(int i=0; i < gList.size(); i++){
					
					GroupDTO gdto = gList.get(i);
					
					String gimgs = gdto.getGroup_image();
					
					StringTokenizer tokenizer = new StringTokenizer(gimgs, "|");
					
					String[] arrayToekn = new String[tokenizer.countTokens()];
					
					for(int j =0; j < arrayToekn.length; j++ ) {
						arrayToekn[j] = tokenizer.nextToken();
						
					}
				%>
			
				<%if(gdto.getGroup_name().equals("solo")){
					%>
				
				<%}else {%>
					<a class="admin_group_boxes" href="<%=request.getContextPath()%>/admin_groupMember_list.do?gName=<%=gdto.getGroup_name()%>">
						<img class="group_img" alt="" src="./resources/upload/group/<%=arrayToekn[0]%>">
						<div class="group_name"><%=gdto.getGroup_name()%></div>		
					</a>
				
				<%}%>
				
				
			<%}%>
		
			
		</div> <!-- admin_group_Container end -->
		
		
		
		
	</div> <!-- admin_group_wrapper end  -->
	
	
	
</body>
</html>
