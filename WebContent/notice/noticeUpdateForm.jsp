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
		var editor_object = [];

		nhn.husky.EZCreator.createInIFrame({
			oAppRef : editor_object,
			elPlaceHolder : "contents",
			sSkinURI : "../SE2/SmartEditor2Skin.html",
			htParams : {
				bUseToolbar : true,
				bUseVerticalResizer : true,
				bUseModeChanger : true,
			}
		});
		$("#okBtn").click(function() {
			editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
			$("#frm").submit();
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
			<form action="./noticeUpdateProcess.jsp" name="frm" id="frm"
				method="post">
				<div class="table">
					<table>
					<input type="hidden" value="<%=number %>" name="number">
						<tr class="title">
							<td colspan="2"><input type="text" name="title1" id="title1" value="<%=noticeDTO.getTitle()%>"></td>
						</tr>
						<tr class="date">
							<td>Date : <span class="black"><input type="text" name="reg_date" id="reg_date" value="<%=noticeDTO.getReg_date()%>" readonly="readonly"></span><br>
								Name : <span class="black"></span><input type="text" name="name" id="name" value="<%=noticeDTO.getName()%>" readonly="readonly"></td>
							<td id="hits"><br>Hits : <span class="black"><input type="text" name="hit" id="hit" value="<%=noticeDTO.getHit()%>" readonly="readonly"></span></td>
						</tr>
						<tr class="content">
							<td colspan="2"><textarea rows="" cols="" id="contents" name="contents"><%=noticeDTO.getContents()%></textarea> </td>
						</tr>
						<tr class="btn">
							<td class="btn_right">
							<input type="button" name="okBtn" id="okBtn" value="확인">
							
									 <a href="../notice/notice.jsp"><input type="button"
									value="목록보기"></a></td>
						</tr>
					</table>
				</div>
			</form>
		</div>
	</section>
	<!-- ***************************************************** -->
	<!-- footer 시작 -->
	<%@ include file="../css/common/footer.jsp"%>
</body>
</html>