<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
    <title>gogodan</title>
 <style>table {margin: 0px auto; width=580} h1{text-align:center;}</style>​
</head>
<body>
	    
		<h1>GoGoDan</h1>
		<table border=1>
			<tr bgcolor=#b3d9ff>
				<%
					for (int i = 2; i <= 9; i++) {
				%>
				<td><%=i + "dan"%></td>
				<%
					}
				%>
			</tr>

			<%
				for (int i = 1; i <= 9; i++) // 줄수
				{
			%>
			<tr>
				<%
					for (int j = 2; j <= 9; j++) {
				%>
				<td><%=j + "X" + i + "=" + j * i%></td>
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