<%@page contentType="text/html; charset=EUC-KR"
				  isErrorPage="true"  	
%>
<%
		request.setCharacterEncoding("EUC-KR");
		
%>
������ ���� ������ �߻��Ͽ����ϴ�.<br/>
<%=exception.getMessage()%><br/>