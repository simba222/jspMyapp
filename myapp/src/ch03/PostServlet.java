package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch03/postServlet")
public class PostServlet extends HttpServlet {

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		//post 방식으로 요청된 값에 한글 인코딩
		request.setCharacterEncoding("EUC-KR");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		String email = request.getParameter("email");
		out.println("<h3>id : " + id +"</h3>");
		out.println("<h3>pwd : " + pwd +"</h3>");
		out.println("<h3>email : " + email +"</h3>");
	}
}









