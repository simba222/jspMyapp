<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<style type="text/css">
h1 {
	color: green;
	margin-top: 60px;
}

.div1{
	margin-top: 60px;
}

.td1{
	width: 60px;
	height: 50px;
	background-color: yellow;
}

.td2{
	width: 60px;
	height: 50px;
	background: aqua;
}
body{
	background: tomato;
}
</style>
<body>
</body>
<div align="center">
<h1>GuGudan</h1>

<table border='1' class="div1">
	<tr>
		<%
			for (int i = 1; i <= 9; i++) {
		%>
		<td class="td1"><%=i + "´Ü"%></td>
		<%
			}
		%>
	</tr>
	<%
		for (int i = 1; i <= 9; i++) {
	%>
	<tr>
		<%
			for (int j = 1; j <= 9; j++) {
		%>
		<td class="td2"><%=j + "x" + i + "=" + (i * j)%></td>
		<%
			}
			}
		%>
	</tr>
</table>
</div>