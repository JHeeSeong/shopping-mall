<%@page import="com.hs.notice.NoticeDAO"%>
<%@page import="com.hs.notice.NoticeDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	NoticeDTO noticeDTO = new NoticeDTO();
	noticeDTO.setNum(Integer.parseInt(request.getParameter("number")));
	noticeDTO.setName(request.getParameter("re_name"));
	noticeDTO.setPassword(request.getParameter("re_pw"));
	noticeDTO.setTitle(request.getParameter("re_title"));
	noticeDTO.setContents(request.getParameter("re_contents"));
	noticeDTO.setHit(0);
	
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = noticeDAO.reply(noticeDTO);

	response.sendRedirect("notice.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

</body>
</html>