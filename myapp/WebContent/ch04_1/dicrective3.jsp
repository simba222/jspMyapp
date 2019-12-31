<%@page contentType="text/html; charset=EUC-KR"
                  pageEncoding="EUC-KR"
                  trimDirectiveWhitespaces="false"
                  session="true"
%>
<!-- 
		charset : Client가 받아볼 소스의 인코딩 방식
		pageEncoding : 현재 JSP 소스의 인코딩 방식
 -->
 trimDirectiveWhitespaces="false" 테스트 <br/>
<%
		request.setCharacterEncoding("EUC-KR");
		String s  = "한글";
%>
<%=s%><br/>
세션ID :  <%=session.getId()%>




