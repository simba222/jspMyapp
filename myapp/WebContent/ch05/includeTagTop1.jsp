<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String name = request.getParameter("name");
%>
include ActionTag�� Top�Դϴ�.<p/>
<b><%=name%></b> ������!!!
<hr/>