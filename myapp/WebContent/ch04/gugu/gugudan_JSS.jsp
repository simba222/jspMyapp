<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<h1 align="center"> �� �� �� !</h1>
<table border=1 width="1900" height="700">
<tr bgcolor="lightgreen">
<% for(int i =2; i<=9; i++){%>
	<td><%= i + "��"%></td>
	<% } %>
	</tr><%for(int i=1; i<=9; i++){%>
	<tr><%for(int j =2; j<=9; j++){ %>
	<td bgcolor="lightyellow"> <%= j+"X"+i + " = " + j*i %></td>
			<% 	}%>		
			</tr>
			<% }%>
	</table>

