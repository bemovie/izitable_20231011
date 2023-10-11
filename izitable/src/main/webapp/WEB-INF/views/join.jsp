<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
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
<!-- 문교수님 CSS -->

<style>
join_input {
	margin-bottom: 30px;
}
</style>

<meta charset="UTF-8">

<jsp:include page="nav.jsp"></jsp:include>

<title>IZITABLE - 이지테이블 : 회원가입</title>
</head>
<body>

	<div class="container" style="margin: 0 auto; width: 50%; border: 2px solid black;">
		<div style="text-align: center;">
			<h3>회원 가입</h3>
		</div>
		<!-- <form method="post" action="add"> --> <!-- jsp는 페이지 단위, 어쩔 수 없이 form tag를 받아줄 페이지 필요 -->
		<!-- <form method="post" name="signup_form"> --> <!-- jsp는 페이지 단위, 어쩔 수 없이 form tag를 받아줄 페이지 필요 -->
		<form method="post" >
			<div>
			
				<div class="join_input">
					<label>이메일</label><br>
					<input type="text" name="userEmail" placeholder="이메일을 입력해주세요">
					<button class="btn">이메일 인증</button>
				</div>
				
				<div class="join_input">
					<label>휴대폰 번호</label><br>
					<input type="text" name="userPhone" placeholder="숫자만 입력해주세요">
				</div>
				
				<!--
				<div>
					<label>휴대폰 번호 인증</label>
					<input type="hidden" name="userPhoneCert">
				</div>
				-->
				
				<div class="join_input">
					<label>비밀번호</label><br>
					<input type="password" name="userPwd" placeholder="비밀번호를 입력해주세요">
					<button type="button" class="password_check btn" data-msg="Hello1" data-for="passwd">확인</button>
				</div>
				
				<div class="join_input">
					<label>비밀번호 확인</label><br>
					<input type="password" name="passwd_confirm" placeholder="비밀번호를 다시 한 번 입력해주세요">
					<button type="button" class="password_check btn" data-msg="Hello2" data-for="passwd_confirm">확인</button>
				</div>
				
				영문, 숫자, 특수문자 중 2종류 이상을 조합하여 8~20자리로 설정해주세요.
	
				<div class="join_input">
					<button type="submit" id="join" class="btn">등록</button>
					<a href="${pageContext.request.contextPath}"><button type="button" class="btn">처음으로</button></a>
				</div>
				
			</div>
		</form>
	</div>

</body>
</html>