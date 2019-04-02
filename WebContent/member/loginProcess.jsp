<%@page import="com.hs.member.MemberDTO"%>
<%@page import="com.hs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = new MemberDTO();

	memberDTO.setId(request.getParameter("id"));
	memberDTO.setPassword(request.getParameter("pw"));
	memberDTO = memberDAO.selectOne(memberDTO);
	if (memberDTO != null) {
		session.setAttribute("member", memberDTO);
	}
	response.sendRedirect("../main/main.jsp");
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