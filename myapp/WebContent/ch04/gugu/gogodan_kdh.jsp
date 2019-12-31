<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<style>
	table {
	margin-left: auto;
	margin-right: auto;
    text-align: center;
    border: 1px double;
  }
  
  th, td {
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
  }
  
  th {
    background-color: #5AAEFF;
  }
  
  td {
  	background-color: #e3f2fd;
    border-bottom: 1px solid #444444;
    padding: 10px;
    text-align: center;
    
  }
  td:nth-child(2n){
    background-color: #bbdefb;
  }
  
  td:nth-child(2n+1){
    background-color: #e3f2fd;
    }
	
	h1{
	 color: #368AFF;
	}
</style>
<h1 align="center">구구단을 외우자</h1>
<table>
<%
	for(int i=2; i<=9; i++){
%>
<th>
<%=i+" 단" %>
</th>
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