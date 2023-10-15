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
			
				<button class="btn" style="margin-right: 30px;"><a href="/admin/userlist"><h3>회원 관리</h3></a></button>
				<button class="btn" style="margin-right: 30px;"><a href="/admin/shoplist"><h3>매장 관리</h3></a></button>
				<button class="btn btn-lg" style="margin-right: 30px;"><a href="/admin/bookinglist"><h3>예약 관리</h3></a></button>
				
		</div>
		
		<br>
		
		<div>
			총 예약 수 <fmt:formatNumber value="${pager.total}" pattern="#"></fmt:formatNumber> 건
		</div>
		
		<div>
			<table class="list_table" style="text-align: center;">
				<thead>
					<tr>
						<th width="60px">예약번호</th>
						<th>회원번호</th>
						<th>매장번호</th>
						<th>예약날짜</th>
						<th>예약시간</th>
						<th width="60px">예약인원</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
						<form method="post" action="/admin/bookingupdate/${item.bookingNo}">
							<tr>
								<td>${item.bookingNo}</td>
								<td>${item.userNo}</td>
								<td>${item.shopNo}</td>
								<td><input type="text" name="bookingDate" value="<fmt:formatDate value="${item.bookingDate}" pattern="yyyy-MM-dd" />"></td>
								<td><input type="text" name="bookingTime" value="${item.bookingTime}:00"></td>
								<td><input type="text" name="bookingMemNum" value="${item.bookingMemNum}" size="5"></td>
								
								<td>
									<button type="submit" class="btn btn-danger btn-sm">수정</button>
									<button><a href="userdelete/${item.bookingNo}" class="btn btn-warning btn-sm">삭제</a></button>
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

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
