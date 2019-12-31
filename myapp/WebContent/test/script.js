		 function idCheck(id) {
				frm = document.regFrm;
				if(id==""){
					alert("아이디를 입력해주세요.");
					frm.id.focus();
					return;
				} 
				if((id < "0" || id > "9") && (id < "A" || id > "Z") && (id < "a" || id > "z")){ 
					alert("한글 및 특수문자는 아이디로 사용하실 수 없습니다.");
					return;
				}	else{
					 url="idCheck.jsp?id="+id;
					 var popupX = (window.screen.width / 2) - (200 / 2);
					 var popupY= (window.screen.height / 2) - (300 / 2);
					 window.open(url,"IDCheck","status=no,width=300,height=200, left="+ popupX + ", top="+ popupY);
				}				
		 }
		 

		
function zipSearch() {
	url = "zipSearch.jsp?search=n";
	window.open(url, "ZipCodeSearch",
			"width=500,height=700,scrollbars=yes");
}

function inputCheck(){
	if(document.regFrm.id.value==""){
		alert("아이디를 입력해 주세요.");
		document.regFrm.id.focus();
		return;
	}
	
	if(document.regFrm.value!=idC)
	if(document.regFrm.pwd.value==""){
		alert("비밀번호를 입력해 주세요.");
		document.regFrm.pwd.focus();
		return;
	}

	if(document.regFrm.repwd.value==""){
		alert("비밀번호를 확인해 주세요");
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.pwd.value != document.regFrm.repwd.value){
		alert("비밀번호가 일치하지 않습니다.");
		document.regFrm.repwd.value="";
		document.regFrm.repwd.focus();
		return;
	}
	if(document.regFrm.name.value==""){
		alert("이름을 입력해 주세요.");
		document.regFrm.name.focus();
		return;
	}
	
    if(document.regFrm.year.value=="0"){
		alert("생년월일을 선택해 주세요.");
		document.regFrm.year.focus();
		return;
	}
    if(document.regFrm.month.value=="0"){
		alert("생년월일을 선택해 주세요.");
		document.regFrm.month.focus();
		return;
	}
    if(document.regFrm.day.value=="0"){
		alert("생년월일을 선택해 주세요.");
		document.regFrm.day.focus();
		return;
	}

	if(document.regFrm.gender.value=="0"){
		alert("성별을 선택해 주세요.");
		document.regFrm.gender.focus();
		return;
	}
	
	if(document.regFrm.str_email01.value==""){
		alert("이메일을 입력해 주세요.");
		document.regFrm.str_email01.focus();
		return;
	}
	if(document.regFrm.str_email02.value==""){
		alert("E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!");
		document.regFrm.str_email02.focus();
		return;
	}
/*    var str=document.regFrm.str_email02.value;	   

    var atPos = str.indexOf('@');
    var atLastPos = str.lastIndexOf('@');

    var dotPos = str.indexOf('.'); 
    var spacePos = str.indexOf(' ');
    var commaPos = str.indexOf(',');
    var eMailSize = str.length;
    if (atPos > 1 && atPos == atLastPos && 
	   dotPos > 3 && spacePos == -1 && commaPos == -1 
	   && atPos + 1 < dotPos && dotPos + 1 < eMailSize);
    else {
          alert('E-mail주소 형식이 잘못되었습니다.\n\r다시 입력해 주세요!');
	      document.regFrm.str_email02.focus();
		  return;
    }*/

    if(document.regFrm.zipcode.value==""){
		alert("우편번호를 입력해 주세요.");
		return;
	}
    if(isNan(document.regFrm.zipcode.value)){
    	alert("우편번호는 숫자만 입력가능합니다.");
    }
    if(document.regFrm.address1.value==""){
		alert("주소를 입력해 주세요.");
		return;
	}
    if(document.regFrm.address2.value==""){
		alert("상세 주소를 입력해 주세요.");
		return;
	}
	if(document.regFrm.privacy[1].checked==false){
		alert("회원가입에는 개인정보 처리의 동의가 필요합니다")
		document.regFrm.privacy[1].focus();
		return;
	}
				
	document.regFrm.submit();
}



function win_close(){
	self.close();
}