<!-- script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		String declaration = "����";	
%>
<%!
		public String decMethod(){
			return declaration;
		}
%>
<%
		String scriptlet = "��ũ��Ʈ��";
		String comment = "�ּ�";
%>

������ ���1 : <%=declaration%><br/>
������ ���2 : <%=decMethod()%><br/>
��ũ��Ʈ���� ��� : <%=scriptlet%><br/>
<!-- JSP �ּ��κ� -->
<!-- JSP �ּ�1 <%=comment %> --><p/>
<%--JSP �ּ�2  <%=comment %> --%>
<%
		/*������ �ּ�*/
		//���� �ּ�
%>





