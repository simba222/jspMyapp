<!-- script.jsp -->
<%@ page contentType="text/html; charset=EUC-KR"%>
<%!
		String declaration = "선언문";	
%>
<%!
		public String decMethod(){
			return declaration;
		}
%>
<%
		String scriptlet = "스크립트릿";
		String comment = "주석";
%>

선언문의 출력1 : <%=declaration%><br/>
선언문의 출력2 : <%=decMethod()%><br/>
스크립트릿의 출력 : <%=scriptlet%><br/>
<!-- JSP 주석부분 -->
<!-- JSP 주석1 <%=comment %> --><p/>
<%--JSP 주석2  <%=comment %> --%>
<%
		/*여러줄 주석*/
		//한줄 주석
%>





