<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 로그인</title>
<link href="../css/join/login.css" rel="stylesheet">
<link href="../css/common/header.css" rel="stylesheet">
<link href="../css/common/footer.css" rel="stylesheet">
<script type="text/javascript">
	$(function() {
		$("#login").click(function() {
			$("#frm").submit();
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
				<form id="frm" action="./loginProcess.jsp" method="post">
				<div>
					<div class="login">
						<ul>
							<li class="input"><label>ID </label><input type="text" name="id" id="id"
								size="40"></li>
							<li class="input"><label>PW </label><input type="password" name="pw" id="pw"
								size="40"></li>
							<li class="security"><input type="checkbox"><label>보안접속</label>
								<a href="#"><input class="login_btn" type="submit"
									value="LOGIN"></a></li>
							<li class="find"><a href="../member/memberFind.jsp">> FIND ID</a></li>
							<li class="find"><a href="../member/memberFind.jsp">> FIND PASSWORD</a></li>
						</ul>
					</div>
					<div class="nonmember">
						<ul>
							<li><span class="non_info">NON MEMBER</span></li>
							<li>비회원으로 주문하신 분도 조회가 가능합니다</li>
							<li><input type="button" name="login" id="login" value="NONMEMBER"></li>
						</ul>
					</div>
				</div>
				</form>
			</div>
			<div class="join_wrap">
				<div class="left">
					<div class="newjoin">
						<table class="table_1">
							<tr>
								<th>NEW JOIN</th>
								<td>회원가입시 적립금 2,000point를 즉시 지급해드립니다.</td>
							</tr>
						</table>
					</div>
					<div class="membership">
						<table class="table_2">
							<tr>
								<th>MEMBERSHIP</th>
								<td>> 멤버쉽 등급에 따라 구매 결제시 2%~10% 즉시할인.</td>
							</tr>
							<tr>
								<th></th>
								<td class="table_margin">> 모든 상품 결제금액의 1% 적립<br>
									&nbsp;&nbsp;&nbsp;지급받으신 적립금은 구매시 사용하실 수 있습니다.
								</td>
							</tr>
							<tr>
								<th></th>
								<td class="table_margin">>> 5만원이상 구매시 무료배송</td>
							</tr>
							<tr>
								<th></th>
								<td class="table_margin">>> 데일리먼데이 이벤트 내용&게릴라 할인쿠폰 제공<br>
									&nbsp;&nbsp;&nbsp;(메일,sMS 수신동의하신 고객님에 한함)
								</td>
							</tr>
							<tr>
								<th></th>
								<td class="table_margin"><a href="../member/join.jsp"><input
										type="submit" value="JOIN"></a></td>
							</tr>
						</table>
					</div>
				</div>
			</div>
		</article>
	</section>
	<!-- footer 시작 -->
	<%@ include file="../css/common/footer.jsp"%>
</body>
</html>