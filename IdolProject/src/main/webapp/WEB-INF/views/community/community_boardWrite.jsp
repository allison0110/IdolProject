<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시물 작성 페이지</title>
<script src="https://kit.fontawesome.com/3de1cbcb05.js" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<style type="text/css">

 		#att_zone{
            width: 660px;
            min-height:150px;
            padding:10px;
            border:1px dotted #00f;
        }
        #att_zone:empty:before{
            content : attr(data-placeholder);
            color : #999;
            font-size:.9em;
        }
        
        #att_zone input{
        	border: none;
        	background-color: transparent;
        }

</style>
</head>
<body>
<%@include file="../include/user_top.jsp" %>

	<div align="center">
		<hr width="50%" color="red">
		<h3>게시물 작성</h3>
		<hr width="50%" color="red">
		<br>
		
		<form method="post" enctype="multipart/form-data" onsubmit="return submitCheck();" 
		action="<%=request.getContextPath()%>/community_boardwrite_ok.do">
		<table border="1" cellspacing="0" >

			<tr>
				<th>작성자아이디 </th>
				<td> <input type="text" id="userid" name="community_userid" value=""> </td>
			</tr>
			
			<tr>
				<th>게시글 제목 </th>
				<td> <input type="text" name="community_title"> </td>
			</tr>
			
			<tr>
				<th>게시글 내용 </th>
				<td> 
				<textarea rows="5" cols="30" name="community_cont"></textarea>
				<br>				
		        <div id='image_preview'>
		        <input type='file' id='btnAtt' multiple='multiple' name="file"/>
		        <div id='att_zone' 
		              data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하거나 파일을 드래그앤드롭 하세요'></div>
		    	</div>

				</td>
			</tr>
			
			<tr>
				<th>게시글 카테고리 </th>
				<td> 
				<select name="category_cnofk">
					<option value="" selected>-게시글카테고리-</option>
					<option value="100">일상</option>
					<option value="200">루머</option>
					<option value="300">공식</option>
					<option value="400">포토</option>
				</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="게시글 등록">
					<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
		
		</form>
		
		<button id="btn">click</button>
		
		
		
	</div>
<script src="js/community_boardWrite.js"></script>
<%@include file="../include/user_bottom.jsp" %>
<script>

    
    function submitCheck(){
    	
    	console.log('click!!');
    	
    	return true;
    }
    
  </script>
</body>
</html>