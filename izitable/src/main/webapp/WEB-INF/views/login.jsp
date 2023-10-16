<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px;}
</style>
</head>

<body style="text-align: center; /*border: 2px solid black*/">

<jsp:include page="nav.jsp"></jsp:include>

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
			<div class="btn-cont">
								<a class="btn-kakao" href="#" data-type="login">
									<img src="http://k.kakaocdn.net/14/dn/btroDszwNrM/I6efHub1SN5KCJqLm1Ovx1/o.jpg" width="200" alt="카카오 로그인 버튼"/>
								</a>
			</div>
			<div>
				<img src="${pageContext.request.contextPath}/resources/image/naverlogin.png" width="200px">
			</div>
			
			<br>
			<br>
			
			<div>
				회원 가입이 필요하신가요? <button class="btn"><a href="/siteUseAgree">회원가입</a></button>	
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

<form id="frmLogin" name="frmLogin" method="post" action="/login">
	<input type="hidden" name="loginType" value=""/>
	<input type="hidden" id="snsId" name="id"/>
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
Kakao.init('2a3e332780189603d4027c2c218ee6a4'); // 본인 Javascript key

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
					$("#snsId").val(response.id);
					$("#frmLogin").submit();
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
</script>

<jsp:include page="footer.jsp"></jsp:include>

</body>
</html>