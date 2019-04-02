<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 로그인</title>
<link href="../css/join/memberFind.css" rel="stylesheet">
<link href="../css/common/header.css" rel="stylesheet">
<link href="../css/common/footer.css" rel="stylesheet">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
	$(function() {
		$("#findBtn").click(function() {
			$.post("../member/memberFindProcess.jsp",
			{
				name : $("#name1").val() ,
				email : $("#email1").val()
			},
			function(data){
				alert(data.trim());
			});
		});
	});
</script>
</head>
<body>
	<!-- header 시작 -->
	<%@ include file="../css/common/header.jsp"%>
	<section class="contents_wrap">
		<article class="contents_login">
			<div class="login_wrap">
				<form id="frm" name="frm" action="../member/memberFindProcess.jsp" method="post">

					<h1 id="find_title">아이디/비밀번호 찾기</h1>
					<p id="find_info">
						회원가입 시, 입력하신 회원정보 또는 본인인증으로 아이디와 비밀번호를 확인할 수 있습니다.<br> 아이디와
						비밀번호는 가입 시 적어주신 이메일로 보내드립니다.
					</p>
					<h3 id="find_h3">+ 본인확인용 정보로 찾기</h3>

					<table id="table">
						<tr id="name">
							<th width="135">이름</th>
							<td><input type="text" name="name" id="name1"></td>
						</tr>
						<tr id="email">
							<th>이메일</th>
							<td><input type="text" name="email" id="email1"></td>
						</tr>
						<tr>
							<td colspan="2">
							<input type="button" id="findBtn" name="findBtn" value="확인"></td>
							<td></td>
						</tr>
					</table>
				</form>
			</div>
		</article>
	</section>
	<!-- footer 시작 -->
	<%@ include file="../css/common/footer.jsp"%>
</body>
</html>