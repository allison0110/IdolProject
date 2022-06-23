<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

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
		margin: 30px 0 30px 0;
		border: 1px solid #CCCCCC;
	}
	
	.used_flex_row{
		display: flex;
		flex-direction: row;
	}
	
	.used_left{
		flex: 1;
		text-align: left;
	}
	
	.used_right{
		flex: 1;
		text-align: right;
	}
	
	.used_flex_wrapper {
		flex: 1;
		margin: 20px 0 30px 0;
	}
	
	.used_list {
		display: grid;
		grid-template-columns: 1fr 1fr 1fr 1fr;
		grid-template-rows: 1fr 1fr 1fr 1fr 1fr;
		grid-gap: 10px;
	}
	
	.used_one {
		display: flex;
		flex-direction: column;
		background-color: #FFFFFF;
		border: 1px solid #CCCCCC;
		height: 100px;
	}
	
	.used_up {
		flex: 1;
		
	}
	
	.used_down {
		flex: 1;
	
	}
	
	button.gray{
		background-color: #EEEEEE;
		width: 40px;
		height: 50px;
		border: 0;
		font-weight: bold;
	}
	
	select.navy{
		background-color: #2A3A52;
		color: white;
		padding: 5px;
		font-size: 12px;
	}
	
	button.navy{
		background-color: #2A3A52;
		color: white;
		padding: 5px 15px;
		font-size: 12px;
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
				<h3>플리마켓-판매</h3>
				동일 제품 중복 등록할 수 없습니다.<br><br>
			</div>
			
			<div class="used_flex_row">
			
				<div class="used_left">
				
					<select class="navy">
						<option value="" selected>전체</option>
						<option value="">판매중</option>
						<option value="">완료</option>
					</select>
					&nbsp;
					<select class="navy">
						<option value="" selected>최신순</option>
						<option value="">조회순</option>
						<option value="">추천순</option>
						<option value="">댓글순</option>
					</select>
					
				</div>
				
				<div class="used_right">
					<button class="navy" onclick="">쓰기</button>&nbsp;
					<button class="navy" onclick="">검색</button>&nbsp;
					<button class="navy" onclick="">목록</button>
				</div>
				
			</div>
	      
			<div class="used_flex_wrapper">
			
				<div class="used_list">
				
					<!-- foreach 문 -->
					
						<div class="used_one">
						
							<div class="used_up">
							사진
							</div>
							
							<div class="used_down">
							글내용
							</div>
							
						</div>
						
						<div class="used_one">
						
							<div class="used_up">
							asd
							</div>
							
							<div class="used_down">
							asd
							</div>
							
						</div>
						
					<!-- /foreach 문 -->
					
				</div>
				
			</div>
		
		</div>
		
	</div>
</body>
</html>