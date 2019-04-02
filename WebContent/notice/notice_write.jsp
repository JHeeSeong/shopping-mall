<%@page import="com.hs.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>게시판 작성</title>
<link href="../css/notice/notice_write.css" rel="stylesheet">
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
$(function(){
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "contents",
        sSkinURI: "../SE2/SmartEditor2Skin.html", 
        htParams : {
            bUseToolbar : true,             
            bUseVerticalResizer : true,     
            bUseModeChanger : true, 
        }
    });
     
    $("#writeBtn").click(function(){
        editor_object.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
        $("#frm").submit();
    });
});
</script>
</head>
<body>
	<!-- header 시작 -->
	<%@ include file="../css/common/header.jsp"%>
	<section class="contents_wrap">
		<div class="noticeboard">
			<div><h1>NOTICE</h1></div>
			<div class="table">
				<form action="../notice/noticeWriteProcess.jsp" name="frm" id="frm" method="post">
				<table>
					<tr class="name">
						<th><label>NAME</label></th>
						<td><input type="text" readonly="readonly" name="name" id="name" value="<%=memberDTO.getName()%>"></td>
						<th><label>PASSWORD</label></th>
						<td><input type="password" name="pw" id="pw"></td>
					</tr>
					<tr class="title">
						<th><label>TITLE</label></th>
						<td colspan="3"><input type="text" size="53" name="title" id="title"> <input type="checkbox" checked="checked" readonly="readonly"> HTML태그 허용</td>
					</tr>
					<tr class="content">
						<th><label>CONTENT</label></th>
						<td colspan="3"><textarea id="contents" name="contents" rows="25" cols="70"></textarea></td>
					</tr>
					<tr class="file">
						<th><label>FILE</label></th>
						<td colspan="3"><input type="file" vlaue="찾아보기"></td>
					</tr>
				</table>
				</form>
			</div>
			<div class="write_btn"><input name="writeBtn" id="writeBtn" type="button" value="글쓰기">
			<a href="../notice/notice.jsp"><input type="button"value="목록보기"></a></div>
		</div>
	</section>
	<!-- ***************************************************** -->
	<!-- footer 시작 -->
		<%@ include file="../css/common/footer.jsp"%>
</body>
</html>