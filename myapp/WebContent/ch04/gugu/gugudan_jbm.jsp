<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<div align = center>
<h2 align=center>구구단</h2>
<table border = 1>
		<%
		int i = 0;
		int j = 0;
		for(i = 2; i < 10; i++){
			out.print("<th bgcolor = aqua>" + i + "단" + "</th>");	
		}
		%>
		
		<%
		for(i = 1; i < 10; i++){
		%>
		
		<tr>
		
		<%
			for(j = 2; j < 10; j ++){
				out.println("<td ALIGN=center HEIGHT=30 VALIGN=middle>" + j + "*" + i + "=" + j*i + "</td>");		
			}
		%>
		
		</tr>
		
		<%
		}
		%>	
</table>
</div>