<!-- response2.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//�� �������� ��Ű�� ������ ���� �ʰ� �ݵ�� ������ ���ؼ���  ���� ������ ����
		//��Ű & ĳ��(cache)�� �������� �ʰڴ�.
		response.setHeader("Pragma", "no-cache");
		if(request.getProtocol().equals("HTTP/1.1")){
			response.setHeader("Cache-Control", "no-cache");
		}
%>
response2.jsp �������Դϴ�.