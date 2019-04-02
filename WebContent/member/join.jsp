<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>간편 회원가입</title>
<link href="../css/join/join.css" rel="stylesheet">
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
</head>
<script type="text/javascript">
	$(function() {
		$("#btn").click(function() {
			var id = $("#id").val();
			if (id.length < 2) {
				alert("ID는 2자리이상 입력하셔야 합니다.");
			}
			
			var xmlhttp;
			if(window.XMLHttpRequest){
				xmlhttp = new XMLHttpRequest();
			}else{
				xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
			}
			xmlhttp.onreadystatechange = function(){
				if(this.readyState==4 && this.status==200){
					if(this.responseText.trim()=="OK"){
						ch=true;
					}else{
						ch=false;
						alert("ID가 중복되었습니다.");
					}
				}
			}
			xmlhttp.open("GET", "memberIdCheck.jsp?id="+id);
			xmlhttp.send();

			var pw = $("#pw").val();
			if (pw.length < 4 || pw.length > 16) {
				alert("비밀번호는 4~16자로 설정하셔야 합니다.");
			}

			var pwc = $("#pwc").val();
			if (pw != pwc) {
				alert("비밀번호가 서로 일치하지 않습니다.");
			}

			var email = $("#email").val();
			var mc = 0;
			for (var i = 0; i < email.length; i++) {
				if (email.charAt(i) == "@") {
					mc = 30;
				}
			}
			if (mc != 30) {
				alert("잘못된 이메일입니다.");
			}

			var phone = $("#phone").val();
			var pc = 0;
			for (var i = 0; i < phone.length; i++) {
				if (phone.charAt(i) == "-") {
					pc = 30;
				}
			}
			if (pc != 30) {
				alert("전화번호를 입력하세요. 예) 02-0000-0000, 010-0000-0000");
			} else {
				if (phone.length < 13) {
					alert("'휴대폰번호'를 자리수에 맞게 입력하세요.예) 010-0000-0000");
				}
			}

			if ($("#info").prop("checked") == false || $("#person").prop("checked") == false) {
				alert("약관을 읽어보시고 동의하셔야 됩니다.");
			}
			
			$("#frm").submit();
		});
		$("#total_agree").click(function() {
			if ($(this).prop("checked") == true) {
				$("input:checkbox[value='agree']").prop("checked", true);
			} else {
				$("input:checkbox[value='agree']").prop("checked", false);
			}
		});
		$("#marketing").click(function() {
			if ($(this).prop("checked") == true) {
				$("input:checkbox[name='email']").prop("checked", true);
				$("input:checkbox[name='sms']").prop("checked", true);
				$("input:checkbox[name='app']").prop("checked", true);
			} else {
				$("input:checkbox[name='email']").prop("checked", false);
				$("input:checkbox[name='sms']").prop("checked", false);
				$("input:checkbox[name='app']").prop("checked", false);
			}
		});
		$("input:checkbox[name='info']").click(function() {
			$("#total_agree").prop("checked", false);
		});
		$("input:checkbox[name='person']").click(function() {
			$("#total_agree").prop("checked", false);
		});
		$("input:checkbox[name='marketing']").click(function() {
			$("#total_agree").prop("checked", false);
		});
		$("input:checkbox[name='email']").click(function() {
			$("#total_agree").prop("checked", false);
			$("#marketing").prop("checked", false);
		});
		$("input:checkbox[name='sms']").click(function() {
			$("#total_agree").prop("checked", false);
			$("#marketing").prop("checked", false);
		});
		$("input:checkbox[name='app']").click(function() {
			$("#total_agree").prop("checked", false);
			$("#marketing").prop("checked", false);
		});
	});
</script>
<body>
	<!-- header 시작 -->
	<%@ include file="../css/common/header.jsp"%>
	<section class="contents_wrap">
		<div class="join_wrap">
			<div class="total_join">
				<div class="title">
					DAILYMONDAY MEMBER JOIN
					<hr>
				</div>
			</div>
			<form id="frm" action="./joinProcess.jsp" method="post">
				<div class="info">
					<ul>
						<li class="input"><input type="text" id="name" name="name"
							placeholder="이름"></li>
						<li class="input"><input type="text" id="id" name="id"
							placeholder="아이디"></li>
						<li class="input"><input type="password" id="pw" name="pw"
							placeholder="비밀번호"></li>
						<li class="input"><input type="password" id="pwc" name="pwc"
							placeholder="비밀번호 확인"></li>
						<li class="input"><input type="text" id="email" name="email"
							placeholder="이메일"></li>
						<li class="ymd"><select name="yy" id="yy">
								<option>생년</option>
								<option>2017</option>
								<option>2016</option>
								<option>2015</option>
								<option>2014</option>
								<option>2013</option>
								<option>2012</option>
								<option>2011</option>
								<option>2010</option>
								<option>2009</option>
								<option>2008</option>
								<option>2007</option>
								<option>2006</option>
								<option>2005</option>
								<option>2004</option>
								<option>2003</option>
								<option>2002</option>
								<option>2001</option>
								<option>1999</option>
								<option>1998</option>
								<option>1997</option>
								<option>1996</option>
								<option>1995</option>
								<option>1994</option>
								<option>1993</option>
								<option>1992</option>
								<option>1991</option>
								<option>1989</option>
								<option>1988</option>
								<option>1987</option>
								<option>1986</option>
								<option>1985</option>
								<option>1984</option>
								<option>1983</option>
								<option>1982</option>
								<option>1981</option>
								<option>1979</option>
								<option>1978</option>
								<option>1977</option>
								<option>1976</option>
								<option>1975</option>
								<option>1974</option>
								<option>1973</option>
								<option>1972</option>
								<option>1971</option>
								<option>1969</option>
								<option>1968</option>
								<option>1967</option>
								<option>1966</option>
								<option>1965</option>
								<option>1964</option>
								<option>1963</option>
								<option>1962</option>
								<option>1961</option>
								<option>1959</option>
								<option>1958</option>
								<option>1957</option>
								<option>1956</option>
								<option>1955</option>
								<option>1954</option>
								<option>1953</option>
								<option>1952</option>
								<option>1951</option>
								<option>1949</option>
								<option>1948</option>
								<option>1947</option>
								<option>1946</option>
								<option>1945</option>
								<option>1944</option>
								<option>1943</option>
								<option>1942</option>
								<option>1941</option>
								<option>1939</option>
								<option>1938</option>
								<option>1937</option>
								<option>1936</option>
								<option>1935</option>
								<option>1934</option>
								<option>1933</option>
								<option>1932</option>
								<option>1931</option>
								<option>1929</option>
								<option>1928</option>
								<option>1927</option>
								<option>1926</option>
								<option>1925</option>
								<option>1924</option>
								<option>1923</option>
								<option>1922</option>
								<option>1921</option>
								<option>1920</option>
						</select><br> <select name="mm" id="mm">
								<option>월</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
						</select><br> <select name="dd" id="dd">
								<option>일</option>
								<option>1</option>
								<option>2</option>
								<option>3</option>
								<option>4</option>
								<option>5</option>
								<option>6</option>
								<option>7</option>
								<option>8</option>
								<option>9</option>
								<option>10</option>
								<option>11</option>
								<option>12</option>
								<option>13</option>
								<option>14</option>
								<option>15</option>
								<option>16</option>
								<option>17</option>
								<option>18</option>
								<option>19</option>
								<option>20</option>
								<option>21</option>
								<option>22</option>
								<option>23</option>
								<option>24</option>
								<option>25</option>
								<option>26</option>
								<option>27</option>
								<option>28</option>
								<option>29</option>
								<option>30</option>
								<option>31</option>
						</select></li>
						<li class="input"><input name="sex" class="gender"
							type="radio" value="m"><label> 남</label> <input type="radio"
							name="sex" class="gender" value="w"><label> 여</label></li>
						<li class="input"><input type="text" id="phone" name="phone"
							placeholder="휴대폰번호"></li>
				</div>
				<div class="explain">
					<ul>
						<li>* 회원가입에 필요한 최소한의 정보만 입력 받음으로써 고객님의 개인정보 수집을 최소화하고</li>
						<li>&nbsp;&nbsp;편리한 회원가입을 제공합니다.</li>
					</ul>
				</div>
				<div class="agree">
					<div class="agree_all">
						<label><input type="checkbox" name="total_agree"
							id="total_agree"> 전체동의</label>
					</div>
					<div class="agree_select">
						<div class="agree_contents">
							<ul>
								<li><label><input type="checkbox" name="info"
										id="info" value="agree"><b> 이용약관 </b></label><a href="#"><input
										id="view_btn" type="button" value="내용보기"></a></li>
								<li><label><input type="checkbox" name="person"
										id="person" value="agree"><b> 개인정보 수집 및 이용 안내 </b></label><a
									href="#"><input id="view_btn" type="button" value="내용보기"></a></li>
							</ul>
						</div>
						<hr>
						<div class="agree_marketing">
							<ul>
								<li class="marketing"><label><input type="checkbox"
										name="marketing" id="marketing" value="agree"><b>
											마케팅 수신동의</b></label> <span class="gray">( <input type="checkbox"
										name="email" id="email" value="agree"><b> 이메일</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="checkbox" name="sms" id="sms" value="agree"><b>
											SMS</b>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
										type="checkbox" name="app" id="app" value="agree"><b>
											앱Push알림</b>)
								</span></li>
								<li class="marketing_info"><span class="gray">쇼핑몰에서
										제공하는 신상품 소식/할인쿠폰을 무상으로 보내드립니다!<br> 단, 상품 구매 정보는 수신동의 여부
										관계없이 발송됩니다.<br>
								</span> <b>제공 동의를 하지 않으셔도 서비스 이용에는 문제가 없습니다.</b></li>
							</ul>
						</div>
					</div>
				</div>
				<div class="join">
					<input type="button" id="btn" value="회원가입">
				</div>
				<hr class="hr">
				<div class="use">
					<ul>
						<li>이용약관</li>
						<li><textarea cols="80" rows="10">인터넷 쇼핑몰 『 데일리먼데이 사이버 몰』회원 약관
제1조(목적)
이 약관은 데일리먼데이 회사(전자상거래 사업자)가 운영하는 데일리먼데이 사이버 몰(이하 "몰"이라 한다)에서 
제공하는 인터넷 관련 서비스(이하 "서비스"라 한다)를 이용함에 있어 사이버 몰과 이용자의 권리·의무
및 책임사항을 규정함을 목적으로 합니다.

* 「PC통신, 무선 등을 이용하는 전자상거래에 대해서도 그 성질에 반하지 않는 한 이 약관을 준
용합니다」

제2조(정의)
①"몰" 이란 데일리먼데이 회사가 재화 또는 용역(이하 "재화등"이라 함)을 이용자에게 제공하기 위하여 컴
퓨터등 정보통신설비를 이용하여 재화등을 거래할 수 있도록 설정한 가상의 영업장을 말하며, 아울
러 사이버몰을 운영하는 사업자의 의미로도 사용합니다.

②"이용자"란 "몰"에 접속하여 이 약관에 따라 "몰"이 제공하는 서비스를 받는 회원 및 비회원을 
말합니다.

③ '회원'이라 함은 "몰"에 개인정보를 제공하여 회원등록을 한 자로서, "몰"의 정보를 지속적으로 
제공받으며, "몰"이 제공하는 서비스를 계속적으로 이용할 수 있는 자를 말합니다.

④ '비회원'이라 함은 회원에 가입하지 않고 "몰"이 제공하는 서비스를 이용하는 자를 말합니다.

제3조 (약관등의 명시와 설명 및 개정) 
① "몰"은 이 약관의 내용과 상호 및 대표자 성명, 영업소 소재지 주소(소비자의 불만을 처리할 수 
있는 곳의 주소를 포함), 전화번호?모사전송번호?전자우편주소, 사업자등록번호, 통신판매업신고
번호, 개인정보관리책임자등을 이용자가 쉽게 알 수 있도록 데일리먼데이 사이버몰의 초기 서비스화면(전면)
에 게시합니다. 다만, 약관의 내용은 이용자가 연결화면을 통하여 볼 수 있도록 할 수 있습니다.</textarea></li>
					</ul>
				</div>
				<div class="private">
					<ul>
						<li><b>개인정보 수집·이용</b></li>
						<li>
							<table class="private_table">
								<tr>
									<th>구분</th>
									<th class="table_title">목적</th>
									<th class="table_title">항목</th>
									<th class="table_title">보유기간</th>
								</tr>
								<tr>
									<th>필수정보</th>
									<td>회원제 서비스 이용/본인확인</td>
									<td>이름, 아이디, 비밀번호, 이메일,<br>휴대폰, 생일, 성별
									</td>
									<td>회원탈퇴 후 5일까지</td>
								</tr>
							</table>
							<table class="private_table_2">
								<tr>
									<th>선택정보</th>
									<td class="table_title">마케팅 활용(이벤트,맞춤형 광고)</td>
									<td class="table_title">휴대폰, 이메일, 쿠키정보</td>
									<td class="table_title">회원탈퇴 후 5일까지</td>
								</tr>
							</table>
						</li>
					</ul>
				</div>
			</form>
			<div class="end">
				<ul>
					<li><b>귀하께서는 쇼핑몰에 위와 같이 수집하는 개인정보에 대해, 동의하지 않거나 개인 정보를
							기재하지 않음으로써 거부할 수 있습니다.<br> 다만, 이때 회원에게 제공되는 서비스가 제한될 수 있습니다.
					</b></li>
				</ul>
			</div>
		</div>
	</section>
	<!-- footer 시작 -->
	<%@ include file="../css/common/footer.jsp"%>
</body>
</html>