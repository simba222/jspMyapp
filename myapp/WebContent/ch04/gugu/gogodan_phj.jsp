<%@ page contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
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
border:1px solid ,	#DC143C;
padding:3px 7px 2px 7px;

}
#gogo tr:nth-child(2n+1) {
    background: LightGray;
}
#gogo th 
{
font-size:1.1em;
text-align:center;
padding-top:5px;
padding-bottom:4px;
background-color:	#DC143C;
color:#ffffff;
}
#gogo tr.alt td 
{
color:#000000;
background-color:#DC143C;
}
table{
text-align: center;
}
</style>


	<table id="gogo" border="1"  align="center">
	<tr>
<%
		for (int i = 2; i<10; i++) {								
		%>		
		<th><%=i+"´Ü" %></th>	
		<%
		}
		%>
		</tr>
		<tr id=gg>	
			<%
				for (int i = 1; i<10; i++){
					for (int j = 2; j<10; j++) {								
			%>
					
				<td><%=j +"¡¿"+i + "=" + i*j %></td>
				
		<%									
				}
				
		%>
		</tr>
		<%
		}

%>


	
							
		
</table>