<%@page contentType="text/html; charset=EUC-KR"%>
<%
		String msg = "for�� ����";
		//out ����
		out.println(msg+"<br/>");
%>
<%=msg%><p/>
1. 1~10������ ���� �İ� �Բ� ����Ͻÿ�. (ǥ���ĸ� ���)<br/>
<%
		int sum = 0;
		for(int i=1;i<11;i++){
			if(i<10){
		%>
			 <%=i+" + " %>
		<%		
			}else{
		%>
			<%=i+" = " %>
		<%		
			}
			sum+=i;
		}
%>
<%=sum%><p/>
2. 1~10������ ���� �İ� �Բ� ����Ͻÿ�. (out.println�� ���)<br/>
<%
		sum = 0;
		for(int i=1;i<11;i++){
			if(i<10){
				out.println("<b>"+ i + " +</b> ");
			}else{
				out.println("<b>"+ i + " =</b> ");
			}
			sum+=i;
		}
		out.println(sum+"<p/>");
%>






