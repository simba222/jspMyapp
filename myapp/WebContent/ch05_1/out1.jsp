<!-- out1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"
                  buffer="5kb"
%>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalBuffer = out.getBufferSize();
		int remainBuffer = out.getRemaining();
		int useBuffer = totalBuffer - remainBuffer;
		out.print("<b>����1</b>");
		out.println("<b>����2</b>");
		out.println("<b>����3</b><br/>");
%>
���  ������ ��ü ũ�� : <%=totalBuffer%><br/>
���� ������ ũ�� : <%=remainBuffer%><br/>
����  ������ ��뷮 : <%=remainBuffer%><br/>






