<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	.wrapper	{
		margin: -8px;
		background-color: #EEEEEE;
		font-family: NotoSans Kor;
	}
	
	.used_wrapper {
		display: flex;
		flex-direction: column;
		min-height: 100vh;
		width: 70%;
		text-align: left;
		font-size: 12px;
	}
	
	.used_notice{
		background-color: #FFFFFF;
		padding: 10px 20px;
		min-height: 100px;
		margin: 30px 0 30px 0;
		border: 1px solid #CCCCCC;
	}
	
	.used_flex_wrapper {
		flex: 1;
		margin: 20px 0 30px 0;
	}
	
	button.gray{
		background-color: #EEEEEE;
		width: 40px;
		height: 50px;
		border: 0;
		font-weight: bold;
	}
	
</style>
</head>
<body>
	
	<!-- include top 영역 -->
	
	<div class="wrapper" align="center">
	
		<div class="used_wrapper">
		
			<div class="used_category">
				<button class="gray" style="color:red;"
				onclick="">판매</button>
				<button class="gray">구매</button>
				<button class="gray">교환</button>
				<hr>
			</div>
		
			<div class="used_notice">
				
			</div>
			
			<div class="used_wrapper">
				
			</div>
		</div>
		
	</div>
	
</body>
</html>