<!-- ReviewWriter.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%	request.setCharacterEncoding("EUC-KR");%>
<!-- Smart Editor -->
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<!-- Smart Editor -->
<textarea style="width:80%;" rows="10" cols="80" id="textAreaContent" name="content"></textarea>
<script type="text/javascript">
	
	var oEditors = []; //전역변수
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors, //전역변수명
	    elPlaceHolder: "textAreaContent", //에디터가 그려질 textarea id값
	    sSkinURI: " <%=request.getContextPath()%>/se2/SmartEditor2Skin.html ", // 에디터의 HTML
	    fCreator: "createSEditor2" , //se2basicCreator.js 메소드명
	    htParams : { // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
	    bUseToolbar : true, // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음) 
	    bUseVerticalResizer : true, // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음) 
	    bUseModeChanger : true,
	    }
	});
	
	//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.
	function submitContents(elClickedObj) {
	    // 에디터의 내용이 textarea에 적용된다.
	    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	 
	    // 에디터의 내용에 대한 값 검증은 이곳에서
	    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
	  
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {}
	}
	 
	// textArea에 이미지 첨부
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/beerking/userimg/'+filepath+'">';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}
</script>

