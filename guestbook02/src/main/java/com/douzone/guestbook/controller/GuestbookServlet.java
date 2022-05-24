package com.douzone.guestbook.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.douzone.guestbook.dao.GuestBookDao;
import com.douzone.guestbook.vo.GuestBookVo;



/**
 * Servlet implementation class GuestbookController
 */
public class GuestbookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		
		String action = request.getParameter("a");
		
		if("list".equals(action)) {
			gohome(request, response);
		
		}else if("deleteform".equals(action)) {
			RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/deleteform.jsp");
			rd.forward(request,response);
			
		}else if("add".equals(action)) {
		
			String name=request.getParameter("name");
			String password=request.getParameter("password");
			String message=request.getParameter("message");
			
			GuestBookVo vo = new GuestBookVo();
			
			vo.setName(name);
			vo.setPassword(password);
			vo.setMessage(message);
			
			new GuestBookDao().insert(vo);

			response.sendRedirect(request.getContextPath()+"/gb");
			
		}else if("delete".equals(action)){
			
			String no=request.getParameter("no");
			String password=request.getParameter("password");
			GuestBookVo vo = new GuestBookVo();
			
			
			vo.setNo(Long.parseLong(no));
			vo.setPassword(password);
			PrintWriter out = response.getWriter();
			
			if(new GuestBookDao().delete(vo)){
				new GuestBookDao().delete(vo);
				
				out.print("<script>alert('Delete completed.');</script>");
				out.print("<script>location.href ="+"'"+ request.getContextPath() + "/gb"  +"'" + "</script>");
				
			}else{
				out.print("<script>alert('Passwords do not match.');</script>");
				out.print("<script>location.href ="+"'"+ request.getContextPath() + "/gb"  +"'" + "</script>");
			}
			
			
		}else {
			gohome(request, response);
		}
	
	}

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		doGet(request, response);
	}
	
	
	public void gohome(HttpServletRequest request, HttpServletResponse response) {
		
		RequestDispatcher rd = request.getRequestDispatcher("/WEB-INF/views/index.jsp");
		try {
			rd.forward(request,response);
		} catch (Exception e) {
			e.printStackTrace();
		} 
	}

}
