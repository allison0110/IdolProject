<%@page import="com.idol.model.CelebDTO"%>
<%@page import="java.util.StringTokenizer"%>
<%@page import="com.idol.model.GroupDTO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="glist" value="${groupList }" />
	<c:set var="slist" value="${soloList }" />
	
	
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
	
	
	
	li {
		list-style-type: none;
		
	}
	
	a {
		text-decoration: none;
	}
	
	.admin__group_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    gap: 10px;
	    flex: 50%;
	    
	}
	
	
	.admin_group_boxes {
		border: 2px solid red;
		width: 200px;
		height: 300px;
		color: white;
	}
	
	.admin_solo_boxes {
		border: 2px solid blue;
		width: 200px;
		height: 200px;
		color: white;
	}
	
	.group_imgsBoxes {
		
	}
	
	.sort_title {
		color: white;
	}
	
	
</style>
</head>
<body>
	
	
	<div class="admin_group_wrapper">
		
		<jsp:include page="../include/admin_top_include.jsp" />
		<jsp:include page="../include/admin_group_include.jsp" />
	
		<div class="admin_group_Container">
			
			<!-- 그룹 파트 -->
		
			<div class="admin__group_container">
			
				<div class="sort_title">
					<h2>그룹</h2>
				</div>
				
				<%
				
				List<GroupDTO> glist = (List<GroupDTO>)request.getAttribute("groupList");
				
				System.out.println("======= Group List=======");

				System.out.println("list : " + glist);
				
				for(int i =0; i < glist.size(); i++){
					
					GroupDTO gdto = glist.get(i);	
					System.out.println("gdto : " + gdto);
					
					String gimgs = gdto.getGroup_image();
					System.out.println("gimgs : " + gimgs);
					
					StringTokenizer tokenizer = new StringTokenizer(gimgs, "|");
					
					String[] arrayGlist = new String[tokenizer.countTokens()];
					
					for(int j = 0; j < arrayGlist.length; j++){
						
						arrayGlist[j] = tokenizer.nextToken();
					}
				%>	
					<%if(gdto.getGroup_name() != "solo"){ %>
						<a href="<%=request.getContextPath()%>/admin_groupMember_list.do?gName=<%=gdto.getGroup_name() %>">
							<div class="admin_group_boxes">
								<div class="group_imgsBoxes" style="background-image: url('./resources/upload/group/<%=arrayGlist[0]%>')">
								</div>
								<div>
									 <%=gdto.getGroup_no() %>
								</div>
								<div>
									 <%=gdto.getGroup_name() %>
								</div>
								
							</div> <!-- admin_group_boxes -->
						</a>
					<%} %>
				
				
				
				
				
					
				<%}%>
			</div> <!-- admin__group_container end -->
			
			
				
			
			
			
			<!-- 솔로 가수 파트 -->
			
			<div>
				<h2>솔로</h2>
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