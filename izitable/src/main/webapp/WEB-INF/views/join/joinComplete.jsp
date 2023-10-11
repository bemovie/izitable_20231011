<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>

<!-- 문교수님 CSS -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"> -->

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- 공통 Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />

<link rel="stylesheet" href="/asset/member/css/login.css">
<!-- 문교수님 CSS -->

<style>
join_input {
	margin-bottom: 30px;
}
</style>

<meta charset="UTF-8">

<jsp:include page="../nav.jsp"></jsp:include>

<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<title>IZITABLE - 이지테이블 : 회원가입</title>
</head>
<body>
<div class="container" style="margin: 0 auto; width: 50%; /*border: 2px solid black;*/">

<div class="tit_intro_step">
	<ul>
		<li>약관동의</li>
		<li>회원유형</li>
		<li>정보입력</li>
		<li class="current">가입완료</li>
	</ul>
</div>

<h2 class="icon1">가입완료</h2>
<p class="mB20">회원가입이 완료되었습니다. 감사합니다</p>

<div class="join_finish">
	<p>"회원가입이 완료되었습니다. <em>로그인 후</em> 사용해 주시기 바랍니다."</p>
	<div class="btn_c">
		<a href="/login.do" class="btn-lg spot">로그인</a>
		<a href="/" class="btn-lg">메인으로</a>
	</div>
</div>

</div>

</body>
</html>