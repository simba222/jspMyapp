<!-- fdeleteProc.jsp -->
<%@page contentType="text/html; charset=EUC-KR"%>
<jsp:useBean id="mgr" class="upload.FileloadMgr"/>
<%
		request.setCharacterEncoding("EUC-KR");
		//체크된 fch값을 리턴
		String snum[] = request.getParameterValues("fch");
		//문자열 snum을 int형 배열 변환. num의 크기는 snum의 크기 동일
		int num[] = new int[snum.length];
		//문자열 배열을 정수형 배열로 변환 값을 리턴(대입)
		for(int i=0;i<num.length;i++){
			num[i] = Integer.parseInt(snum[i]);
		}
		mgr.deleteFile(num);
		response.sendRedirect("flist.jsp");
%>








