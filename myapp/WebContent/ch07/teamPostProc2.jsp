<!-- teamPostProc2.jsp :  ���� �׼� �±׸� ����Ͽ� ���̺� ���� ��� -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<jsp:useBean id="bean" class="ch07.TeamBean"/>
<!-- ��û�� ���� �ް� �� ��� ������� �ϴ� ��� -->
<jsp:setProperty property="*" name="bean"/>
<% 
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
	location.href="<%=url%>";
</script>

