<%@page import="java.util.Random"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%
	request.setCharacterEncoding("euc-kr");
%>
<style>
#gogo
{
font-family:"Trebuchet MS", Arial, Helvetica, sans-serif;
width:700px;
border-collapse:collapse;
}
#gogo td, #gogo th 
{
font-size:1em;
border:1px solid #98bf21;
padding:3px 7px 2px 7px;
}
#gogo th 
{
font-size:1.1em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
background-color:#A7C942;
color:#ffffff;
}
#gogo tr.alt td 
{
color:#000000;
background-color:#EAF2D3;
}
table{
text-align: center;
}
</style>

<h2 align="center">구구단</h2>
<table id="gogo" align="center">
<tr>

<%
for(int i = 2;i<10;i++){
%>
<th><%=i%>단</th>
<%
}
%>
</tr>
<tr>
<%	
	for(int j=1; j<10;j++){
		for(int k=2;k<10;k++){
%>
<td><%=k+" * "+j+" = "+j*k%></td>
<%
		}
%>
</tr>
<%
	}
%>
</table>


