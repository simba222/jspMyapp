package board;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/board/boardUpdate")
public class BoardUpdate extends HttpServlet {

	protected void doPost(HttpServletRequest request, 
			HttpServletResponse response) throws ServletException, IOException {
		//요청된 값들에 대한 한글 인코딩
		request.setCharacterEncoding("EUC-KR");
		//응답에 대한 코드값 한글 인코딩
		response.setContentType("text/html; charset=EUC-KR");
		//세션에서 read.jsp 저장한 게시물 객체
		HttpSession session = request.getSession();
		
		BoardBean bean = (BoardBean)session.getAttribute("bean");
		String dbPass = bean.getPass();
		//update.jsp에서 입력한 pass값
		String inPass = request.getParameter("pass");
		if(dbPass.equals(inPass)) {
			//update.jsp에서 요청한 값을 테이블 수정
			BoardMgr mgr = new BoardMgr();
			BoardBean upBean = new BoardBean();
			upBean.setNum(Integer.parseInt(request.getParameter("num")));
			upBean.setName(request.getParameter("name"));
			upBean.setSubject(request.getParameter("subject"));
			upBean.setContent(request.getParameter("content"));
			mgr.updateBoard(upBean);
			String nowPage = request.getParameter("nowPage");
			response.sendRedirect("read.jsp?nowPage="+nowPage+
					"&num="+upBean.getNum());
		}else{
			//비번 틀렸다고 경고창
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력하신 비밀번호가 아닙니다.');");
			out.println("history.back();");
			out.println("</script>");
		}
	}
}























