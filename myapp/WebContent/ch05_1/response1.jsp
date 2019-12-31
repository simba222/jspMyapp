<!-- response1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//기본적으로 응답 페이지는 form에 action값
		response.sendRedirect("response2.jsp");
%>