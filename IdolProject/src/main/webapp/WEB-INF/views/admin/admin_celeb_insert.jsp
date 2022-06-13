<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    <%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
    
  
    
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
		}
		
		.admin_celeb_insertForm_wrapper {
			display: flex;
			flex-direction: column;
			height: 100vh;
			align-items: center;
			justify-content: center;
			
		}
		
		.admin_celeb_insertForm_div {
			display: flex;
			flex-direction: row;
			width: 100%;
			height: 100%;
		}
		
		.celeb_form {
			max-width: 50%;
			align-content: center;
			width: 100%;
			border: 3px solid red;
			display: flex;
		    justify-content: center;
		    align-items: center;
		    flex-direction: column;
		    line-height: 1.8;
		}
		.admin_celeb_insertForm_container {
			width: 400px;
		    display: grid;
		    grid-template-columns: 1fr 1fr;
		    line-height: 1.8;
		}
		
		.celeb_insertForm_left {
			grid-column: 1;
		}
		
		.celeb_insertForm_right {
			grind-column: 2;
		}
		
		.celeb_btn {
			display: flex;
    		flex-direction: row;
    		justify-content: flex-start;
		}
		
		
		.admin_celeb_groupManager {
			border: 3px solid blue;
			max-width: 50%;
			width: 100%;
			display: flex;
		    flex-direction: column;
		    justify-content: center;
		    align-items: center;
		}
		
		.selecting {
			display: none;
		}
		
		.pImagesContainer {
			width: 100%;
			display: flex;
			flex-direction: row;
			justify-content: center;
		}
		
		.pImagesContainer img {
			width: 100%;
			height: 100%;
		}
		
		.pimageBoxes {
			width: 200px;
			height: 200px;
		}
	</style>
	
</head>
<body>
	<!-- 가수 전체 리스트 -->
	<c:set var="cList" value="${celebList }" />
	<!-- 그룹 이름 리스트 -->
	<c:set var="gList" value="${groupList }" />
	<!-- 등록 후 가수 상세 내역 불러오기 -->
	<c:set var="cCont" value="${contByname }" />
	<!--  
	<c:set var="pImages" value="${arrtokened }" />
	-->
	<div class="admin_celeb_insertForm_wrapper">
	
		<div class="admin_celeb_insertForm_div">
			
			<form class="celeb_form" enctype="multipart/form-data" method="post"  
				action="<%=request.getContextPath()%>/admin_celeb_insert_ok.do">
				
				<div class="admin_celeb_insertForm_container">
					
					
					<div class="celeb_insertForm_left">활동 이름</div>
					<div class="celeb_insertForm_right">
						<input name="celeb_name">
					</div>
					
					<div class="celeb_insertForm_left">본명</div>
					<div class="celeb_insertForm_right">
						<input name="celeb_realname">
					</div>
					
					<div class="celeb_insertForm_left">소속사</div>
					<div class="celeb_insertForm_right">
						<input name="celeb_agency">
					</div>
					
					<div class="celeb_insertForm_left">생일</div>
					<div class="celeb_insertForm_right">
						<input type="date" name="celeb_dateofbirth">
					</div>
					
					<div class="celeb_insertForm_left">데뷔</div>
					<div class="celeb_insertForm_right">
						<input type="date" name="celeb_debutdate">
					</div>
					
					<div class="celeb_insertForm_left">개인 이미지</div>
					<div class="celeb_insertForm_right">
						<input multiple="multiple" type="file" name="file1">
					</div>
				</div>
				
				<div class="celeb_btn">
					<div>
						<input type="submit" value="등록" id="inset_btn">
					</div>
					<div>
						<input type="reset" value="다시작성">
					</div>
					<input type="button" value="!" class="switch">
					
				</div>
			</form>
			
			
			
			
			
			
			
			<hr />
			<div class="admin_celeb_groupManager">
				<h1>:) </h1>
					<div class="pImagesContainer">
						<c:forEach var="pImages" items="${arrtokened}">
							<div class="pimageBoxes">
								<img alt="" src="./resources/upload/celeb/${pImages}">
							</div>
						</c:forEach>
						
					</div>

					<table>
						<c:if test="${!empty cCont.celeb_group}">
							<tr>
								<th>그룹이름</th>
								<td>
									${cCont.celeb_group }
								</td>							
							</tr>
						</c:if>
						<tr>
							<th>활동 이름</th>
							<td>
								${cCont.celeb_name }
							</td>
						</tr>
						<tr>
							<th>본명</th>
							<td>
								${cCont.celeb_realname }
							</td>
						</tr>
						<tr>
							<th>소속사</th>
							<td>
								${cCont.celeb_agency }
							</td>
						</tr>
						<tr>
							<th>생일</th>
							<td>
								${cCont.celeb_dateofbirth.substring(0, 10) }
							</td>
						</tr>
						<tr>
							<th>데뷔일</th>
							<td>
								${cCont.celeb_debutdate.substring(0, 10) }
							</td>
						</tr>
						
						
						
					</table>
				
				
				<form method="post" enctype="multipart/form-data" 
					 action="<%=request.getContextPath()%>/celeb_gimage_update.do">
					 
					<input type="hidden" name="celeb_no" value="${cCont.celeb_no }">
					<input type="hidden" name="celeb_name" value="${cCont.celeb_name }">
					 
					 
					 <div class="celeb_insertForm_left">그룹 이름</div>
					
				<!-- 	<select name="celeb_group" class="celeb_insertForm_right selecting">
						<option value="" selected>
							::: 선택 하셈 ::: 
						</option>
						<c:forEach items="${gList }" var="g">
							<c:if test="${empty gList}">
								<option>
									:::등록된 그룹이 없습다:::
								</option>
							</c:if>
							<c:if test="${!empty gList }">
								
								<option value="${g.celeb_group }">
										${g.celeb_group }
								</option>
							</c:if>
						</c:forEach>
					</select>
					 -->
										
					<div class="celeb_insertForm_right WrittingDown">
						<input name="celeb_group">
					</div>
					
					
					<div>
						<input multiple="multiple" type="file" name="file"> 
					</div>
					
					<div>
						<input type="submit" value="등록">
						<input type="reset" value="다시작성">
					</div>
				</form>
				
			</div>
		</div>
	</div>

</body>
</html>