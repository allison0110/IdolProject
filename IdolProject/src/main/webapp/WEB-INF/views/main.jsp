<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" pageEncoding="UTF-8" %>
<html>
<head>
	<title>IdolProject Admin Login Form</title>
	<style type="text/css">
		html, body {
			padding: 0px;
			margin: 0px;
			height: 100%
		}
		
		.admin_main_wrapper {
			height: 100vh;
			display: flex;
			flex-directin: column;
			justify-content: center;
			
		}
		
	
	</style>
</head>
<body>

	<div class="admin_main_wrapper">
			<div>
				<a href="<%=request.getContextPath() %>/admin_login.do">
					<h3>IDOL ADMIN PAGE</h3>
				</a>
				
			</div>
	</div>
	
	
</body>
</html>
