<!-- teamPostProc2.jsp :  빈즈 액션 태그를 사용하여 테이블에 저장 기능 -->
<%@page contentType="text/html; charset=EUC-KR"%>
<%request.setCharacterEncoding("EUC-KR");%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<jsp:useBean id="bean" class="ch07.TeamBean"/>
<!-- 요청된 값을 받고 또 빈즈에 저장까지 하는 기능 -->
<jsp:setProperty property="*" name="bean"/>
<% 
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
	location.href="<%=url%>";
</script>

