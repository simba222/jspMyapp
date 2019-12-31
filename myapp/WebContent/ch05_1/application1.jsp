<!-- application1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//서블릿 or Application 외부환경 정보 객체
		//클라이언트에게 전송된 문서 타입
		String mimeType = application.getMimeType("request1.html");
		String realPath = application.getRealPath("/");
		//Tomcat 사용을 하면 Tomcat/logs/로그파일 만들어짐.
		application.log("application 내부 객체 로그 테스트");
		//application > session > request > page
		application.setAttribute("aaa", "테스트");
%>
서블릿 컨테이너의 이름과 버전 : <%=application.getServerInfo()%><br/>
mimeType : <%=mimeType %><br/>
로컬 파일 시스템 경로 : <%=realPath %>
