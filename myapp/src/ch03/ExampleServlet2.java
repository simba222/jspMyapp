package ch03;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

//서블릿 라이프 사이클 
@WebServlet("/ch03/exampleServlet2")
public class ExampleServlet2 extends HttpServlet {
		
	@Override
	public void init() throws ServletException {
		System.out.println("init 호출");
	}
	//aaaaa
	//aaaaaaaa
	@Override
	public void destroy() {
		System.out.println("destroy 호출");
	}
	
	@Override
	protected void service(HttpServletRequest req, 
			HttpServletResponse resp) throws ServletException, IOException {
		System.out.println("service 호출");
	}
}


