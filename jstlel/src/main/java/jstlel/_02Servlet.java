package jstlel;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class _02Servlet
 */
public class _02Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		/**
		 * 1. Scope(범위) 
		 * 객체가 존재하는 범위 
		 * 
		 * 2. 객체가 오래 지속되는 순서
		 * Application(Servlet Context) Scope > Session Scope > Request Scope > Page Scope  
		 * 
		 * 3.EL이 이름으로 객체를 찾는 순서 
		 * 오래 지속되는 순서의 거꿀로 찾음 ㅇㅇ 페이지->리퀘스트->세션->애플리케이션
		 *  pageScope > requestScope > sessionScope > application(servlet Context) Scope
		 *  
		 *  주의! 
		 *  같은 이름으로 여러 범위에 객체를 저장할 경우 주의가 필요 
		 *  
		 * 
		 */
		
		// 리퀘스트 스코프 
		UserVo vo1 = new UserVo();
		vo1.setNo(1L);
		vo1.setName("둘리1");
		request.setAttribute("vo", vo1);
		
		UserVo vo2 = new UserVo();
		vo2.setNo(1L);
		vo2.setName("둘리2");
		request.getSession(true).setAttribute("vo", vo2);
		
		
		// 세션 스코프 
		
		request.getRequestDispatcher("/WEB-INF/views/02.jsp").forward(request, response);
	
	
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
