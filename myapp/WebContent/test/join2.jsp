<%@page contentType="text/html; charset=UTF-8"%>
<html>
<head>
<title></title>
<script type="text/javascript">
	function characterCheck() {
		var regExp1 = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;//정규식 구문
		var regExp2 = /[ㄱ-ㅎㅏ-ㅡ가-핳]/;
		var obj = document.getElementsByName("id")[0]
		if (regExp1.test(obj.value)) {
			alert("특수문자는 입력하실 수 없습니다.");
			obj.value = obj.value.substring(0, obj.value.length - 1);//특수문자를 지우는 구문
			return;
		}
		if (regExp2.test(obj.value)) {
			alert("한글은 입력하실 수 없습니다.");
			obj.value = obj.value.substring(0, obj.value.length - 1);
			return;
		}
	}
</script>
</head>
<body>
	<form>
		id : <input name="id" onkeyup="characterCheck()"
			onkeydown="characterCheck()">
	</form>
</body>
</html>