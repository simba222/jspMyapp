<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<title>구구단</title>
<style>
	h1{
		text-align: center
	}

</style>
</head>
<body>
	<h1 style="color:tomato">GUGUDAN</h1>
	<table border="1" bgcolor=#ffffff style="width:50%">
		<tr>
			<th bgcolor="red" style="color:white">2단</th1>
			<th bgcolor="orange" style="color:white">3단</th2>
			<th bgcolor="yellow" style="color:blue">4단</th3>
			<th bgcolor="green" style="color:white">5단</th4>
			<th bgcolor="blue" style="color:white">6단</th5>
			<th bgcolor="navy" style="color:white">7단</th6>
			<th bgcolor="purple" style="color:white">8단</th7>
			<th bgcolor="black" style="color:white">9단</th8>
		</tr>
	<% 
	for(int i = 1; i<10; i++){
	%>
	<tr>
	<% 
 	for(int j = 2; j<10; j++){
	%>
	<%
		if(j==2) {
	%>
  		<td bgcolor="red" style="color:white"><%=j %> x <%=i %>=<%=i*j %></td>
 	<%
 	}
		else if(j==3) {
 	%>
 		<td bgcolor="orange" style="color:white"><%=j %> x <%=i %>=<%=i*j %></td>
 	
 	<%
 	}
		else if(j==4) {
 	%>
 		<td bgcolor="yellow" style="color:blue"><%=j %> x <%=i %>=<%=i*j %></td>
 	<%
 	}
		else if(j==5) {
 	%>
 		<td bgcolor="green" style="color:white"><%=j %> x <%=i %>=<%=i*j %></td>
 	<%
 	}
		else if(j==6) {
 	%>
 		<td bgcolor="blue" style="color:white"><%=j %> x <%=i %>=<%=i*j %></td>
 	<%
 	}
		else if(j==7) {
 	%>
 		<td bgcolor="navy" style="color:white"><%=j %> x <%=i %>=<%=i*j %></td>
 	<%
 	}
		else if(j==8) {
 	%>
 		<td bgcolor="purple" style="color:white"><%=j %> x <%=i %>=<%=i*j %></td>
 	<%
 	}
		else if(j==9) {
 	%>
 		<td bgcolor="black" style="color:white"><%=j %> x <%=i %>=<%=i*j %></td>
 	<%
 	}
 	%>
 	<%
	}
	%>
 		
	</tr>
	<%
	}
	%>
		
	
		</table>
	</body>
</html>
	