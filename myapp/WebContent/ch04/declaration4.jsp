<!-- declaration4.jsp  -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%!
		int one; //�ʵ�� �ʱ�ȭ �� �ʿ����.
		int two = 1;
		public int pluseMethod(){
			return one+two;
		}
		String msg;
		int three;
%>

one�� two�� ����? <%=pluseMethod()%><br/>
String msg ����? <%=msg%><br/>
int three��? <%=three%><br/>