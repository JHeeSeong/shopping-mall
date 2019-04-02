<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>모던밸런스 데일리먼데이</title>
<link href="../css/main/main.css" rel="stylesheet">
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
<body>
	<!-- header 시작 -->
	<%@ include file="../css/common/header.jsp"%>
	<section class="contents_wrap">
		<section class="contents_board">
			<article class="contents_1">
				<img src="../images/main_4.jpg">
			</article>
			<article class="contents_2">
				<ul>
					<li><img src="../images/ban_1-5.jpg"></li>
					<li>
						<div>
							<ul>
								<li class="image_2"><img src="../images/ban_2.jpg"></li>
								<li class="image_2"><img src="../images/ban_3.jpg"></li>
							</ul>
						</div>
						<div class="board">
							<div class="customer">
								<ul>
									<li>CUSTOMER CENTER<br> <br> <sapn
											class="number_big">T. 1644-5426</sapn><br> <br>
										MON-THU 10am - 02am<br> FRI 10am - 09pm SAT/SUN/HOLIDAY
										OFF<br>
									</li>
								</ul>
							</div>
							<div class="notice">
								<ul>
									<li>NOTICE <span class="more"><a class="link" href="../notice/notice.jsp">+ more</a></span></li>
								</ul>
								<ul>
									<li class="gray"><hr> <br>- 2017 데일리먼데이 빅세일<br>
										<br> - 데일리먼데이 9월 사은품 안내<br> <br> - 데일리먼데이 홍대 쇼룸
										플리마켓</li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</article>
		</section>
		<!-- footer 시작 -->
		<%@ include file="../css/common/footer.jsp"%>
	</section>
</body>
</html>