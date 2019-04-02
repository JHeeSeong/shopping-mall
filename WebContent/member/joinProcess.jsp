<%@page import="com.hs.member.MemberDAO"%>
<%@page import="com.choa.util.DBConnector"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.hs.member.MemberDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");

	String name = request.getParameter("name");
	String id = request.getParameter("id");
	String pw = request.getParameter("pw");
	String email = request.getParameter("email");
	String yy = request.getParameter("yy");
	String mm = request.getParameter("mm");
	String dd = request.getParameter("dd");
	String birth = yy + "-" + mm + "-" + dd;
	String sex = request.getParameter("sex");
	String phone = request.getParameter("phone");

	MemberDTO memberDTO = null;
	Connection con = DBConnector.getConnect();
	con.setAutoCommit(false);
	MemberDAO memberDAO = new MemberDAO();
	int result = 0;

	try {
		memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setId(id);
		memberDTO.setPassword(pw);
		memberDTO.setEmail(email);
		memberDTO.setBirth(birth);
		memberDTO.setPhone(phone);
		memberDTO.setSex(sex);
		result = memberDAO.insert(memberDTO, con);
		con.commit();
	} catch (Exception e) {
		e.printStackTrace();
		con.rollback();
	} finally {
		con.setAutoCommit(true);
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