<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//includeTag1.html에서 입력한 이름의 값을 받는다.
		//String name = request.getParameter("name");
%>
<!-- 요청정보(reqeust)도 같이 넘어간다. -->
<jsp:include page="includeTagTop1.jsp"/>
include ActionTag의 Body입니다.