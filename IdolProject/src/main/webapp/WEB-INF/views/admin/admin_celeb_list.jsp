<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="list" value="${celecList }" />
   
   
   
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
		background-color: #fafafa;
	}
	
	li {
		list-style-type: none;
		
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
		border: 1px solid pink;
		width: 320px;
		height: 370px;
		background-color: white;
		display: flex;
		flex-direction: column;
		
	}
	
	.admin_celeb_img_box {
		max-height: 100%;
		flex: 50%;
	}
	
	.admin_celeb_content_box {
		max-height: 100%;
		flex: 50%;
	
	}
	
	
	.admin_celeb_list_image {
		width: 100%;
		height: 50%;
	}
	
	.admin_celeb_list_image img {
		width: 100%;
		height: 100%;
	}
	
	
</style>

<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />


</head>
<body>
	
	
	<div class="admin_celeb_wrapper">
	
		<div class="admin_celeb_container">
			<c:if test="${!empty list }">
				<c:forEach items="${list }" var="dto">
					<a href="<%=request.getContextPath()%>/admin_celeb_content.do?no=${dto.celeb_no}">
						<div data-aos="fade-in" class="admin_celeb_content">	
							
							<div class="admin_celeb_img_box">
							
							
							</div>
							<div class="admin_celeb_content_box">
								<ul>						
									<c:if test="${dto.celeb_group != 'solo'}">
										<li>
										  ${dto.celeb_group }
										</li>
									</c:if>	
									<c:if test="${dto.celeb_group =='solo'}">
										
									</c:if>	
									<li>
										가수 명 : ${dto.celeb_name }
									</li>
									<li>
										본명 : ${dto.celeb_realname }
									</li>
									<li>
										소속사 : ${dto.celeb_agency }
									</li>
									<li>
										생일 : ${dto.celeb_dateofbirth.substring(0, 10) }
									</li>
									<li>
										데뷔일 : ${dto.celeb_debutdate.substring(0, 10) }
									</li>
								</ul>
							</div> <!-- admin_celeb_content -->
						</div> <!-- admin_celeb_content -->
					</a>
				</c:forEach>
			</c:if>	
				
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
			
		</div> <!-- admin_celeb_container -->
		
	</div> <!-- admin_celeb_wrapper -->
	
	
<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
  <script>
    AOS.init();
  </script>
</body>
</html>