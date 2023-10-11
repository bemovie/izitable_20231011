<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<style>

#navi {
	margin:0 auto;
	width: 100%;
	height: 100px;
	border: 2px solid black;
}

#logo {
	margin: 10px;
 	float: left;
 	width: 20%;
 	/* border: 1px solid red; */
}

#keyword {
	margin: 10px;
	float: left;
	width: 50%;
	/* border: 1px solid red; */
}

#input {
	width: 100%;
}

#search {
	margin: 10px;
	float: left;
	width: 5%;
	/* border: 1px solid red; */
}

#login {
	margin: 10px;
	float: right;
	width: 15%;
	/* border: 1px solid red; */
}
</style>

<div id="navi">

<div id="logo">
<a href="${pageContext.request.contextPath}/"><img src="${pageContext.request.contextPath}/resources/image/IZITABLE_logo.png" width="150px"></a>
</div>


	<div id="keyword">
		<input id="input" type="text" name="keyword" value="${pager.keyword}">
	</div>
	<div id="search"> <!-- col-1은 12에서 1만큼 사용 -->
		<button class="btn">검색</button>
	</div>


<div></div>
<c:if test="${sessionScope.user == null and sessionScope.shop == null}"> <!-- session에 있는 정보 꺼내옴 -->
	<div id="login">
		<button class="btn btn-sm"><a href="/login">로그인</a></button>
		<button class="btn btn-sm"><a href="/siteUseAgree">회원가입</a></button>		
	</div>
</c:if>
<c:if test="${sessionScope.user != null or sessionScope.shop != null}">
	<div id="login">
		<button class="btn btn-sm"><a href="/logout">로그아웃</a></button>
		<c:if test="${sessionScope.user != null}">
			<c:choose>
				<c:when test="${sessionScope.user.userNo <= 0}">
					<button class="btn btn-sm"><a href="/admin/userlist">${sessionScope.user.userEmail}</a></button>
				</c:when>
				<c:otherwise>
					<button class="btn btn-sm"><a href="/user/booking/${sessionScope.user.userNo}">${sessionScope.user.userEmail}</a></button>
				</c:otherwise>
			</c:choose>
		</c:if>
		<c:if test="${sessionScope.shop != null}">
			<button class="btn btn-sm"><a href="/shop/booking/${sessionScope.shop.shopNo}">${sessionScope.shop.shopEmail}</a></a></button>
		</c:if>
	</div>	
</c:if>

</div>