<!-- out1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"
                  buffer="5kb"
%>
<%
		request.setCharacterEncoding("EUC-KR");
		int totalBuffer = out.getBufferSize();
		int remainBuffer = out.getRemaining();
		int useBuffer = totalBuffer - remainBuffer;
		out.print("<b>하하1</b>");
		out.println("<b>하하2</b>");
		out.println("<b>하하3</b><br/>");
%>
출력  버퍼의 전체 크기 : <%=totalBuffer%><br/>
남은 버퍼의 크기 : <%=remainBuffer%><br/>
현재  버퍼의 사용량 : <%=remainBuffer%><br/>






