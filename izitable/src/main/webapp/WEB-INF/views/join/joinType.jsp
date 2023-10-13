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
			
			<div style="border: 2px solid black; width: 200px; height: 200px; float: right; padding: 10px; text-align: center;">
				<a href="/join/shop"><img src="/resources/image/shop.png" width="200px">
				<button class="btn">매장 회원 가입</button></a>
			</div>
		</div>
			
	</div>

</body>
</html>