<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제화면</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>
<h1></h1>

<script>
var productId = '<c:out value="${productId}"/>';
var end
if('<c:out value="${flag}"/>'=="bidder"){
	var IMP = window.IMP; // 생략가능
	IMP.init('imp26988866'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
	
	IMP.request_pay({
	    pg : 'html5_inicis', // version 1.1.0부터 지원.
	    pay_method : 'card',
	    merchant_uid : 'merchant_' + new Date().getTime(),
	    name : '<c:out value="${productName}"/>',
	    amount : '<c:out value="${cost}"/>',
	    buyer_email : '<c:out value="${email}"/>',
	    buyer_name : '<c:out value="${name}"/>',
	    buyer_tel : '010-1234-5678',
	    buyer_addr : '서울특별시 강남구 삼성동',
	    buyer_postcode : '123-456',
	    m_redirect_url : 'https://www.naver.com'
	}, function(rsp) {
	    if ( rsp.success ) {
	       	//[1] 서버단에서 결제정보 조회를 위해 jQuery ajax로 imp_uid 전달하기
	    	jQuery.ajax({
	    		url: "/mine/payment/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
	    			price : rsp.paid_amount,
	    			unique_id : productId
		    		/* imp_uid : rsp.imp_uid,
		    		marchat_uid : rsp.merchant_uid, */
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	});
/* 	    	).done(function(data) {
	    		//[2] 서버에서 REST API로 결제정보확인 및 서비스루틴이 정상적인 경우
	    		if ( everythings_fine ) {
	    			var msg = '결제가 완료되었습니다.';
	    			msg += '\n고유ID : ' + rsp.imp_uid;
	    			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
	    			msg += '\n결제 금액 : ' + rsp.paid_amount;
	    			msg += '카드 승인번호 : ' + rsp.apply_num;
	    			alert(msg);
	    			location.href="/mine/auction"; //리디렉션
	    		} else {
	    			//[3] 아직 제대로 결제가 되지 않았습니다.
	    			//[4] 결제된 금액이 요청한 금액과 달라 결제를 자동취소처리하였습니다.
	    		}
	    	}); */
	    	location.href='<%=request.getContextPath()%>/payment/complete';
	    } else {
	        var msg = '결제에 실패하였습니다.';
	        msg += '에러내용 : ' + rsp.error_msg;
/* 	    	jQuery.ajax({
	    		url: "/mine/payment/complete", //cross-domain error가 발생하지 않도록 주의해주세요
	    		type: 'POST',
	    		dataType: 'json',
	    		data: {
		    		imp_uid : rsp.imp_uid,
		    		marchat_uid : rsp.merchant_uid,
	    			paid_amount : rsp.paid_amount
		    		//기타 필요한 데이터가 있으면 추가 전달
	    		}
	    	});
	    	location.href="/mine/auction"; */
	        location.href='<%=request.getContextPath()%>/payment/fail';
	    }
	    alert(msg);
	});
}else{
	alert("당신은 낙찰자가 아닙니다!");
	history.back();
}
</script>

</body>
</html>