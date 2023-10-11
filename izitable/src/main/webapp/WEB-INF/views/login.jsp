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
<!-- 문교수님 CSS -->

<meta charset="UTF-8">

<jsp:include page="nav.jsp"></jsp:include>

</head>
<body style="text-align: center; /*border: 2px solid black*/">

<!-- <h2 class="icon1">로그인</h2> -->

<div id="content">
<div class="container">
<div id="contents">
<div id="bbs_wrap">	
<div class="login_box">
<div class="mem_login">
<div class="smartshool login">
<div class="login_inp_wrap">
<div class="login_inp">
		
		<form method="post">
		<div>
		
			<div class="form-group">
				<label>이메일:</label>
				<input type="text" id="email" name="userEmail" class="inp">
			</div>
		
			<div>
				<label>비밀번호:</label>
				<input type="password" id="pwd" name="userPwd" class="inp">
			</div>
			
			<div>
				<input type="checkbox" id="loginType" name="loginType" value="shop" class="inp">매장 로그인
			</div>
			
			<script>
				document.querySelector("#loginType").addEventListener("click", function(){
					if(document.querySelector("#loginType").checked == true) {
						document.querySelector("#email").name="shopEmail"
						document.querySelector("#pwd").name="shopPwd"
					}
					else {
						document.querySelector("#email").name="userEmail"
						document.querySelector("#pwd").name="userPwd"
					}
				})
			</script>
			
			<div>
				<button type="submit" class="btn" style="margin: 5px 0px; width: 200px">로그인</button>
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/image/kakaologin.png" width="200px">
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/image/naverlogin.png" width="200px">
			</div>
		</div>
		</form>
	</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</div>
</body>
</html>