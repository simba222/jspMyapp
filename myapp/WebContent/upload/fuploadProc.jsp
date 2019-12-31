<!-- fuploadProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="upload.FileloadMgr" />
<%
		String flag = request.getParameter("flag");
		System.out.print(flag);
		boolean result = mgr.uploadFile(request);
		if(result)
			response.sendRedirect("flist.jsp");
		else
			response.sendRedirect("fupload.jsp");
%>