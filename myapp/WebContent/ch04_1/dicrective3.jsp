<%@page contentType="text/html; charset=EUC-KR"
                  pageEncoding="EUC-KR"
                  trimDirectiveWhitespaces="false"
                  session="true"
%>
<!-- 
		charset : Client�� �޾ƺ� �ҽ��� ���ڵ� ���
		pageEncoding : ���� JSP �ҽ��� ���ڵ� ���
 -->
 trimDirectiveWhitespaces="false" �׽�Ʈ <br/>
<%
		request.setCharacterEncoding("EUC-KR");
		String s  = "�ѱ�";
%>
<%=s%><br/>
����ID :  <%=session.getId()%>




