<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
<style>
#bbs_wrap {min-height: 608px; margin-top: 50px;}
</style>
</head>

<body>

<jsp:include page="../nav2.jsp"></jsp:include>

<div id="content">
<div class="container" style="margin: 0 auto; width: 1200px;">
<div id="contents">
<div id="bbs_wrap">	
	
		<div style="/*border: 2px solid black;*/ text-align: center;">
			
				<button class="btn btn-lg" style="margin-right: 30px;"><a href="/admin/userlist/${sessionScope.shop.shopNo}"><h3>회원 관리</h3></a></button>
				<button class="btn" style="margin-right: 30px;"><a href="/admin/shoplist/${sessionScope.shop.shopNo}"><h3>매장 관리</h3></a></button>
				<button class="btn" style="margin-right: 30px;"><a href="/admin/bookinglist/${sessionScope.shop.shopNo}"><h3>예약 관리</h3></a></button>
				
		</div>
		
		<br>
		
		<div>
			총 회원 수 <fmt:formatNumber value="${pager.total}" pattern="#"></fmt:formatNumber> 명
		</div>
		
		<div>
			<table class="list_table" style="text-align: center;">
				<thead>
					<tr>
						<th>회원번호</th>
						<th>회원이름</th>
						<th>이메일</th>
						<th>전화번호</th>
						<th>가입날짜</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="item" items="${list}">
						<form method="post" action="/admin/userupdate/${item.userNo}">
							<tr>
								<td>${item.userNo}</td>
								<td><input type="text" name="userName" value="${item.userName}"></td>
								<td><input type="text" name="userEmail" value="${item.userEmail}"></td>
								<td><input type="text" name="userPhone" value="${item.userPhone}"></td>
								<td><input type="date" name="userRegDate" value="<fmt:formatDate value="${item.userRegDate}" pattern="yyyy-MM-dd" />"></td>
								
								<td>
									<button type="submit" class="btn btn-danger btn-sm btn-mod">수정</button>
									<button><a href="userdelete/${item.userNo}" class="btn btn-warning btn-sm btn-del">삭제</a></button>
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

<script>
$(document).ready(function(){
	//변경
	$(".btn-mod").click(function(){
		alert('변경이 완료되었습니다');
	});
});

$(document).ready(function(){
	//삭제
	$(".btn-del").click(function(){
		if(!confirm('삭제하시면 복구할 수 없습니다. \n 정말로 삭제하시겠습니까?')){
	        return false;
	    }
	});
});
</script>

<jsp:include page="../footer.jsp"></jsp:include>

</body>
</html>
