<!-- teamPostProc.jsp : teamPost.html���� �Է��� ���� 
���̺� ���� ����� ������. ���� �Ŀ� teamList.jsp �Ѿ��. -->
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
		
		//��û�� ������ ��� ����
		bean.setName(name);
		bean.setCity(city);
		bean.setAge(age);
		bean.setTeam(team);
		
		//���̺� ����
		boolean result = mgr.postTeam(bean);
		String msg = "���Խ���";
		String url = "teamPost.jsp";
		if(result){
			msg = "���Լ���";
			url = "teamList.jsp";
		}
%>
<script>
	alert("<%=msg%>");
	//response.sendRedirect ���ϱ��
	location.href="<%=url%>";
</script>
















