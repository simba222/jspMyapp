<!-- expression1.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%!
		String name[] = {"Java","JSP","Android","Spring"};
%>
<table border="1">
	<tr>
		<th>��ȣ</th>
		<th>����</th>
	</tr>
	<%
			for(int i=0;i<name.length;i++){
	%>
	<tr>
		<td><%=i+1%></td>
		<td><%=name[i]%></td>
	</tr>	
	<%			
			}//---for
	%>
</table>









