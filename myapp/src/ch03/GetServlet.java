package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch03/getServlet")
public class GetServlet extends HttpServlet {
	

	@Override
	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		String msg = request.getParameter("msg");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Service 호출</h1>");
		out.println("</body>");
		out.println("</html>");
	}
	
	//만약 service 메소드가 없다면 호출
	@Override
	protected void doGet(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		String msg = request.getParameter("msg");
		PrintWriter out = response.getWriter();
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>Get Servlet 방식</h1>");
		out.println("msg : " + msg);
		out.println("</body>");
		out.println("</html>");
	}
}















