<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<style>

table,td,tr,th{
	border: 1px double;
	width: 720px;
	text-align: center;
}


td:nth-child(2n){
	color : white;
    background-color: gray;
}
  
td:nth-child(2n+1){
    background-color: aqua;
}

th{
	background-color: highlight;
}

</style>
<h1>������</h1>
<table>
<%
	for(int i=2; i<=9; i++){
%>
<th>
<%=i+" ��" %>
</th>
<%
	}
%>
</tr>
<%
for(int i=1; i<=9; i++){ //�ټ�
%>
<tr>
<%
for(int j=2; j<=9; j++){
%>
<td>
<%= j +" X " + i +" = " + j*i %>
</td>
<%
}
%>
</tr>
<%
}
%>
</table> 