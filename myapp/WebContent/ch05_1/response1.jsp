<!-- response1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//�⺻������ ���� �������� form�� action��
		response.sendRedirect("response2.jsp");
%>