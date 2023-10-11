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
<div class="container">
<div id="contents">
<div id="bbs_wrap">	
	
	<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

	</div>
		
		<div>
			총 예약 수 <fmt:formatNumber value="${pager.total}" pattern="#"></fmt:formatNumber> 건
		</div>
		
		<div>
			<table>
				<thead>
					<tr>
						<th>예약번호</th>
						<th>회원번호</th>
						<th>회원이메일</th>
						<th>연락처</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>예약테이블</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
						<form method="post" action="shopupdate/${item.shopNo}">
							<tr>
								<td>${item.bookingNo}</td>
								<td>${item.userNo}</td>
								<td>${item.userEmail}</td>
								<td>${item.userPhone}</td>
								<td><input type="date" name="bookingDate" value="<fmt:formatDate value="${item.bookingDate}" pattern="yyyy-MM-dd"/>"></td>
								<%-- <fmt:formatDate value="${item.bookingDate}" pattern="yyyy년 MM월 dd일"/> --%>
								<td><input type="text" name="bookingTime" value="${item.bookingTime}"></td>
								<td><input type="number" name="bookingMemNum" value="${item.bookingMemNum}"></td>
								<td>
									<button><a href="update/${item.bookingNo}" class="btn btn-warning btn-sm">수정</a></button>
									<button><a href="delete/${item.bookingNo}" class="btn btn-warning btn-sm">취소</a></button>
								</td>
							</tr>
						</form>	
					</c:forEach>	
					
					<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="5">검색 된 예약이 없습니다</td>
					</tr>
					</c:if>
					
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>
