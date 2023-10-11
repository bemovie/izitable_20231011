<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>

<!-- �������� CSS -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black-translucent">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, viewport-fit=cover" />
<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css" rel="stylesheet"> -->

<!-- BBS Style -->
<link href="/asset/BBSTMP_0000000000001/style.css" rel="stylesheet" />
<!-- ���� Style -->
<link href="/asset/LYTTMP_0000000000000/style.css" rel="stylesheet" />
<!-- �������� CSS -->

<style>
join_input {
	margin-bottom: 30px;
}
</style>

<meta charset="UTF-8">

<jsp:include page="nav.jsp"></jsp:include>

<title>IZITABLE - �������̺� : ȸ������</title>
</head>
<body>

	<div class="container" style="margin: 0 auto; width: 50%; border: 2px solid black;">
		<div style="text-align: center;">
			<h3>ȸ�� ����</h3>
		</div>
		<!-- <form method="post" action="add"> --> <!-- jsp�� ������ ����, ��¿ �� ���� form tag�� �޾��� ������ �ʿ� -->
		<!-- <form method="post" name="signup_form"> --> <!-- jsp�� ������ ����, ��¿ �� ���� form tag�� �޾��� ������ �ʿ� -->
		<form method="post" >
			<div>
			
				<div class="join_input">
					<label>�̸���</label><br>
					<input type="text" name="userEmail" placeholder="�̸����� �Է����ּ���">
					<button class="btn">�̸��� ����</button>
				</div>
				
				<div class="join_input">
					<label>�޴��� ��ȣ</label><br>
					<input type="text" name="userPhone" placeholder="���ڸ� �Է����ּ���">
				</div>
				
				<!--
				<div>
					<label>�޴��� ��ȣ ����</label>
					<input type="hidden" name="userPhoneCert">
				</div>
				-->
				
				<div class="join_input">
					<label>��й�ȣ</label><br>
					<input type="password" name="userPwd" placeholder="��й�ȣ�� �Է����ּ���">
					<button type="button" class="password_check btn" data-msg="Hello1" data-for="passwd">Ȯ��</button>
				</div>
				
				<div class="join_input">
					<label>��й�ȣ Ȯ��</label><br>
					<input type="password" name="passwd_confirm" placeholder="��й�ȣ�� �ٽ� �� �� �Է����ּ���">
					<button type="button" class="password_check btn" data-msg="Hello2" data-for="passwd_confirm">Ȯ��</button>
				</div>
				
				����, ����, Ư������ �� 2���� �̻��� �����Ͽ� 8~20�ڸ��� �������ּ���.
	
				<div class="join_input">
					<button type="submit" id="join" class="btn">���</button>
					<a href="${pageContext.request.contextPath}"><button type="button" class="btn">ó������</button></a>
				</div>
				
			</div>
		</form>
	</div>

</body>
</html>