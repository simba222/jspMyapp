<%@page import="java.util.Random"%>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
request.setCharacterEncoding("euc-kr");
%>
<%!
public String randomColor(){
	Random r = new Random();
	String rgb = Integer.toHexString(r.nextInt(256));
	 rgb += Integer.toHexString(r.nextInt(256));
	 rgb += Integer.toHexString(r.nextInt(256));
	 return "#"+rgb;
}
%>
<!-- ǥ������ ����ؼ� ���̺� name�迭�� ����ϼ���. -->
<table border = "3">
	<tr style="text-align:center;">
		<th colspan = "8", style="background-color:lightblue;">������ </th>
	</tr>
	<tr>
		<th style="color:red;">2��</th>
		<th style="color:orange;">3��</th>
		<th style="color:yellow;">4��</th>
		<th style="color:green;">5��</th>
		<th style="color:blue;">6��</th>
		<th style="color:navy;">7��</th>
		<th style="color:purple;">8��</th>
		<th style="color:black;">9��</th>
	</tr>
	<%
		for(int i = 1; i < 10; i++){
			
	%>
	<tr>
	<%
		 for(int j=2;j<=9;j++){
	%>
	
		<td> <font color = "<%=randomColor()%>"><%=j +"*"+ i +"="+ j*i  %></font></td>
	<%
		 }
	%>	
	</tr>
	<%
		}	
	%>
</table>