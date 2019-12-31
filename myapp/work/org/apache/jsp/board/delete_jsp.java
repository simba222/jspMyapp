/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/9.0.27
 * Generated at: 2019-11-27 06:53:51 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.board;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import board.BoardBean;
import board.UtilMgr;

public final class delete_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = new java.util.HashSet<>();
    _jspx_imports_classes.add("board.BoardBean");
    _jspx_imports_classes.add("board.UtilMgr");
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    if (!javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      final java.lang.String _jspx_method = request.getMethod();
      if ("OPTIONS".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        return;
      }
      if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method)) {
        response.setHeader("Allow","GET, HEAD, POST, OPTIONS");
        response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSP들은 오직 GET, POST 또는 HEAD 메소드만을 허용합니다. Jasper는 OPTIONS 메소드 또한 허용합니다.");
        return;
      }
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=EUC-KR");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("<!-- delete.jsp -->\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      board.BoardMgr mgr = null;
      mgr = (board.BoardMgr) _jspx_page_context.getAttribute("mgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (mgr == null){
        mgr = new board.BoardMgr();
        _jspx_page_context.setAttribute("mgr", mgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write('\r');
      out.write('\n');
      board.BCommentMgr cmgr = null;
      cmgr = (board.BCommentMgr) _jspx_page_context.getAttribute("cmgr", javax.servlet.jsp.PageContext.PAGE_SCOPE);
      if (cmgr == null){
        cmgr = new board.BCommentMgr();
        _jspx_page_context.setAttribute("cmgr", cmgr, javax.servlet.jsp.PageContext.PAGE_SCOPE);
      }
      out.write("\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");

		request.setCharacterEncoding("EUC-KR");
		String nowPage = request.getParameter("nowPage");
		int num = UtilMgr.parseInt(request, "num");
		//비번을 입력을 받아서 삭제를 처리하는 기능
		if(request.getParameter("pass")!=null){
			BoardBean bean = (BoardBean)session.getAttribute("bean");
			//delete.jsp에서 사용자가 입력한 비번
			String inPass = request.getParameter("pass");
			//db에 저장된 비번
			String dbPass = bean.getPass();
			if(inPass.equals(dbPass)){//==는 객체의 주소값 비교.
				mgr.deleteBoard(num);
				//원 게시물이 삭제되면 관려된 댓글 모두 삭제
				cmgr.deleteAllBComment(num);
				String url = "list.jsp?nowPage="+nowPage;
				response.sendRedirect(url);
			}else{
      out.write("\r\n");
      out.write("\t\t\t<script type=\"text/javascript\">\r\n");
      out.write("\t\t\t\talert(\"입력하신 비밀번호가 아닙니다.\");\r\n");
      out.write("\t\t\t\thistory.back();\r\n");
      out.write("\t\t\t</script>\r\n");
      out.write("\t\t\t");
}
		}else{//비번을 입력 받기 위한 폼(form) 출력

      out.write("\r\n");
      out.write("<title>JSP Board</title>\r\n");
      out.write("<link href=\"style.css\" rel=\"stylesheet\" type=\"text/css\">\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\tfunction check() {\r\n");
      out.write("\t\tif (document.delFrm.pass.value == \"\") {\r\n");
      out.write("\t\t\talert(\"패스워드를 입력하세요.\");\r\n");
      out.write("\t\t\tdocument.delFrm.pass.focus();\r\n");
      out.write("\t\t\treturn;\r\n");
      out.write("\t\t}\r\n");
      out.write("\t\tdocument.delFrm.submit();\r\n");
      out.write("\t}\r\n");
      out.write("</script>\r\n");
      out.write("</head>\r\n");
      out.write("<body bgcolor=\"#FFFFCC\">\r\n");
      out.write("<div align=\"center\"><br/><br/>\r\n");
      out.write("\t<table width=\"50%\" cellspacing=\"0\" cellpadding=\"3\">\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td bgcolor=#dddddd height=\"21\" align=\"center\">\r\n");
      out.write("\t\t\t\t사용자의 비밀번호를 입력해주세요.\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("\t<form name=\"delFrm\" method=\"post\">\r\n");
      out.write("\t\t<table width=\"70%\" cellspacing=\"0\" cellpadding=\"2\">\r\n");
      out.write("\t\t\t<tr>\r\n");
      out.write("\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t<table width=80%>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"password\" name=\"pass\" size=\"17\" maxlength=\"15\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td><hr size=\"1\" color=\"#eeeeee\"/></td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t\t<tr>\r\n");
      out.write("\t\t\t\t\t\t\t<td align=\"center\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"button\" value=\"삭제완료\" onClick=\"check()\"> \r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"reset\" value=\"다시쓰기\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<input type=\"button\" value=\"뒤로\" onClick=\"history.go(-1)\">\r\n");
      out.write("\t\t\t\t\t\t\t</td>\r\n");
      out.write("\t\t\t\t\t\t</tr>\r\n");
      out.write("\t\t\t\t\t</table>\r\n");
      out.write("\t\t\t\t</td>\r\n");
      out.write("\t\t\t</tr>\r\n");
      out.write("\t\t</table>\r\n");
      out.write("\t\t<input type=\"hidden\" name=\"nowPage\" value=\"");
      out.print(nowPage);
      out.write("\"> \r\n");
      out.write("\t\t<input type=\"hidden\" name=\"num\" value=\"");
      out.print(num);
      out.write("\">\r\n");
      out.write("\t</form>\r\n");
      out.write("</div>\r\n");
}
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
