<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
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

<jsp:include page="../nav.jsp"></jsp:include>

</head>
<body>
<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	
		<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn btn-lg" style="margin-right: 30px;"><a href="/user/update/${sessionScope.user.userNo}"><h3>정보 변경</h3></a></button>
			<button class="btn"><a href="/user/booking/${sessionScope.user.userNo}"><h3>예약 목록</h3></a></button>

		</div>
	
		<div>
			<h3>회원 정보 변경</h3>
		</div>
		
		<form method="post">
			<div>
			
				<div>
					<label>이메일</label><br>
					<input type="text" name="userEmail" value="${item.userEmail}">
				</div>
				
				<div>
					<label>휴대폰 번호</label><br>
					<input type="text" name="userPhone" value="${item.userPhone}">
				</div>
				
				<div>
					<label>휴대폰 번호 인증</label><br>
					<input type="hidden" name="userPhoneCert">
				</div>
				
				<br>
	
				<div>
					<button type="submit" id="update" class="btn">변경 완료</button>
				</div>

			</div>
		</form>
	</div>
</div>
</div>
</div>
</body>
</html>
