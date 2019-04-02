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
	String email = request.getParameter("email");
 
	Connection con = DBConnector.getConnect();
	con.setAutoCommit(false);
	MemberDAO memberDAO = new MemberDAO();
	MemberDTO memberDTO = null;
	int result = 0;

	try {
		memberDTO = new MemberDTO();
		memberDTO.setName(name);
		memberDTO.setEmail(email);
		memberDTO = memberDAO.findMember(memberDTO);
		con.commit();
	} catch (Exception e) {
		e.printStackTrace();
		con.rollback();
	} finally {
		con.setAutoCommit(true);
	}
	
	String ok = "일치하는 회원이 없습니다";
	if(memberDTO!=null){
		ok = "입력하신 이메일로 전송합니다.";
	}
%>

<%=ok%>
