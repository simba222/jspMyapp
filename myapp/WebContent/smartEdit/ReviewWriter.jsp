<!-- ReviewWriter.jsp -->
<%@ page contentType="text/html; charset=EUC-KR" %>
<%	request.setCharacterEncoding("EUC-KR");%>
<!-- Smart Editor -->
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js" charset="utf-8"></script>
<!-- Smart Editor -->
<textarea style="width:80%;" rows="10" cols="80" id="textAreaContent" name="content"></textarea>
<script type="text/javascript">
	
	var oEditors = []; //��������
	nhn.husky.EZCreator.createInIFrame({
	    oAppRef: oEditors, //����������
	    elPlaceHolder: "textAreaContent", //�����Ͱ� �׷��� textarea id��
	    sSkinURI: " <%=request.getContextPath()%>/se2/SmartEditor2Skin.html ", // �������� HTML
	    fCreator: "createSEditor2" , //se2basicCreator.js �޼ҵ��
	    htParams : { // ���� ��� ���� (true:���/ false:������� ����)
	    bUseToolbar : true, // �Է�â ũ�� ������ ��� ���� (true:���/ false:������� ����) 
	    bUseVerticalResizer : true, // ��� ��(Editor | HTML | TEXT) ��� ���� (true:���/ false:������� ����) 
	    bUseModeChanger : true,
	    }
	});
	
	//�����塯 ��ư�� ������ �� ������ ���� �׼��� ���� �� submitContents�� ȣ��ȴٰ� �����Ѵ�.
	function submitContents(elClickedObj) {
	    // �������� ������ textarea�� ����ȴ�.
	    oEditors.getById["textAreaContent"].exec("UPDATE_CONTENTS_FIELD", [ ]);
	 
	    // �������� ���뿡 ���� �� ������ �̰�����
	    // document.getElementById("textAreaContent").value�� �̿��ؼ� ó���Ѵ�.
	  
	    try {
	        elClickedObj.form.submit();
	    } catch(e) {}
	}
	 
	// textArea�� �̹��� ÷��
	function pasteHTML(filepath){
	    var sHTML = '<img src="<%=request.getContextPath()%>/beerking/userimg/'+filepath+'">';
	    oEditors.getById["textAreaContent"].exec("PASTE_HTML", [sHTML]);
	}
</script>

