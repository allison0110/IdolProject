<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
    
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

	.admin_celeb_update_wrapper {
		height: 100%;
		display: flex;
		flex-direction: column;
	}
	
	.admin_celeb_updateForm {
		display: flex;
		flex-direction: column;
		align-items: center;
	}
	
	.admin_celeb_updateForm {
		display: flex;
		flex-direction: column;
	}
</style>
</head>
<body>
	<c:set var="cont" value="${celebCont }" />
	<c:set var="clist" value="${gList }" />
	
	<div class="admin_celeb_update_wrapper">
	
		<div class="admin_celeb_container">
		
		<form method="post" enctype="multipart/form-data"
				action="<%=request.getContextPath() %>/admin_celeb_modify_ok.do?">
		<input type="hidden" value="${cont.celeb_no }" name="celeb_no">
		
			<div class="admin_celeb_updateForm">
				<div>
					<label for="realName">본명</label><input id="realNmae" value="${cont.celeb_realname}" name="celeb_realname">
				</div>
				
				<div>
					<label for="name">가수명</label><input id="name" value="${cont.celeb_name}" name="celeb_name">
				</div>
				<div>
					<select name="celeb_group">
						<c:forEach items="${clist }" var="c">
							<c:if test="${c.group_name == cont.celeb_group }">
								<option value="${c.group_name}" selected>
									${c.group_name}
								</option>
							</c:if>
							<c:if test="${c.group_name != cont.celeb_group }">
								<option value="${c.group_name}">
									${c.group_name}
								</option>
							</c:if>	
						</c:forEach>
					</select>
				</div>
				<div>
					<label for="agency">소속사</label><input id="agency" value="${cont.celeb_agency}" name="celeb_agency">
				</div>
				<div>
					<label for="birthday">생일</label>
					<input type="date" name="celeb_dateofbirth" value="${cont.celeb_dateofbirth.substring(0, 10)}">
				</div>
				<div>
					<label for="debutdate">데뷔일</label>
					<input type="date" name="celeb_debutdate" value="${cont.celeb_debutdate.substring(0, 10)}">
				</div>
				<div class="admin_celeb_update-btn">
				
					<input type="hidden" value="${cont.celeb_pimage }" name="originFiles">
					
					<input type="file" multiple="multiple" name="file1">
					<input type="submit" value="수정">
					<input type="reset" value="다시작성">
					
				</div> <!-- admin_celeb_update-btn end -->
			</div><!-- admin_celeb_updateForm end -->
		</form>	
		</div>	<!-- admin_celeb_container end -->
	</div> <!-- admin_celeb_update_wrapper end -->

</body>
</html>