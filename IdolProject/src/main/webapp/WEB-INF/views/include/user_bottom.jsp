<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <!-- include footer -->
   <!-- FOOTER -->
  <footer class="footer">
	<script src="resources/js/gnb.js"></script>
	<div class="foot_menu">
		<ul>
			<li><a href="<%=request.getContextPath() %>/">Back to top</a></li>
		</ul>
	</div>
    <div id="foot_contents">
        <h5 id="foot_info"><strong>INFORMATION</strong></h5>
        <div class="company_info">
            <ul>
                <li>상호명 &nbsp;<strong>YOUR CELEB</strong> </li>
                <li>대표자명 &nbsp;<strong>김돌수</strong></li>
                <li>주소 &nbsp;<strong>서울특별시 중구 남대문로 120 대일빌딩 2층, 3층</strong></li>
                
            </ul>
            <ul>
                <li>대표전화 &nbsp;02-1544-9970</li>
                <li>팩스번호 &nbsp;02-1544-9971 </li>
                <li>개인정보보호책임자 &nbsp;김돌돌 / idolidol@yourceleb.com </li>
            </ul>
        </div>
        <div id="bg_copy">
         	<div class="wd">
	             <div class="copy_year">
	                 <span class="color-red">YOUR CELEB의 모든 컨텐츠는 저작권의 보호를 받고 있습니다.</span><br>
						<p>&copy; <span id="year">2022</span> by <strong>YOUR CELEB</strong> All Rights Reserved.</p>
	             </div>
	         </div>
	     </div>
    </div>
        
  </footer>
    <!-- include footer -->
	
	<!-- popup -->
	
		
	<c:set var="elist" value="${elist }"/>
	 <div class="swiper popupSwiper" id="popup">
	 	<div class="swiper-wrapper">
			<div class="popup-image-area">
				<c:forEach items="${elist }" var="edto">
					<div class="swiper-slide">
						<div class="swiper-slide-popup-wrap" >
							<a href="">
					 		<img src="./resources/upload/images/${edto.notice_image }">
							<span>${edto.notice_title }</span>
							</a>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
		<div class="popup-row">
			<label class="today-done-label">
          		<input type="checkbox" id="today-done-checkbox" />
          		<span class="today-done-text">오늘은 더 이상 보지않기</span>
        	</label>
			<div>
				<button id="popup-close-btn">닫기</button>
			</div>
		</div>	
	</div> 
	 
</body>
<script>
var popup = document.querySelector("#popup");
var todayIsDone = document.querySelector("#today-done-checkbox");
var closeBtn = document.querySelector("#popup-close-btn");
var popupCookieKey = "today-done";

const swiper = new Swiper(".popupSwiper", {
    loop: true,
    autoplay: {
      delay: 3000,
    },
  });
  
closeBtn.addEventListener("click", function(){
	close();
});

function close(){
	if(todayIsDone.checked){
		//오늘은 더 이상 보지 않는 로직
		setCookie(popupCookieKey,todayIsDone.checked,1);
	}
	popup.classList.remove("show");
}

function setCookie(key, value, days){
	var expires = "";
    if (days) {
      var date = new Date();
      var oneDay = 24 * 60 * 60 * 1000;
      date.setTime(date.getTime() + days * oneDay);
      expires = "; expires=" + date.toUTCString();
    }
    document.cookie = key + "=" + (value || "") + expires + "; path=/";
  }

  function getCookie(key) {
    var nameEQ = key + "=";
    var ca = document.cookie.split(";");
    for (var i = 0; i < ca.length; i++) {
      var c = ca[i];
      while (c.charAt(0) == " ") c = c.substring(1, c.length);
      if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length, c.length);
    }
    return null;
  }
  
  window.onload = function () {
      const isAliveCookie = getCookie(popupCookieKey);

      if (!isAliveCookie) {
        // 쿠키에 어떤 값이 있을때!
        popup.classList.add("show");
      }
    };
</script>
</html>