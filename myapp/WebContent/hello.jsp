<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html; charset=EUC-KR"%>
<%
		response.setCharacterEncoding("EUC-KR");
		String name = "ȫ�浿";
		name = URLEncoder.encode(name);
		response.sendRedirect("hello2.jsp?n="+name);
%>
