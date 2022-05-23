<%@page import="com.douzone.guestbook.dao.GuestBookDao"%>
<%@page import="com.douzone.guestbook.vo.GuestBookVo"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
request.setCharacterEncoding("utf-8");
	String no=request.getParameter("no");
	String password=request.getParameter("password");
	GuestBookVo vo = new GuestBookVo();
	

	vo.setNo(Long.parseLong(no));
	vo.setPassword(password);
	
	if(new GuestBookDao().delete(vo)){
		new GuestBookDao().delete(vo);
		out.print("<script>alert('삭제가 잘 되었습니다.');</script>");
		out.print("<script>location.href = 'index.jsp';</script>");
	}else{
		out.print("<script>alert('비밀번호가 일치하지 않습니다.');</script>");
		out.print("<script>location.href = 'index.jsp';</script>");
	}
	//response.sendRedirect("index.jsp");
	
%>