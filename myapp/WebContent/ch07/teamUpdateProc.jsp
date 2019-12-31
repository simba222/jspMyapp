<!-- teamUpdateProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<!-- request.getParameter or setProperty 전에 항상 있어야함. -->
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<jsp:useBean id="bean" class="ch07.TeamBean">
	<jsp:setProperty property="*" name="bean"/>
</jsp:useBean>
<%
		boolean result = mgr.updateTeam(bean);
		String msg = "수정실패";
		String url = "teamList.jsp";
		if(result){
			msg = "수정성공";
			url = "teamRead.jsp?num="+bean.getNum();
		}
%>
<script>
	alert("<%=msg%>");
	location.href="<%=url%>";
</script>





