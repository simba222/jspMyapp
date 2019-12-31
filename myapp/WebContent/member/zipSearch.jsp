<%@page import="member.ZipcodeBean"%>
<%@page import="java.util.Vector"%>
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="member.MemberMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//검색이 아니고 창만 open 했을때는 search는 n이고 검색일때 y
		String search = request.getParameter("search");
		Vector<ZipcodeBean> vlist = null;
		String area3 = null;
		if(search.equals("y")){
			area3 = request.getParameter("area3");
			vlist = mgr.zipcodeRead(area3);
			//out.print(vlist.size());
		}
		
%>
<html>
<head>
<title>우편번호 검색</title>
<link href="style.css" rel="stylesheet" type="text/css">
<script type="text/javascript">
	function loadSearch() {
		frm = document.zipFrm;
		if(frm.area3.value==""){
			alert("도로명을 입력하세요.");
			return;
		}
		frm.action = "zipSearch.jsp";
		frm.submit();
	}
	
	function sendAdd(zipcode, adds) {
		opener.document.regFrm.zipcode.value = zipcode;
		opener.document.regFrm.address.value = adds;
		self.close();
	}
</script>
</head>
<body bgcolor="#FFFFCC">
	<div align="center">
		<br />
		<form name="zipFrm" method="post">
			<table>
				<tr>
					<td>
					<br/>도로명 입력 : 	<input name="area3">
						<input type="button" value="검색" 
						onclick="loadSearch()">
					</td>
				</tr>
				<!-- 검색결과 시작 -->
				<%
						if(search.equals("y")){
							if(vlist.isEmpty()){
				%>
				<tr>
					<td align="center"><br/>검색된 결과가 없습니다.</td>
				</tr>
				<%}else{%>
				<tr>
					<td align="center"><br/>※검색 후, 아래 우편번호를 클릭하면 자동으로 입력됩니다.</td>
				</tr>
				<%
						for(int i=0;i<vlist.size();i++){
							ZipcodeBean bean = vlist.get(i);
							String zipcode = bean.getZipcode();
							String adds = bean.getArea1()+" ";
							adds+=bean.getArea2()+" ";
							adds+=bean.getArea3()+" ";
				%>
				<tr>
					<td><a href="#" onclick="sendAdd('<%=zipcode%>','<%=adds%>')">
					<%=zipcode+" "+adds%></a></td>
				</tr>
				<%			
							}//---for	
						}//---if2
					}//---if1
				%>
				<!-- 검색결과 끝 -->
				<tr>
					<td align="center"><br/>
					<a href="#" onClick="self.close()">닫기</a></td>
				</tr>
			</table>
			<input type="hidden" name="search" value="y">
		</form>
	</div>
</body>
</html>