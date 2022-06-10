<%@page import="com.idol.model.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지> 회원정보관리</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.3.0/font/bootstrap-icons.css">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.6.0.js"></script>
<script type="text/javascript" src="./resources/js/member.js"></script>
<link rel="stylesheet" href="./resources/css/member.css">
<style type="text/css">
	
	/* ***********마이페이지 회원정보관리************* */
	
	

</style>


<script type="text/javascript">


	function checkUpdate(){
		
		var pwd = $("#member_pwd").val();
		var check = $("#member_pwd_check").val();
		var email = $("#member_email").val();
		var phone1 = $("#phone1").val();
		var phone2 = $("#phone2").val();
		var phone3 = $("#phone3").val();
		var addr = $(".addr").val();
		var addr1 = $(".addr1").val();
		var addr3 = $(".addr3").val();
		
		if(pwd == ""){
			alert("비밀번호를 입력해주세요");
			$("#member_pwd").focus();
			return false;
		}
		if(check == ""){
			alert("비밀번호를 확인해주세요");
			$("#member_pwd_check").focus();
			return false;
		}
		if(phone2 == "" || phone3 ==""){
			alert("핸드폰번호를 확인해주세요");
			$("phone2").focus();
			return false;
		}
		
		if(email ==""){
			alert("이메일을 입력해주세요");
			$("#member_email").focus();
			return false;
		}
		if(addr =="" || addr1 ==""  || addr3 ==""){
			alert("주소를 입력해주세요");
			$("addr").focus();
			return false;
		}
		
		if(pwd.length != 0 && check.length != 0){
			if(pwd != check){
				alert("비밀번호를 다시 확인해주세요.");
				$("#member_pwd").focus;
				return false
			}
		}
		
	}

</script>
</head>
<body>
	<c:set var="dto" value="${memInfo }"/> <!-- 세션에 저장된 정보 -->
	<c:set var="fav" value="${mem_fav }"/>
	<script type="text/javascript">
	

		
	</script>
	<div class="mypage_container" algin="center">
		
		<!-- aisde inlcude 추가  -->
		<jsp:include page="../include/mypage_aside.jsp"/>
		
		<div class="mypage_main">
		<div class="manage_top">
		<span>내 정보 수정</span>	
		
		</div>
			<form method="post" action="<%=request.getContextPath() %>/member_update.do" onsubmit="return checkUpdate()">
				<input type="hidden" name="checked_celeb" id="hidden_chcked" value="">
				<input type="hidden" name="member_no"  value="${dto.getMember_no() }">
			<div class="manage_basic">
			<span>기본 정보 수정</span>
			<hr align="left" color="lightgray" width="30%">
			<table border="1" cellspacing="0">
				<tr>
					<th>이름</th>
					<td><input name="member_name" value="${dto.getMember_name() }" readonly></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="member_pwd" id="member_pwd"></td>
				</tr>
				<tr>
					<th>비밀번호 확인</th>
					<td><input type="password" name="member_pwd_check" id="member_pwd_check"></td>
				</tr>
				<tr>
					<th>닉네임</th>
					<td><input name="member_nickname" value="${dto.getMember_nickname() }" ></td>
				</tr>
				<tr>
					<th>자기소개</th>
					<td><textarea rows="7" cols="20"  name="member_introduction">${dto.getMember_introduction() }</textarea> </td>
				</tr>
				<tr>
					<th>연락처</th>
					<td><input name="phone1" value="${dto.getMember_phone().substring(0,3)}" id="phone1">
						-<input name="phone2" value="${dto.getMember_phone().substring(3,7) }" id="phone2">
						-<input name="phone3" value="${dto.getMember_phone().substring(7) }" id="phone3"></td>
				</tr>
				<tr>
					<th>이메일</th>
					<td><input name="member_email" id="member_email" value="${dto.getMember_email() }"></td>
				</tr>
				<tr>
					<th>주소</th>
				<td>
				<!-- 다음 api 사용  -->
				<input class="addr" type="text" name="postnum" id="sample6_postcode" placeholder="우편번호" value="${mem_addr[0] }">
				<input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
				<input type="text" name="addr1" class="addr1" id="sample6_address" placeholder="주소" value="${mem_addr[1] }"><br>
				<input type="text" name="addr2" class="addr2" id="sample6_detailAddress" placeholder="상세주소" value="${mem_addr[2] }">
				<input type="text" name="addr3" class="addr3" id="sample6_extraAddress" placeholder="참고항목" value="${mem_addr[3] }">
				
				<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
				<script>
				    function sample6_execDaumPostcode() {
				        new daum.Postcode({
				            oncomplete: function(data) {
				                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
				
				                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
				                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
				                var addr = ''; // 주소 변수
				                var extraAddr = ''; // 참고항목 변수
				
				                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
				                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
				                    addr = data.roadAddress;
				                } else { // 사용자가 지번 주소를 선택했을 경우(J)
				                    addr = data.jibunAddress;
				                }
				
				                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
				                if(data.userSelectedType === 'R'){
				                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
				                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
				                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
				                        extraAddr += data.bname;
				                    }
				                    // 건물명이 있고, 공동주택일 경우 추가한다.
				                    if(data.buildingName !== '' && data.apartment === 'Y'){
				                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
				                    }
				                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
				                    if(extraAddr !== ''){
				                        extraAddr = ' (' + extraAddr + ')';
				                    }
				                    // 조합된 참고항목을 해당 필드에 넣는다.
				                    document.getElementById("sample6_extraAddress").value = extraAddr;
				                
				                } else {
				                    document.getElementById("sample6_extraAddress").value = '';
				                }
				
				                // 우편번호와 주소 정보를 해당 필드에 넣는다.
				                document.getElementById('sample6_postcode').value = data.zonecode;
				                document.getElementById("sample6_address").value = addr;
				                // 커서를 상세주소 필드로 이동한다.
				                document.getElementById("sample6_detailAddress").focus();
				            }
				        }).open();
				    }
				</script>
				</td>
				</tr>
			</table>
			</div><!-- class="manage_basic" end  -->
			<div class="manage_extr">
			<span>좋아하는 가수 변경</span>
			<hr align="left" color="lightgray" width="30%">
			
			<c:if test="${empty celebList  }">
			<h2>셀럽 정보가 없습니다.</h2>
			</c:if>
			
			<c:if test="${!empty celebList }">
			
			<div class="celeb_container">
			<c:set var="list" value="${celebList }"/>
			<c:forEach items="${list }" var="dto">
			<div class="celeb_item">
			<input type="checkbox" name="fav_celeb[]" id="celeb_${dto.getCeleb_no() }" value="${dto.getCeleb_no() }" onchange="check_celeb(${dto.getCeleb_no()})" > 
			<label for="celeb_${dto.getCeleb_no() }" >
	       <span class="celeb_span"> ${dto.getCeleb_group() } </span>
	       	</label>
			</div>
			</c:forEach>
				
			</div><!-- class="celeb_container" end -->
			</c:if>
			
			<%
				String[] mem_fav = request.getParameterValues("mem_fav");
			
			%>
			
			<script type="text/javascript">
			
			
			let checked = new Array();
			var count =0;
			
			$(document).ready(function(){

				/* 회원가입시 선택했던 가수를 수정폼에서 선택된 상태로 보여줌  */
				checked.push('<c:out value="${fav[0]}"/>');
				checked.push('<c:out value="${fav[1]}"/>');
				checked.push('<c:out value="${fav[2]}"/>');
				
				console.log(checked);
				
				for(let i =0 ; i< checked.length; i++){
				
					if(checked[i] === ''){
						checked.splice(i);
						
					}else{
					
					$("#celeb_"+checked[i]).prop("checked",true);
					++count; }
					
				}
				
				console.log("Result"+checked)
				
			});
		
			
			/* 셀럽 선택하기 이벤트 (3개제한 및 리스트 저장)  */
			function check_celeb(no){
					
				console.log(no);
				
				if($("#celeb_"+no).prop("checked")){
					
					++count; 
					
					if(count < 4){
						
					checked.push($("#celeb_"+no).val());
					console.log(count);
					
					}else {
					
						alert("최대 3명까지 선택 가능합니다.");
						$("#celeb_"+no).prop("checked",false);
						count --;
					}
					
				}else {
					
					console.log(count);
					var size = checked.length;
					checked.splice(size-1);

					--count;
				}
			
				console.log(checked);
				$("#hidden_chcked").val(checked);
				console.log($("#hidden_chcked").val());
				
			}
		
			
		
		</script>
			
			</div>
			<div class="manage_bottom">
				<input type="submit" value="회원정보 수정">
				<input type="button" value="취소" onclick="location.href='mypage.do'">
			</div>
			</form>	
		</div><!-- class="mypage_main" end -->
	
	</div><!-- class="mypage_container" end -->

</body>
</html>