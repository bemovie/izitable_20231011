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
						<th>월요일</th>
						<th>화요일</th>
						<th>수요일</th>
						<th>목요일</th>
						<th>금요일</th>
						<th>토요일</th>
						<th>일요일</th>
						<th>관리</th>
					</tr>
				</thead>
				<tbody>
					<form method="post" action="shopupdate/${item.shopNo}">
					<c:forEach var="hour" begin="0" end="23" step="1">
							<tr>
								<td><input type="checkbox" name="mon" value="${hour}">${hour}:00</td>
								<td><input type="checkbox" name="tue" value="${hour}">${hour}:00</td>
								<td><input type="checkbox" name="wed" value="${hour}">${hour}:00</td>
								<td><input type="checkbox" name="thu" value="${hour}">${hour}:00</td>
								<td><input type="checkbox" name="fri" value="${hour}">${hour}:00</td>
								<td><input type="checkbox" name="sat" value="${hour}">${hour}:00</td>
								<td><input type="checkbox" name="sun" value="${hour}">${hour}:00</td>
							</tr>
					</c:forEach>
					<!-- 
							<tr>
								<td>2:00</td>
								<td>2:00</td>
								<td>2:00</td>
								<td>2:00</td>
								<td>2:00</td>
								<td>2:00</td>
								<td>2:00</td>
							</tr>
							<tr>
								<td>3:00</td>
								<td>3:00</td>
								<td>3:00</td>
								<td>3:00</td>
								<td>3:00</td>
								<td>3:00</td>
								<td>3:00</td>
							</tr>
								
								<td>3:00</td>
								<td>4:00</td>
								<td>5:00</td>
								<td>6:00</td>
								<td>7:00</td>
								<td>8:00</td>
								<td>9:00</td>
								<td>10:00</td>
								<td>11:00</td>
								<td>12:00</td>
								<td>13:00</td>
								<td>14:00</td>
								<td>15:00</td>
								<td>16:00</td>
								<td>17:00</td>
								<td>18:00</td>
								<td>19:00</td>
								<td>20:00</td>
								<td>21:00</td>
								<td>22:00</td>
								<td>23:00</td>
								<td>00:00</td> -->
								
						</form>	
					
				</tbody>
			</table>
		</div>
	</div>
</div>
</div>
</div>
</body>
</html>
