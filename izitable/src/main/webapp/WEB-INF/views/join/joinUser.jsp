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
<div class="container" style="margin: 0 auto; width: 1200px; /*border: 2px solid black;*/">

<div class="tit_intro_step">
	<ul>
		<li>약관동의</li>
		<li>회원유형</li>
		<li class="current">정보입력</li>
		<li>가입완료</li>
	</ul>
</div>

<h2 class="icon1">정보입력</h2>
		<!-- <form method="post" action="add"> --> <!-- jsp는 페이지 단위, 어쩔 수 없이 form tag를 받아줄 페이지 필요 -->
		<!-- <form method="post" name="signup_form"> --> <!-- jsp는 페이지 단위, 어쩔 수 없이 form tag를 받아줄 페이지 필요 -->
		<form method="post" action="/join" onsubmit="return regist();">
			<input type="hidden" id="idCheckAt" value="N"/>
			
			<div>
				<div class="join_input">
					<label>이메일</label><br>
					<input type="text" id="userEmail" name="userEmail" placeholder="이메일을 입력해주세요" pattern="[^ @]*@[^ @]*">
					<a href="#" id="btn-id-check" class="btn-sm spot fn" title="중복확인(새창열림)"><span>중복확인</span></a>
					<!-- <button class="btn">이메일 인증</button> -->
				</div>
				
				<div class="join_input">
					<label>휴대폰 번호</label><br>
					<input type="text" id="userPhone" name="userPhone" placeholder="숫자만 입력해주세요">
				</div>
				
				<!--
				<div>
					<label>휴대폰 번호 인증</label>
					<input type="hidden" name="userPhoneCert">
				</div>
				-->
				
				<div class="join_input">
					<label>비밀번호</label><br>
					<input type="password" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요">
				</div>
				
				<div class="join_input">
					<label>비밀번호 확인</label><br>
					<input type="password" id="passwd_confirm" name="passwd_confirm" placeholder="비밀번호를 다시 한 번 입력해주세요">
				</div>
				
				영문, 숫자, 특수문자 등 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상으로 설정해주세요.
	
				<div class="join_input">
					<button type="submit" id="join" class="btn">등록</button>
					<a href="${pageContext.request.contextPath}"><button type="button" class="btn">처음으로</button></a>
				</div>
				
			</div>
		</form>
	</div>

<script>
$(document).ready(function() {
	//아이디 중복 검사
	$("#btn-id-check").click(function() {
		var userEmail = $("#userEmail").val();
		
		if(userEmail) {
			$.ajax({
				url : "/join/duplicateCheck",
				type : "post",
				data : {"userEmail" : userEmail},
				dataType : "json",
				success : function(data/*result*/) {
					/*alert(result.data.totalCount);*/
					if(data.successYn == "Y") {
						alert("사용가능한 ID입니다.");
						$("#idCheckAt").val("Y");
					}else{
						alert(data.message);
						$("#idCheckAt").val("N");
					}
				}, error : function() {
					alert("error");
				}
			});
		}else{
			alert("ID를 입력해주세요.");
		}
		
		return false;
	});
	
	
	/*
	//이메일
	$("#domain").change(function() {
		let domain = $(this).val(); //this=#domain
		
		$("#emailDomain").val(domain);	
	});
	*/
	
	
});

//validation 체크
function regist(){
	//아이디 중복 검사 체크
	if($("#idCheckAt").val() != "Y") {
		alert("이메일 중복 검사를 해주세요.");
		return false;
	}else if(!$("#userEmail").val()){
		alert("이메일을 입력해주세요.");
		return false;
	}else if(!$("#userPhone").val()){
		alert("휴대폰 번호를 입력해주세요.");
		return false;
	}else if(!$("#userPwd").val()){
		alert("비밀번호를 입력해주세요.");
		return false;
	}else if(!$("#passwd_confirm").val()){
		alert("비밀번호 확인을 입력해주세요.");
		return false;
	}else if($("#userPwd").val() != $("#passwd_confirm").val()){
		alert("비밀번호와 비밀번호 확인 정보가 다릅니다.");
		return false;
	}
	
	if($("#userPwd").val()) {
		var pw = $("#userPwd").val(),
			message = "",
			//대소문자, 특수문자, 숫자는 8자리 이상 정규형
			passwordRules1 = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,30}$/,
			//대소문자, 숫자는 10자리 이상 정규형
			passwordRules2 = /^(?=.*[a-zA-Z])(?=.*[0-9]).{10,30}$/,
			result = false;
			
		if(pw.length < 10) {
			if(!passwordRules1.test(pw)) {
				message = "영문, 숫자, 특수문자 등 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상";
			}else{
				result = true;
			}
		}
		
		if(!passwordRules2.test(pw) && !result) {
			message = "영문, 숫자, 특수문자 등 3가지 사용시 8자 이상, 2가지 사용시 10자리 이상";
		}else{
			result = true;
		}
		
		if(message.length > 0) {
			alert(message + " 입력해주세요.");
			return false;
		}
	}			
}
</script>

</body>
</html>