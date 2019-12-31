<%@page contentType="text/html; charset=EUC-KR"%>
<%
		//form에 post 방식에 요청된 한글 처리를 위한 기능. 반드시 첫번째 라인
		//form에 get방식 server.xml 64라인 URIEncoding="EUC-KR" 세팅
		request.setCharacterEncoding("EUC-KR");
		//form에 입력한 값을 받기 위한 메소드. 매개변수 name값
		String name = request.getParameter("name");
		String studentNum = request.getParameter("studentNum");
		String gender = request.getParameter("gender");
		String major = request.getParameter("major");
		//hobby는 checkbox로 보내기 때문에 반드시 배열로 받아야 됨.
		String hobby[] = request.getParameterValues("hobby");
		String hobbys = "";
		for(int i = 0;i<hobby.length;i++){
			hobbys+=hobby[i]+"&nbsp;";
		}
		//String page = null;
		if(gender.equals("man")){
			gender = "남자";
		}else if(gender.equals("woman")){
			gender = "여자";
		}
%>
성명 : <%=name %><br/>
학번 : <%=studentNum %><br/>
성별 : <%=gender %><br/>
전공 : <%=major%><br/>
취미 : <%=hobbys%><br/>







