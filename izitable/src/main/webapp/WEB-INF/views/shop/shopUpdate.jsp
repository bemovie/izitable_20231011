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
		
			<button class="btn" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

		</div>
		
		<br>
		
		<form method="post">
			<div>
			
				<div class="inline">
					<label>이메일</label><br>
					<input type="text" name="shopEmail" value="${item.shopEmail}">
				</div>
				
				<div class="inline">
					<label>매장명</label><br>
					<input type="text" name="compName" value="${item.compName}">
				</div>
				
				<div class="inline">
					<label>매장 번호(사업자번호)</label><br>
					<input type="text" name="compNum" value="${item.compNum}">
				</div>
				
				<div class="inline">
					<label>매장 사장님명</label><br>
					<input type="text" name="compCeo" value="${item.compCeo}">
				</div>
				
				
				<div class="inline">
					<label>매장 전화번호</label><br>
					<input type="text" name="compCall" value="${item.compCall}">
				</div>
				
				<div class="inline">
					<label>매장 구주소</label><br>
					<input type="text" name="compAddr1" value="${item.compAddr1}">
				</div>
				
				<div class="inline">
					<label>매장 신주소(도로명주소)</label><br>
					<input type="text" name="compAddr2" value="${item.compAddr2}">
				</div>
				
				<div class="inline">
					<label>매장 소개</label><br>
					<input type="text" name="compIntro" value="${item.compIntro}">
				</div>
				
				<br>
				
				<div class="inline">
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
