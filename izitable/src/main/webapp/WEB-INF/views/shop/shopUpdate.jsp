<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 60%;}
</style>
</head>

<body>
<jsp:include page="../nav.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	

		<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn btn-lg"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

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

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
