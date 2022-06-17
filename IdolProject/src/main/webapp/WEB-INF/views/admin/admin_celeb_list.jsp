<%@page import="com.idol.model.GroupDTO"%>
<%@page import="com.idol.model.CelebDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="cList" value="${celecList }" />
    <c:set var="gList" value="${groupList }" />
   
  
   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style type="text/css">

	/************ 공통 ***********/
	
	html, body {
		padding: 0px;
		margin: 0px;
		height: 100%;
		background-color: #e0e0e0;
		font-family: 'Kanit', sans-serif;
		
	}
	
	li {
		list-style-type: none;
		color: black;
	}
	
	a {
		text-decoration: none;
	}
	
	
	/************ 공통 ***********/

	.admin_celeb_wrapper {
		display: flex;
		flex-direction: column;
		height: 100vh;
		
	}
	
	.admin_celeb_container {
		display: flex;
	    flex-direction: row;
	    flex-wrap: wrap;
	    column-gap: 35px;
	    row-gap: 100px;
	    justify-content: center;
	    
	}
	
	.admin_celeb_content{
		/*border: 1px solid pink;*/
		width: 320px;
		height: 370px;
		background-color: white;
		display: grid;
    	grid-template-rows: 80% 20%;
		
	}
	
	.admin_celeb_img_box {
		height: 100%;
		width: 100%;
		grid-row: 1;
		background-size: cover;
		/*border-bottom: 1px solid gray;*/
	}
	
	.imgs{
		width: 100%;
		object-fit: none;
		width: 160px;
	}
	
	.admin_celeb_content_box {
		height: 100%;
		width: 100%;
		grid-row: 2;
	
	}
	
	.admin_celeb_content_box ul {
		
		
	}
	
	
	
	
</style>

<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
<!-- font-family: 'Kanit', sans-serif; -->
<link href="https://fonts.googleapis.com/css2?family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Merriweather&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Source+Code+Pro&family=Titillium+Web:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
<!-- font-family: 'Inconsolata', monospace;-->
<link href="https://fonts.googleapis.com/css2?family=Inconsolata:wght@200;300;400;500;600;700;800;900&family=Kanit:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&family=Merriweather&family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Source+Code+Pro&family=Titillium+Web:ital,wght@0,400;1,300&display=swap" rel="stylesheet">
</head>
<body>
	
	
	<div class="admin_celeb_wrapper">
	
		<div class="admin_celeb_container">
		

			<c:if test="${!empty cList }">
				<%
					List<CelebDTO> list = (List<CelebDTO>)request.getAttribute("celecList");

					List<GroupDTO> glist = (List<GroupDTO>)request.getAttribute("groupList");	
				
					for(int i=0; i < list.size(); i++){
						
						CelebDTO dto = list.get(i);
						
						String imgs = dto.getCeleb_pimage();
						
						StringTokenizer tokenizer = new StringTokenizer(imgs, "|");
						
						String[] arrayToekn = new String[tokenizer.countTokens()];
						
						for(int j =0; j < arrayToekn.length; j++ ) {
							arrayToekn[j] = tokenizer.nextToken();
							
						}
						
					
						
						
					%>
					<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=<%=dto.getCeleb_no() %>">			
						<div data-aos="fade-in" class="admin_celeb_content">
						
							<div class="admin_celeb_img_box" style="background-image: url('./resources/upload/celeb/<%= arrayToekn[0] %>')">
								<!-- <img class="imgs" alt="" src="./resources/upload/celeb/<%= arrayToekn[0] %>">	
								 -->
							</div>
							
							<div class="admin_celeb_content_box">
								<ul>						
								
									<%
									if(dto.getCeleb_group().equals("solo")){
										%>
									<li>
									</li>		
								<%	} else {%>
									<li>
										 <%=dto.getCeleb_group() %>
									</li>
								<% } %>	
									<li>
										 <%=dto.getCeleb_name() %>
									</li>
									<!-- 
									<li>
										본명 : <%=dto.getCeleb_realname() %>
									</li>
									<li>
										소속사 : <%=dto.getCeleb_agency() %>
									</li>
									
									<li>
										생일 : <%=dto.getCeleb_dateofbirth().substring(0, 10) %>
									</li>
									<li>
										데뷔일 : <%=dto.getCeleb_debutdate().substring(0, 10) %>
									</li>
									 -->
									
								</ul>
							</div> <!-- admin_celeb_content_box -->
							
						

						
					</div> <!-- admin_celeb_content -->		
					</a>		
								
					<%} %>
		</c:if>		
		</div> <!-- admin_celeb_container -->
		
	</div> <!-- admin_celeb_wrapper -->
	<div
	    data-aos="fade-up"
	    data-aos-offset="200"
	    data-aos-delay="50"
	    data-aos-duration="1000"
	    data-aos-easing="ease-in-out"
	    data-aos-mirror="true"
	    data-aos-once="false"
	    data-aos-anchor-placement="top-center"
	  >
	  </div>	
	
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
</body>
</html>