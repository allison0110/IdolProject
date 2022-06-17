/*키보드 엔터시 제출되는것을 방지하는 함수 */
$('input[type="text"]').keydown(function() {
if (event.keyCode === 13) {
    event.preventDefault();
};
});


/*checkbox all Cehck*/
let allCheck = $('#cart_all_check');
let mediumCheck = $('.check_medium');

allCheck.click(function(){
    if(allCheck.is(':checked') == true){
        mediumCheck.prop('checked',true);
    }else{
        mediumCheck.prop('checked',false);
    }
});


/*수량버튼 클릭시 총합가격 변경 코드 와 현재 재료량에 비교하여 수량선택 제한*/
let nowProductQty = $(".product_qty"); // 리스트 각각의 상품 재고수량
let MediumPrdPrice = $(".medium-prdPrice"); // hidden 카트에 담긴 상품 개별 가격
let MediumPrdTotal = $(".medium-prdtotal"); // hidden 카트에 담긴 상품 총합
let MediumTotal = $(".medium-total"); // 리스트 각각의 주문금액 

let BtotalAmount = $("#BtotalAmount"); // 하단 총 상품금액
let BdeliberyFee = $("#BdeliberyFee"); // 하단 배송비
let BfinalAmount = $("#BfinalAmount"); // 하단 최종결제금액

function bottomTotal(){
    let total = 0;
    for(let j=0;j<$(".numBox").length;j++){
        total += parseInt(MediumPrdTotal.eq(j).val());
    }
    BtotalAmount.text(total.toString()
    .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));

    BfinalAmount.text((total+3000).toString()
    .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
}
bottomTotal();

// 선택상품 삭제버튼
let sltDeleteBtn = $("#selected_delete");
// 카트 개별checkbox
let mediumCheckBtn = $(".check_medium");
let cartNo = $(".medium-cartno");
//let scartno = $("#scartno");
let memNo = $("#memNo").val();
let deleteBtn = $(".deleteBtn");
// 전체상품 주문 버튼
let totalOrderBtn = $('#totalOrderBtn');
// 선택상품 주문버튼
let selectOrderBtn = $('#selectOrderBtn');

// 각각의 카트에 수량조절
for(let i=0;i<$(".numBox").length;i++){
    $(".plus").eq(i).click(function(){
        let numBox;
        const num = $(".numBox").eq(i).val();
        const plusNum = Number(num) + 1;

        if(plusNum > nowProductQty.eq(i).val()) {
        alert('현재 주문 가능한 수량은 '+nowProductQty.eq(i).val()+'개 입니다');
        $(".numBox").eq(i).val(num);

        } else {
        $(".numBox").eq(i).val(plusNum);
        numBox = $(".numBox").eq(i).val();
        
        // 카트수량변경 
        $.ajax({
	         type : "POST",
	         url : "product_cartUpdate.do",
	         data:{cno : cartNo.eq(i).val(),
	         	   cqty : parseInt(numBox)
	         },
	         success: function(data){
				
			},
			error: function(data){
				alert("다시 로그인해 주세요");
			}
	     });
        
        // 리스트 각각의 주문금액총합
        MediumTotal.eq(i).text((parseInt(numBox)*parseInt(MediumPrdPrice.eq(i).val())).toString()
        .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));   
        // 리스트 각각의 제품금액 총합
        MediumPrdTotal.eq(i).val((parseInt(numBox)*parseInt(MediumPrdPrice.eq(i).val())));
        
        // 하단 총 상품금액과 최종결재금액 표시
        bottomTotal();

        }
    });

    $(".minus").eq(i).click(function(){
        const num = $(".numBox").eq(i).val();
        const minusNum = Number(num) - 1;
        
        if(minusNum <= 0) {
         alert('최소 주문수량은 1개입니다');
         $(".numBox").eq(i).val(num);

        } else {
         $(".numBox").eq(i).val(minusNum);
         numBox = $(".numBox").eq(i).val();
         
         // 카트수량변경 
         $.ajax({
	         type : "POST",
	         url : "product_cartUpdate.do",
	         data:{cno : cartNo.eq(i).val(),
	         	   cqty : parseInt(numBox)
	         },
	         success: function(data){
				
			},
			error: function(data){
				alert("다시 로그인해 주세요");
			}
	     });
	     
         // 리스트 각각의 주문금액총합
         MediumTotal.eq(i).text((parseInt(numBox)*parseInt(MediumPrdPrice.eq(i).val())).toString()
         // 리스트 각각의 제품금액 총합
         .replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ","));
         MediumPrdTotal.eq(i).val((parseInt(numBox)*parseInt(MediumPrdPrice.eq(i).val())));  

         // 하단 총 상품금액과 최종결재금액 표시
         bottomTotal();

        }
    });

}

// 체크박스 선택카트삭제
sltDeleteBtn.click(function(){

	if(confirm('정말로 삭제하시겠습니까?')){
	let deleteCartno = [];
	for(let i=0;i<mediumCheckBtn.length;i++){
		if(mediumCheckBtn.eq(i).is(':checked')){
		 deleteCartno.push(cartNo.eq(i).val());
		}
	}
	if(deleteCartno.length>0){
		$.ajax({
	         type : "POST",
	         url : "product_cartSelectedDelete.do",
	         data:{cartno : deleteCartno},
	         success: function(data){
				location.href="product_cartList.do?memno="+memNo;
			},
			error: function(data){
				alert("다시 로그인해 주세요");
			}
	     });
     }else{
     	alert('삭제할 제품을 선택해 주세요');
     }
     }
});

// 개별 카트 삭제
for(let j=0;j<deleteBtn.length;j++){

	deleteBtn.eq(j).click(function(){
		
		if(confirm('정말로 삭제하시겠습니까?')){
			$.ajax({
	         type : "POST",
	         url : "product_cartDelete.do",
	         data:{cno : cartNo.eq(j).val()},
	         success: function(data){
				location.href="product_cartList.do?memno="+memNo;
			},
			error: function(data){
				alert("다시 로그인해 주세요");
			}
	     });
	     
		}
	});
}

// 전체상품 주문버튼 클릭하여 상품 주문
totalOrderBtn.click(function(){
	console.log('전체상품 주문');
	mediumCheck.prop('checked',true);
	let SelectedCartno = [];
	for(let i=0;i<mediumCheckBtn.length;i++){
		if(mediumCheckBtn.eq(i).is(':checked')){
		 SelectedCartno.push(cartNo.eq(i).val());
		}
	}
	if(SelectedCartno.length>0){
		$.ajax({
	         type : "POST",
	         url : "product_orderFromCart.do",
	         data:{cartno : SelectedCartno },
	         success: function(data){
				location.href="product/product_order.jsp";
			},
			error: function(data){
				alert("다시 로그인해 주세요");
			}
	     });
     }
	
	
	
});







