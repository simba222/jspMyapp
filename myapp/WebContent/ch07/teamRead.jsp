<!--teamRead.jsp-->
<%@page import="ch07.TeamBean"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		int num = 0;
		if(request.getParameter("num")==null){
			//정상적으로 num이 요청되지 않으면 지정한 페이지로 응답
			response.sendRedirect("teamList.jsp");
		}else{
			num = Integer.parseInt(request.getParameter("num"));
		}
		TeamBean bean = mgr.readTeam(num);
		//세션에 bean 키값으로 bean 객체를 저장
		session.setAttribute("bean", bean);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
</head>
<body>
<div align="center">
<h1>Team Read</h1>
<table border="1">
	<tr>
		<td>번호</td>
		<td><%=bean.getNum()%></td>
	</tr>
	<tr>
		<td>이름</td>
		<td><%=bean.getName()%></td>
	</tr>
	<tr>
		<td>사는곳</td>
		<td><%=bean.getCity()%></td>
	</tr>
	<tr>
		<td>나이</td>
		<td><%=bean.getAge()%></td>
	</tr>
	<tr>
		<td>팀명</td>
		<td><%=bean.getTeam()%></td>
	</tr>
</table><p/>
<a href="teamList.jsp">LIST</a>&nbsp;&nbsp;
<a href="teamPost.jsp">POST</a>&nbsp;&nbsp;
<a href="teamDelete.jsp?num=<%=num%>">DELETE</a>&nbsp;&nbsp;
<a href="teamUpdate.jsp?num=<%=num%>">UPDATE</a>&nbsp;&nbsp;
<a href="teamUpdate2.jsp">UPDATE2</a>&nbsp;&nbsp;
</div>
</body>
</html>











