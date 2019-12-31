<%@ page contentType="text/html; charset=EUC-KR"%>
<div align="center">
<h1> Table 이용해서 이쁘게 구구단을 만들어 보세요 </h1>
<table border="1" cellpadding="5" style="border-style:dotted;border-color:orange;color:green;">
  <%
   for (int i = 0; i < 10; i++) {
    	out.println("<tr>");
    for (int j = 2; j < 10; j++) {
    	if(i==0){
    		out.print("<th>"+j+"단</th>");	
    	}else{
%>
     	<td>
     		<%=j%> X <%=i %> = 
    		<font color=#FF0000><%=i*j %></font>
    	</td>
<%
    	}
    }
    out.println("</tr>");
   }
  %> 
</table>
</div>