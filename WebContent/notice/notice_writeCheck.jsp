<%@page import="com.hs.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	MemberDTO memberDTO = (MemberDTO) session.getAttribute("member");
	if (memberDTO != null) {
		RequestDispatcher view = request.getRequestDispatcher("./notice_write.jsp");
		view.forward(request, response);
	} else {
		response.sendRedirect("../main/main.jsp");
	}
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