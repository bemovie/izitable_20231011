<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
<jsp:include page="../header.jsp"></jsp:include>
</head>

<body>

<jsp:include page="../nav.jsp"></jsp:include>

	<div>
		예약이 완료되었습니다.
	</div>
	<div>
		<button><a href="${pageContext.request.contextPath}/user/booking/${sessionScope.user.userNo}">예약 내용 확인</a></button>
	</div>
	
	<jsp:include page="../footer.jsp"></jsp:include>
	
</body>
</html>