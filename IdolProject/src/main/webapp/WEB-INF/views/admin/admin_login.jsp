<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <c:set var="t" value="${test }" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>IdolProject Admin Login Form</title>

	<style type="text/css">
	
	
		html, body {
			padding: 0px;
			margin: 0px;
			height: 100%
		}
		
		.admin_main_wrapper {
			/*min-height: 100vh;*/
			display: flex;
			flex-direction: column;
			
		}
		
		.admin_login_form_container {
			flex:1 ;
		}
	</style>
	
</head>
<body>
	
	<div class="admin_main_wrapper">
	
		<jsp:include page="../include/admin_top_include.jsp" />
			
			<div class="admin_login_form_container">
				<form method="post" action="<%=request.getContextPath() %>/admin_login_ok.do">
					<div class="admin_login_form">
					
						<div>
							<div class="admin_id" >관리자 아이디</div>
							<input id="id" name="admin_id"></input>
						</div>
						<div>
							<div class="admin_pwd" >관리자 비밀번호</div>
							<input id="pwd" type="password" name="admin_pwd"></input>
							
						</div>
					</div>
					<div>
						
						<input type="submit" value="로그인">
						<input type="reset" value="다시 작성">
					</div>
				 </form>  
			 </div> <!-- admin_login_form_container -->
			 <div>
			 
			 
			 
			 </div>
	</div> <!-- admin_main_wrapper -->
	

</body>
</html>