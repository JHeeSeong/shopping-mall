<%@page import="com.hs.member.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	response.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	MemberDAO memberDAO = new MemberDAO();
	boolean check = memberDAO.idCheck(id);
%>    
<%if(check){ %>
	OK
<%}else {%>
	FAIL
<% }%>
