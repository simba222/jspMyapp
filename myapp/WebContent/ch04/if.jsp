<!-- if.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//jsp templates���� ���� 
		//if.html�� ��û�� ���� ���� ���ڵ��� EUC-KR�� ����
		request.setCharacterEncoding("EUC-KR"); //post ��� ���ڵ�
		//if.html���� name�� color ������.
		//(�Ű������� �������� �ݵ�� form�� name���� ��ġ)
		String name = request.getParameter("name");
		String color = request.getParameter("color");
		String msg = null;
		if(color.equals("blue")){
			msg = "�Ķ���";
		}else if(color.equals("red")){
			msg = "������";
		}else if(color.equals("orange")){
			msg = "��������";
		}else{
			msg = "��Ÿ��";
			color = "white";
		}
%>
<body bgcolor="<%=color%>">
<%=name%>���� �����ϴ� ������ <%=msg%>�Դϴ�.
</body>

















