<%@page import="com.hs.notice.NoticeDAO"%>
<%@page import="com.hs.notice.NoticeDTO"%>
<%@page import="com.choa.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
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
	int result = noticeDAO.noticeDelete(number);
	
	response.sendRedirect("../notice/notice.jsp");
%>