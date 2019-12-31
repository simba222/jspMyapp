<!-- dicrective2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%@page import="java.util.*, java.text.*"
                  import="ch03.MyUtil"
                  session="true"
                  buffer="16kb"
                  autoFlush="true"
                  isThreadSafe="true"
%>
<%
		request.setCharacterEncoding("EUC-KR");
		Date d = new Date();
%>
현재의 날짜와 시간은? <%=d.toLocaleString()%><br/>
세션Id : <%=session.getId() %>









