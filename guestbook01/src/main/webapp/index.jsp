<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@page import="java.util.List"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>방명록</title>
</head>
<body>
	<%
		request.setCharacterEncoding("utf-8");
		List<GuestBookVo> list = new GuestBookDao().findAll();
		int count=list.size();
	%>
	
	<form action="add.jsp" method="post">
		<table border=1 width=500>
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
				<td>비밀번호</td>
				<td><input type="password" name="password"></td>
			</tr>
			<tr>
				<td colspan=4><textarea name="message" cols=60 rows=5></textarea></td>
			</tr>
			<tr>
				<td colspan=4 align=right><input type="submit" VALUE=" 등록 "></td>
			</tr>
		</table>
	</form>
	<br>
	
	<% for(GuestBookVo vo : list ){ %>
	<table width=510 border=1>
		<tr>
			<td><%=count--%></td>
			<td><%=vo.getName()%></td>
			<td><%=vo.getRegDate()%></td>
			<td><a href="deleteform.jsp?no=<%=vo.getNo()%>">삭제</a></td>
		</tr>
		<tr>
			<td colspan=4><%=vo.getMessage()%></td>
		</tr>
	</table>
	<br/>
	<% } %>
</body>
</html>