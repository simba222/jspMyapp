<!-- expression2.jsp -->
<%@page import="java.util.Date"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%! // ����
		public int operation(int i, int j){
			return i>j?i:j;
		}	
%>
<%
		response.setCharacterEncoding("EUC-KR");
		Date d = new Date();
		int h = d.getHours();
		int i = 10;
		int j = 20;
%>
������ �����ϱ��? �����ϱ��? <%=(h<12)? "����":"����" %><br/>
i�� j �߿� ū ���ڴ�? <%=operation(i, j) %><br/>






