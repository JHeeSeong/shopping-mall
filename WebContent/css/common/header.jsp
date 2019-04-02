<%@page import="com.hs.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
%>
<header>
	<div class="header_wrap">
		<div class="header_logo">
			<div>
				<a href="../main/main.jsp"><img
					src="../images/dailymonday_logo.png"></a>
			</div>
		</div>
		<div class="header_submenu">
			<div>
				<ul>
					<%
						if (memberDTO == null) {
					%>
					<li><a href="#">ORDER</a></li>
					<li><a href="#">CART</a></li>
					<li><a href="#">MY PAGE</a></li>
					<li><a href="../member/join.jsp">JOIN</a></li>
					<li><a href="../member/login.jsp">LOGIN</a></li>
					<%
						} else {
					%>
					<li><a href="../member/logout.jsp">LOGOUT</a></li>
					<li><a href="#">MODIFY</a></li>
					<li><a href="#">MY PAGE</a></li>
					<li><a href="#">CART</a></li>
					<li><a href="#">ORDER</a></li>
					<%
						}
					%>
				</ul>
			</div>
			<div class="header_search">
				<fieldset>
					<input type="text" size="20"><a href="#">SEARCH</a>
				</fieldset>
			</div>
		</div>
	</div>
</header>
<!-- ***************************************************** -->
<div class="blank"></div>
<!-- ***************************************************** -->
<aside class="menu_bar">
	<ul class="sub_menu">
		<li><a href="../main/cloth.jsp">NEW TODAY</a></li>
		<li><a href="../main/cloth.jsp">BEST50</a></li>
		<li><a href="../main/cloth.jsp">MONDAY STUDIO</a></li>
		<li><a href="../main/cloth.jsp">OUTER</a></li>
		<li><a href="../main/cloth.jsp">TOP</a></li>
		<li><a href="../main/cloth.jsp">PANTS</a></li>
		<li><a href="../main/cloth.jsp">SKIRTS</a></li>
		<li><a href="../main/cloth.jsp">DRESS</a></li>
		<li><a href="../main/cloth.jsp">BAG</a></li>
		<li><a href="../main/cloth.jsp">SHOES</a></li>
		<li><a href="../main/cloth.jsp">ACC</a></li>
		<li><a href="../main/cloth.jsp">JEWELRY</a></li>
		<li><a href="../main/cloth.jsp">SUMMER</a></li>
		<li><a href="../main/cloth.jsp">SALE</a></li>
		<br>
	</ul>

	<ul class="bold_bar">
		<li class="big_font"><a href="#">LOOKBOOK</a></li>
		<li class="big_font"><a href="#">COMMUNITY</a></li>
	</ul>

	<ul class="commu_bar">
		<li><a href="../notice/notice.jsp">NOTICE</a></li>
		<li><a href="../main/qna.jsp">Q&A</a></li>
		<li><a href="#">FAQ</a></li>
		<li><a href="#">REVIEW</a></li>
		<li><a href="#">DELAY</a></li>
		<li><a href="#">MODEL RECRUIT</a></li>
		<br>
	</ul>

	<ul class="daily_bar">
		<li class="big_font"><a
			href="https://www.instagram.com/dailymonday_korea/">+DAILY
				INSTAGRAM</a></li>
		<li class="big_font"><a
			href="https://www.facebook.com/dailymondaycom">+DAILY FACEBOOK</a></li>
	</ul>
</aside>