<%@page import="com.hs.notice.NoticeDAO"%>
<%@page import="com.hs.notice.NoticeDTO"%>
<%@page import="com.choa.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String pw = request.getParameter("pw");
	String title = request.getParameter("title");
	String contents = request.getParameter("contents");

	NoticeDTO  noticeDTO = null;
	Connection con = DBConnector.getConnect();
	con.setAutoCommit(false);
	NoticeDAO noticeDAO = new NoticeDAO();
	int result = 0;

	try {
		noticeDTO = new NoticeDTO();
		noticeDTO.setName(name);
		noticeDTO.setPassword(pw);
		noticeDTO.setTitle(title);
		noticeDTO.setContents(contents);
		noticeDTO.setHit(1);
		result = noticeDAO.insert(noticeDTO, con);
		con.commit();
	} catch (Exception e) {
		e.printStackTrace();
		con.rollback();
	} finally {
		con.setAutoCommit(true);
	}

	response.sendRedirect("../notice/notice.jsp");
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