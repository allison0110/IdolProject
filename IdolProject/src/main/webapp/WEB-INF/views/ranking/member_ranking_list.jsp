<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.rankWrapper{
	width: 980px;
	min-height: 80%;
	margin: 0 auto;
	margin-top: 40px;
	display: flex;
}
.sidenav {
  height: 100%;
  width: 200px;
  position: flex;
  z-index: 1;
  top: 100px;
  left: 250px;
  background-color: white;
  overflow-x: hidden;
  padding-top: 20px;
  
}
.sidenav a {
  padding: 6px 6px 6px 32px;
  text-decoration: none;
  font-size: 25px;
  color: navy;
  display: block;
}
.sidenav a:hover {
  color: red;
}
.main {
  margin-left: 200px; /* Same as the width of the sidenav */
}
@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
}
</style>
</head>
<body>

	<%@include file="../include/user_top.jsp" %>	
	<div class="rankWrapper">
		<div class="sidenav">
			<a href="#">Most Points</a>
  			<a href="#">Most Message</a>
		</div>
	<!-- Add all page content inside this div if you want the side nav to push page content to the right (not used if you only want the sidenav to sit on top of the page -->
		<div class="rank">
			<ul>
				<li>
					<a href="#"></a>
				</li>
			</ul>
		</div>
	</div>
	
	<%@include file="../include/user_bottom.jsp" %>
</body>

<script type="text/javascript">
</script>
</html>