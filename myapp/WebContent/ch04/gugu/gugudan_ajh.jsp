<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%request.setCharacterEncoding("euc-kr");%>

<html>
<head>
	<style type="text/css">
		table {
			border-collapse: collapse;
		}
		
		table, tr, td {
			border: 1px solid orange;
		}
		
		tr, td {
			padding: 5px;
			text-align: center;
			font-weight: bold;
			text-shadow: 1px 1px 1px orange;
		}
		
		tr:hover {
			background-color: #000;
			color: #fff;
		}
	</style>
</head>
<body>
<table>
<%
	for (int i = 2; i < 10; i++) {
%>
	<tr>
	<td><%=i + " ´Ü "%></td>
<%
		for (int j = 1; j < 10; j++) {
%>
			<td>
				<%=i + " X " + j + " = " + i*j %>
			</td>
<%	
		}
%>
	</tr>
<%
	}
%>
	</tr>
</table>
</body>
</html>