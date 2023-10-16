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
		
			<button class="btn" style="margin-right: 30px;"><a href="/shop/booking/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
			<button class="btn btn-lg" style="margin-right: 30px;"><a href="/shop/setting/${sessionScope.shop.shopNo}"><h3>매장 설정</h3></a></button>
			<button class="btn"><a href="/shop/update/${sessionScope.shop.shopNo}"><h3>정보 변경</h3></a></button>

	</div>
	
	<br>
	
	<h3>테이블 등록</h3>
		
		<div>
			<form method="post" action="/shop/setting/${sessionScope.shop.shopNo}/addtable">
				
				<span class="row mb-3">
					<label class="col-3">인용:</label>
					<span class="col">
						<select name="number">
							<option value="2">2인용</option>
							<option value="4">4인용</option>
							<option value="6">6인용</option>

						</select>
					</span>
				</span>
				
				<span class="row mb-3">
					<label class="col-3">테이블 이름:</label>
					<span class="col">
						<input type="text" name="name" class="form-control">
					</span>
				</span>
				
				<span class="row mb-3">
					<span class="col"></span>
					<span class="row col">
						<button type="submit" class="btn btn-primary">등록</button>
					</span>
					<span class="col"></span>
					<span class="row col">
						<a href="list" class="row"><button type="button" class="btn btn-secondary">취소</button></a>
					</span>
					<span class="col"></span>
				</span>			
			</form>
		</div>
		
		<br>
		
		<h3 class="mt-2">테이블 목록</h3>
		<div class="mb-2 px-3">
			<table class="list_table">
				<thead class="table-dark">
					<tr>
						<th class="col">구분번호</th>
						<th class="col">테이블 이름</th>
						<th class="col">수용인원</th>
						<th class="col">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${tablelist.size() < 1}">
						<tr>
							<td colspan="5">등록 된 영업시간이 없습니다</td>					
						</tr>
					</c:if>
					<c:forEach var="item" items="${tablelist}">
						<tr>
							<td>${item.tableNo}</td>
							<td>${item.name}</td>
							<td>${item.number}</td>
							<td><a href="/shop/setting/${item.shopNo}/deleteTable/${item.tableNo}" class="btn btn-outline-danger btn-sm">삭제</a>							
						</tr>
					</c:forEach>					
				</tbody>
			</table>
		</div>
		
		<br>
	
	<h3>시간대 등록</h3>
		
		<div>
			<form method="post" action="/shop/setting/${sessionScope.shop.shopNo}/addtime">
				
				<span class="row mb-3">
					<label class="col-3">요일:</label>
					<span class="col">
						<select name="day">
							<option value="2">월요일</option>
							<option value="3">화요일</option>
							<option value="4">수요일</option>
							<option value="5">목요일</option>
							<option value="6">금요일</option>
							<option value="7">토요일</option>
							<option value="1">일요일</option>
						</select>
					</span>
				</span>
				
				<span class="row mb-3">
					<label class="col-3">영업 시간대:</label>
					<span class="col">
						<input type="number" name="hour" min="0" max="23" class="form-control"> 시
					</span>
				</span>
				
				<span class="row mb-3">
					<span class="col"></span>
					<span class="row col">
						<button type="submit" class="btn btn-primary">등록</button>
					</span>
					<span class="col"></span>
					<span class="row col">
						<a href="list" class="row"><button type="button" class="btn btn-secondary">취소</button></a>
					</span>
					<span class="col"></span>
				</span>			
			</form>
		</div>
		
		<br>

	<h3 class="mt-2">시간대 목록</h3>
		<div class="mb-2 px-3">
			<table class="list_table">
				<thead class="table-dark">
					<tr>
						<th class="col">구분번호</th>
						<th class="col">요일</th>
						<th class="col">시간대</th>
						<th class="col">관리</th>
					</tr>
				</thead>
				<tbody>
					<c:if test="${timelist.size() < 1}">
						<tr>
							<td colspan="5">등록 된 영업시간이 없습니다</td>					
						</tr>
					</c:if>
					<c:forEach var="item" items="${timelist}">
						<tr>
							<td>${item.timeNo}</td>
							<td>
							<c:choose>
								<c:when test="${item.day eq 1}">일요일</c:when>
								<c:when test="${item.day eq 2}">월요일</c:when>
								<c:when test="${item.day eq 3}">화요일</c:when>
								<c:when test="${item.day eq 4}">수요일</c:when>
								<c:when test="${item.day eq 5}">목요일</c:when>
								<c:when test="${item.day eq 6}">금요일</c:when>
								<c:when test="${item.day eq 7}">토요일</c:when>
							</c:choose>
							
							</td>
							<td>${item.hour}:00</td>
							<td><a href="/shop/setting/${item.shopNo}/deleteTime/${item.timeNo}" class="btn btn-outline-danger btn-sm">삭제</a>							
						</tr>
					</c:forEach>					
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
