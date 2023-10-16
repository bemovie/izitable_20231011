<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px;}
</style>
</head>

<body>

<jsp:include page="../nav.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	
	
		<div style="/*border: 2px solid black;*/ text-align: center;">
			
				<button class="btn" style="margin-right: 30px;"><a href="/admin/userlist/${sessionScope.shop.shopNo}"><h3>회원 관리</h3></a></button>
				<button class="btn btn-lg" style="margin-right: 30px;"><a href="/admin/shoplist/${sessionScope.shop.shopNo}"><h3>매장 관리</h3></a></button>
				<button class="btn" style="margin-right: 30px;"><a href="/admin/bookinglist/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
								
		</div>
		
		<br>		

		<div>
			총 매장 수 <fmt:formatNumber value="${pager.total}" pattern="#"></fmt:formatNumber> 곳
		</div>
		
		<div>
			<table class="list_table" style="text-align: center;">
				<thead>
					<tr>
						<th width="60px">매장번호</th>
						<th width="250px">이메일</th>
						<th width="100px">매장명</th>
						<th width="400px">주소</th>
						<th width="100px">전화번호</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
						<form method="post" action="/admin/shopupdate/${item.shopNo}">
							<tr>
								<td>${item.shopNo}</td>
								<td><input type="text" name="shopEmail" value="${item.shopEmail}" size="24"></td>
								<td><input type="text" name="compName" value="${item.compName}" size="14"></td>
								<td><input type="text" name="compAddr2" value="${item.compAddr2}" size="37"></td>
								<td><input type="text" name="compCall" value="${item.compCall}" size="13"></td>
								<td>
									<button type="submit" class="btn btn-danger btn-sm">수정</button>
									<button><a href="shopdelete/${item.shopNo}" class="btn btn-warning btn-sm">삭제</a></button>
								</td>
							</tr>
						</form>	
					</c:forEach>
					
					<c:if test="${list.size() < 1}">
					<tr>
						<td colspan="5">검색 된 회원이 없습니다</td>
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
