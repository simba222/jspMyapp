<%@ page language="java" contentType="text/html; charset=EUC-KR"
   pageEncoding="EUC-KR"%>
<%="<style>"+                        
"table{width:50%;height:40%;align:center;margin:auto;border:1px solid #FFE4E1;}"+
"th{border:3px solid #F5FFFA; font-size:25pt;font-weight:bold;text-align:center;background:#F0F8FF;}"+
"tr:nth-child(odd){border:3px solid blue;font-weight:bold;font-size:22pt;text-align:center;background:#81DAF5;}"+
"tr:nth-child(even){border:3px solid blue;font-weight:bold;font-size:22pt;text-align:center;background:#CEECF5;}"+
"</style>"   
%>
<%="<table>" %>
<%for(int k=1; k<=9;k++) {%>
<%="<th>"+k+" ´Ü</th>"%>
<%} %>
<%
	for(int i=2;i<=9;i++){
%>
		<%="<tr>"%>
<%
		for(int j=1; j<=9;j++){
%>
		<%="<td align=center>"+i +" x "+j+" = "+i*j+"</td>"%>
<%				
		}
%>
<%="</tr>"%>
<%				
	}//---for
%>
<%="</table>"%>

  