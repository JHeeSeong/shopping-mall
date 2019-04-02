<%@page import="com.hs.notice.NoticeDTO"%>
<%@page import="com.hs.notice.NoticeDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	int number = 0;
	try {
		number = Integer.parseInt(request.getParameter("number"));
	} catch (Exception e) {
		number = 0;
	}
	NoticeDAO noticeDAO = new NoticeDAO();
	NoticeDTO noticeDTO = noticeDAO.selectOne(number);
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 수정</title>
<link href="../css/notice/notice_view.css" rel="stylesheet">
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
<!-- smartEditor -->
<script type="text/javascript" src="/web_6/SE2/js/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript">
	$(function() {
		$("#writeBtn").click(function() {
			$("#frm").submit();
		});
		$("#re_write").click(function() {
			$("#re_frm").submit();
		});
	});
</script>
</head>
<body>
	<!-- header 시작 -->
	<%@ include file="../../css/common/header.jsp"%>
	<section class="contents_wrap">
		<div class="noticeboard">
			<div>
				<h1>NOTICE</h1>
			</div>
			<form action="./notice_writeCheck.jsp" name="frm" id="frm"
				method="post">
				<div class="table">
					<table>
						<tr class="title">
							<td colspan="2"><%=noticeDTO.getTitle()%></td>
						</tr>
						<tr class="date">
							<td>Date : <span class="black"><%=noticeDTO.getReg_date()%></span><br>
								Name : <span class="black"><%=noticeDTO.getName()%></span></td>
							<td id="hits"><br>Hits : <span class="black"><%=noticeDTO.getHit()%></span></td>
						</tr>
						<tr class="content">
							<td colspan="2"><%=noticeDTO.getContents()%></td>
						</tr>
						<%
							if (memberDTO != null && memberDTO.getId().equals(noticeDTO.getName())) {
						%>
						<tr class="btn">
							<td><a href="./noticeUpdateForm.jsp?number=<%=number%>"><input
									type="button" value="수정"></a> <a
								href="./noticeDeleteProcess.jsp?number=<%=number%>"><input
									type="button" value="삭제"></a> <span class="btn_right"><a
									href="#"><input type="button" name="writeBtn" id="writeBtn"
										value="글쓰기"></a> <a href="../notice/notice.jsp"><input
										type="button" value="목록보기"></a></td>
							</span>
						</tr>
						<%
							} else {
						%>
						<tr class="btn">
							<td class="btn_right"><a href="#"><input type="button"
									name="writeBtn" id="writeBtn" value="글쓰기"></a> <a
								href="../notice/notice.jsp"><input type="button"
									value="목록보기"></a></td>
						</tr>
						<%
							}
						%>
					</table>
					<form action="./reWriteProcess.jsp?number=<%=number%>" name="re_frm" id="re_frm"
						method="post">
						<table>
							<%
								if (memberDTO != null) {
							%>
							<tr>
							<input type="hidden" name="re_name" id="re_name" value="<%=noticeDTO.getName()%>">
								<td>>NAME</td>
								<td><%=noticeDTO.getName()%></td>
								<td>>PASSWORD</td>
								<td><input type="password" name="re_pw" id="re_pw"
									placeholder="패스워드"></td>
							</tr>
							<tr>
								<td><textarea rows="3" cols="50" name="re_contents"
										id="re_contents" placeholder="내용"></textarea></td>
								<td><input type="button" name="re_write" id="re_write"
									value="글쓰기"></td>
							</tr>
							<%
								}
							%>
						</table>
					</form>
				</div>
			</form>
		</div>
	</section>
	<!-- ***************************************************** -->
	<!-- footer 시작 -->
	<%@ include file="../css/common/footer.jsp"%>
</body>
</html>