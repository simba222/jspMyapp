<!-- forwardTag2_1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String bloodType = request.getParameter("bloodType");
		String name = "홍길동";
%>
page값에 ""값이 있을때는 ''값으로 시작한다.
<jsp:forward page='<%=bloodType+".jsp"%>'>
	<jsp:param value="<%=name%>" name="name"/>
</jsp:forward>
