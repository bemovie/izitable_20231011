<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px;}
body {margin: 0; padding: 0; margin-top: 50px;}

</style>
</head>

<body>
<jsp:include page="../nav.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	
	
	<div style="/*border: 2px solid black;*/ text-align: center;">
		
			<button class="btn btn-lg" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

	</div>
	
	<br>
		
		<div>
			총 예약 수 <fmt:formatNumber value="${pager.total}" pattern="#"></fmt:formatNumber> 건
		</div>
		
		<div>
			<table class="list_table">
				<thead>
					<tr>
						<th>예약번호</th>
						<th>회원이름</th>
						<th>회원이메일</th>
						<th>연락처</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th>예약인원</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
							<tr>
								<td>${item.bookingNo}</td>
								<td>${item.userName}</td>
								<td>${item.userEmail}</td>
								<td>${item.userPhone}</td>
								<td><fmt:formatDate value="${item.bookingDate}" pattern="yyyy-MM-dd"/></td>
								<td>${item.bookingTime}:00</td>
								<td>${item.bookingMemNum}</td>
								<td>
									<button><a href="/shop/booking/${item.shopNo}/delete/${item.bookingNo}" class="btn btn-warning btn-sm">취소</a></button>
								</td>
							</tr>
					</c:forEach>	
					
					<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="8">검색 된 예약이 없습니다</td>
					</tr>
					</c:if>
					
				</tbody>
				
			</table>
		</div>
	</div>
</div>
</div>
</div>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
