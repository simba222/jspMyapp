package ch03;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.jsp.JspWriter;

@WebServlet("/ch03/loginServlet")
public class LoginServlet extends HttpServlet {

	@Override
	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=EUC-KR");
		String id = request.getParameter("id");
		String pwd = request.getParameter("pwd");
		if(id.equals("aaa")&&pwd.equals("1234")) {
			//로그인 성공 세션에 idKey값으로 저장
			HttpSession session = request.getSession();
			session.setAttribute("idKey", id);
			response.sendRedirect("login.jsp");
		}else {
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 계정이 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}








