<!-- teamPost.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="ch07.TeamMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		String teamList[] = mgr.readTeamName();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Team Mgr</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function check() {
		f = document.frm;
		if(f.name.value.length==0){
			alert("이름을 입력하세요.");
			f.name.focus();
			return;
		}
		if(f.city.value.length==0){
			alert("사는곳을 입력하세요.");
			f.city.focus();
			return;
		}
		if(f.age.value.length==0){
			alert("나이를 입력하세요.");
			f.age.focus();
			return;
		}
		if(f.team.value.length==0){
			alert("팀명을 입력하세요.");
			f.team.focus();
			return;
		}
		f.submit();
	}
	
	function check2() {
		f = document.frm;
		frm.action="teamPostProc2.jsp";
		frm.submit();
	}
	
	function listSelect() {
		f = document.frm;
		tl = f.teamList;
		f.team.value = tl.options[tl.selectedIndex].value;
	}
</script>
</head>
<body>
<div align="center">
<h1>Team Post</h1>
<form name="frm" method="post" action="teamPostProc.jsp">
<table border="1">
<tr>
	<td width="50" align="center">이름</td>
	<td width="150"><input name="name" value="홍길동"></td>
</tr>
<tr>
	<td align="center">사는곳</td>
	<td><input name="city" value="부산"></td>
</tr>
<tr>
	<td align="center">나이</td>
	<td ><input name="age" value="27"></td>
</tr>
<tr>
	<td align="center">팀명</td>
	<td><input name="team" size="10">
		    <select name="teamList" onchange="listSelect()">
		    	<option value="">직접입력</option>
		    	<%for(int i=0;i<teamList.length;i++){ %>
		    	<option value="<%=teamList[i]%>"><%=teamList[i]%></option>
		    	<%} %>
		    </select>
	</td>
</tr>
<tr>
	<td align="center" colspan="2">
		<input type="button" value="SAVE" onclick="check()">
		<input type="button" value="SAVE2" onclick="check2()">
	</td>
</tr>
</table><p/>
<a href="teamList.jsp">LIST</a>
</form>
</div>
</body>
</html>