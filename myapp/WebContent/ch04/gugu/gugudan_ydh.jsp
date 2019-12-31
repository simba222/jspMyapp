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
<style>
	table {
		border-Color : blue;
		text-align : center;
		width : 75%;
	}
	
	h2{
		width : 75%;
		text-align : center;
	}
	
	th, td{
		/*background-Color : blue;*/
		height : 50px;
	}
	
	h3{
		text-decoration : underline;
	}
	td:nth-child(even){background-color: #f2f2f2}
	th:nth-child(even){background-color: #f2f2f2}

</style>

<h2><font color="<%=randomColor()%>">1단</font>부터 <font color="<%=randomColor()%>">9단</font></h2>

<table border="2">
	<tr>
		<%
		 for(int k=1; k<10; k++){
			 %>
			 <th><%=k+"단"%></th>
			 <%
		 }
		%>
	</tr>
<%
  for(int i=1; i<10; i++) {
%>
	  <tr>
<%
	  for(int j=1; j<10; j++){	  
%>
			<td><font color="<%=randomColor()%>"><%=j + " * " + i%><h3><%=i*j%></h3></font></td>
<%
	  }
%>
	  </tr>
<%
  }
%>
</table>