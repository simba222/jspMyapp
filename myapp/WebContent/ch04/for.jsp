<%@page contentType="text/html; charset=EUC-KR"%>
<%
		String msg = "for문 예제";
		//out 내장
		out.println(msg+"<br/>");
%>
<%=msg%><p/>
1. 1~10까지의 합을 식과 함께 출력하시오. (표현식만 사용)<br/>
<%
		int sum = 0;
		for(int i=1;i<11;i++){
			if(i<10){
		%>
			 <%=i+" + " %>
		<%		
			}else{
		%>
			<%=i+" = " %>
		<%		
			}
			sum+=i;
		}
%>
<%=sum%><p/>
2. 1~10까지의 합을 식과 함께 출력하시오. (out.println만 사용)<br/>
<%
		sum = 0;
		for(int i=1;i<11;i++){
			if(i<10){
				out.println("<b>"+ i + " +</b> ");
			}else{
				out.println("<b>"+ i + " =</b> ");
			}
			sum+=i;
		}
		out.println(sum+"<p/>");
%>






