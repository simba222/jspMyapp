<%@ page import="java.util.Random" %>
<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR" %>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<%! 
	Random r = new Random();
public String colorRandom(){
int rr, gg, bb;
rr = r.nextInt(256);
gg = r.nextInt(256);
bb = r.nextInt(256);
return "#"+Integer.toHexString(rr)+Integer.toHexString(gg)+Integer.toHexString(bb);
}
%>
<%request.setCharacterEncoding("EUC-KR");%>
<h2>구구단</h2><br/>
<table border="1">
<%
for(int i=2;i<=9;i++){
	String color = colorRandom();
%>
<tr>	
<%
for(int j=1;j<=9;j++){
%>
<td bgcolor="<%=color %>">
<%out.println(i+" *"+j+" ="+j*j+" ");%>
</td>
<%
}
%>
</tr>
<%
}
%>
</table>