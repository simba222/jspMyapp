<%@page import="ch03.MyUtil"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		String msg = request.getParameter("msg");
		//��� ��ſ� ������ ���ڷ� ����
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





