<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>

<!-- 문교수님 CSS -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover">
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"> -->

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet">
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet">

<link rel="stylesheet" href="/asset/member/css/login.css">
<!-- 문교수님 CSS -->

<style>

#navi {
	margin:0 auto;
	width: 100%;
	height: 100px;
	/* border: 2px solid black; */
}

#logo {
	margin: 10px;
 	float: left;
 	width: 20%;
 	/* border: 1px solid red; */
}

#keyword {
	margin: 10px;
	float: left;
	width: 50%;
	/* border: 1px solid red; */
}

#input {
	width: 100%;
}

#search {
	margin: 10px;
	float: left;
	width: 5%;
	/* border: 1px solid red; */
}

#login {
	margin: 10px;
	float: right;
	width: 15%;
	/* border: 1px solid red; */
}
</style>

<meta charset="UTF-8">

<jsp:include page="../nav.jsp"></jsp:include>

<title>IZITABLE - 이지테이블 : 회원가입</title>
</head>
<body>

<div class="container" style="margin: 0 auto; width: 1200px; /*border: 2px solid black;*/">

<div class="tit_intro_step">
	<ul>
		<li>약관동의</li>
		<li class="current">회원유형</li>
		<li>정보입력</li>
		<li>가입완료</li>
	</ul>
</div>

<h2 class="icon1">회원유형</h2>

		<div style="width: 80%; margin: 10px auto">
			<div style="width: 200px; float: left; text-align: center;">
				<div style="border: 2px solid black; width: 100%; height: 200px; padding: 10px; text-align: center;">
					<a href="/join/user"><img src="/resources/image/normal.png" width="150px">
					<br>
					<button class="btn">일반 회원 가입</button></a>
				</div>
				<br>
				<a href=""><img src="/resources/image/kakaologin.png" width="200px"></a>
				<br>
				<a href=""><img src="/resources/image/naverlogin.png" width="200px"></a>		
			</div>
			
			<article>
			<h3 class="icon2 ico-user">SNS회원</h3>
				<div class="confirm_box">
					<p class="mB20">카카오 회원</p>
					<div class="btn-cont">
						<a class="btn-kakao" href="#" data-type="join">
							<img src="http://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="150" alt="카카오 로그인 버튼"/>
						</a>
					</div>
				</div>
			</article>
			
			
			<div style="border: 2px solid black; width: 200px; height: 200px; float: right; padding: 10px; text-align: center;">
				<a href="/join/shop"><img src="/resources/image/shop.png" width="200px">
				<button class="btn">매장 회원 가입</button></a>
			</div>
		</div>
			
	</div>
	
	
	<form id="joinFrm" name="joinFrm" method="post" action="/join/insertMember.do">
	<input type="hidden" name="loginType" value=""/>
	<input type="hidden" name="userEmail"/>
	<input type="hidden" name="userNm"/>
	<input type="hidden" name="emailAdres"/>
	</form>
	
	
	
	
	<script src="https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script>
$(document).ready(function(){
	//카카오 로그인 버튼
	$(".btn-kakao").click(function(){
		const type = $(this).data("type");
		kakaoLogin(type);
		return false;
	});
});

//카카오 키 정보 입력
Kakao.init('0b7a004ffb2b6ac4334ce44c38e6ddaa'); // 본인 Javascript key

//카카오 SDK 초기화
Kakao.isInitialized();

//카카오로그인
function kakaoLogin(type){
	Kakao.Auth.login({
		success: function (response) {
			Kakao.API.request({
				url: '/v2/user/me',
				success:function (response) {
					console.log(response)
					$("input[name=loginType]").val("KAKAO");
					$("input[name=userId]").val(response.id);
					$("input[name=userNm]").val(response.properties.nickname);
					$("input[name=userEmail]").val(response.kakao_account.email);
					$("#joinFrm").submit();
				},
				fail: function (error){
					console.log(error)
				},
			})
		}, fail: function (error){
			console.log(error)
		},
	})
}
<c:if test="${ not empty message}">
	alert("${message}");
</c:if>

<c:if test="${ not empty loginMessage}">
	alert("${loginMessage}");
</c:if>

</script>
	
	
	

</body>
</html>