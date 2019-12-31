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
<!-- 표현식을 사용해서 테이블에 name배열을 출력하세요. -->
<table border = "3">
	<tr style="text-align:center;">
		<th colspan = "8", style="background-color:lightblue;">구구단 </th>
	</tr>
	<tr>
		<th style="color:red;">2단</th>
		<th style="color:orange;">3단</th>
		<th style="color:yellow;">4단</th>
		<th style="color:green;">5단</th>
		<th style="color:blue;">6단</th>
		<th style="color:navy;">7단</th>
		<th style="color:purple;">8단</th>
		<th style="color:black;">9단</th>
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