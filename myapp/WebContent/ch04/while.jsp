<%@page import="ch03.MyUtil"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String msg = request.getParameter("msg");
		//모든 통신에 값들은 문자로 변형
		int number = Integer.parseInt(request.getParameter("number"));
		int cnt = 0;
		while(number>cnt){
%>
		<font color="<%=MyUtil.randomColor()%>">
			<b><%=msg%></b>
		</font><br/>
<%
			cnt++;
		}//---while
%>





