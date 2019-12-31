<%@page contentType="text/html; charset=EUC-KR"%>
<%
		request.setCharacterEncoding("EUC-KR");
		//form 두개 이상의 동일한 name으로 넘어오는 값은 배열처리
		String hobby[] = request.getParameterValues("hobby");
		for(int i=0;i<hobby.length;i++){
			out.println(hobby[i] + "&nbsp;");
		}
		//MemberBean에서 hobby를 배열 선언 : setProperty
		//bean.setHobby(request.getParameterValues("hobby"));
%>