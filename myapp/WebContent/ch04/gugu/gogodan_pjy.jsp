<%@page import="java.util.Random" %>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%!
	public String randomColor(){
		Random r = new Random();
		String rgb = Integer.toHexString(r.nextInt(256));
	 	rgb += Integer.toHexString(r.nextInt(256));
	 	rgb += Integer.toHexString(r.nextInt(256));
	 	return "#"+rgb;
}
%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<h1>구구단</h1>
<table border=1 width=560>
<%
	for(int i=2; i<=9; i++){
%>
<td>
<%=i+"단" %>
</td>
<%
	}
%>
</tr>
<%
for(int i=1; i<=9; i++){ //줄수
%>
<tr>
<%
for(int j=2; j<=9; j++){
%>
<td>
<%= j+"X"+i+"="+j*i %>
</td>
<%
}
%>
</tr>
<%
}
%>
</table> 