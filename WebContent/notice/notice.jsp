<%@page import="com.choa.util.MakePage"%>
<%@page import="java.util.HashMap"%>
<%@page import="com.hs.notice.NoticeDAO"%>
<%@page import="com.hs.notice.NoticeDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	response.setCharacterEncoding("utf-8");
	int cuPage = 0;
	try {
		cuPage = Integer.parseInt(request.getParameter("curPage"));
	} catch (Exception e) {
		cuPage = 0;
	}
	NoticeDTO noticeDTO = null;
	NoticeDAO noticeDAO = new NoticeDAO();
	HashMap<String, Object> map = noticeDAO.selectList(request, response);

	ArrayList<NoticeDTO> ar = (ArrayList<NoticeDTO>) map.get("list");
	MakePage makePage = (MakePage) map.get("page");
	String kind = (String)map.get("kind");
	String search = (String)map.get("search");
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice</title>
<link href="../css/notice/notice.css" rel="stylesheet">
<link href="../css/common/header.css" rel="stylesheet">
<link href="../css/common/footer.css" rel="stylesheet">
</head>
<body>
	<!-- header 시작 -->
	<%@ include file="../css/common/header.jsp"%>
	<!-- ***************************************************** -->
	<div class="blank"></div>
	<!-- ***************************************************** -->
	<section class="contents_wrap">
		<div class="noticeboard">
			<div>
				<h2>NOTICE</h2>
			</div>
			<div class="table">
				<table>
					<tr>
						<th class="no">No.</th>
						<th class="content">Content</th>
						<th class="name">Name</th>
						<th class="date">Date</th>
						<th class="hits">Hits</th>
					</tr>
					<%
						for (NoticeDTO nDTO : ar) {
					%>
					<tr>
						<td class="notice"><%=nDTO.getNum()%></td>
						<td class="notice conten"><a
							href="./notice_view.jsp?number=<%=nDTO.getNum()%>"><%=nDTO.getTitle()%></a></td>

						<td class="notice"><%=nDTO.getName()%></td>

						<td class="notice"><%=nDTO.getReg_date()%></td>
						<td class="notice"><%=nDTO.getHit()%></td>
					</tr>
					<%
						}
					%>
				</table>
			</div>
			<div class="write">
				<a href="./notice_writeCheck.jsp"><input type="button"
					value="글쓰기"></a>
			</div>
			<div class="search">
				<form name="frm" class="form-horizontal" action="notice.jsp"
					method="post">
					<input type="radio" name="kind" id="kind" value="name"><span> 이름</span><input
						type="radio" name="kind" id="kind" value="title" checked="checked"><span> 제목</span><input
						type="radio" name="kind" id="kind" value="contents"><span> 내용</span> <input
						type="text" name="search" id="search"> 
						<input type="image" src="../images/btn_bbs_sch.gif">
				</form>
			</div>
			<div class="paging">
					<ul class="pagination">
						<%
							if (cuPage>1) {
						%>
						<li><a
							href="./notice.jsp?curPage=<%=makePage.getStartNum()%>&kind=<%=kind%>&search=<%=search%>">[처음]</a></li>
						<%
							}
						%>
						
						<%
							for (int i = makePage.getStartNum(); i <= makePage.getLastNum(); i++) {
						%>
						<li><a
							href="./notice.jsp?curPage=<%=i%>&kind=<%=kind%>&search=<%=search%>"><%=i%></a></li>

						<%
							}
						%>
						<%
							if (cuPage+1<makePage.getLastNum()) {
								
						%>
						<li><a
							href="./notice.jsp?curPage=<%=makePage.getLastNum()%>&kind=<%=kind%>&search=<%=search%>">[끝]</a></li>
						<%
							}
						%>
					</ul>
			</div>
		</div>
		</div>
	</section>
	<!-- ***************************************************** -->
	<!-- footer 시작 -->
	<%@ include file="../css/common/footer.jsp"%>
</body>
</html>