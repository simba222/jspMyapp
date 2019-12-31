<!-- teamPostProc.jsp : teamPost.html에서 입력한 값을 
테이블에 저장 기능의 페이지. 저장 후에 teamList.jsp 넘어간다. -->
<%@page import="ch07.TeamBean"%>
<%@page import="ch07.TeamMgr"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		TeamMgr mgr = new TeamMgr();
		TeamBean bean = new TeamBean();
		
		String name = request.getParameter("name");
		String city = request.getParameter("city");
		int age = Integer.parseInt(request.getParameter("age"));
		String team = request.getParameter("team");
		
		//요청한 값들을 빈즈에 저장
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		
		//테이블에 저장
		boolean result = mgr.postTeam(bean);
		String msg = "가입실패";
		String url = "teamPost.jsp";
		if(result){
			msg = "가입성공";
			url = "teamList.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	//response.sendRedirect 동일기능
	location.href="<%=url%>";
</script>
















