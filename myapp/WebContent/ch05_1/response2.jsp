<!-- response2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//이 페이지는 쿠키에 저장이 되지 않고 반드시 서버로 통해서만  응답 페이지 설정
		//쿠키 & 캐쉬(cache)에 저장하지 않겠다.
		response.setHeader("Pragma", "no-cache");
		if(request.getProtocol().equals("HTTP/1.1")){
			response.setHeader("Cache-Control", "no-cache");
		}
%>
response2.jsp 페이지입니다.