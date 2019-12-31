package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ch03/exampleServlet1")
public class ExampleServlet1 extends HttpServlet {
	//serialVersionUID : 객체 직렬화 -> 객체 자체를 네트워크로 전송

	protected void service(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		PrintWriter out = response.getWriter();
		//html 시작
		out.println("<html>");
		out.println("<body>");
		out.println("<h1>이클립스로 서블릿 만들기</h1>");
		out.println("</body>");
		out.println("</html>");
	}
}






