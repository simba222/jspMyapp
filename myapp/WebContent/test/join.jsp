<!-- 회원가입 페이지 -->
<%@ page contentType="text/html; charset=UTF-8"%>
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
	window.onload = function() {
		
		function appendYear() {
			var date = new Date();
			var year = date.getFullYear();
			var selectValue = document.getElementById("year");
			//var selectValue = document.regFrm.year;
			var optionIndex = 0;
			for (var i = year - 100; i <= year; i++) {
				selectValue.add(new Option(i, i), optionIndex++);
			}
			for (var i = 0; i <= 100; i++) {
				 if(selectValue.options[i].value=='1982'){
					selectValue.options[i].selected = true;
				} 
			}
		}
		
		function appendMonth() {
			var selectValue = document.getElementById("month");
			var optionIndex = 0;
			for (var i = 1; i <= 12; i++) {
				selectValue.add(new Option(i, i), optionIndex++);
			}
		}
		function appendDay() {
			var selectValue = document.getElementById("day");
			var optionIndex = 0;
			for (var i = 1; i <= 31; i++) {
				selectValue.add(new Option(i, i), optionIndex++);
			}
		}
		appendYear();
		appendMonth();
		appendDay();


		//이메일 입력방식 선택 
		$('#selectEmail').change(function() {
			$("#selectEmail option:selected").each(function() {
				if ($(this).val() == '1') { //직접입력일 경우 
					$("#str_email02").val(''); //값 초기화 
					$("#str_email02").attr("readOnly", false); //활성화 
				} else { //직접입력이 아닐경우 
					$("#str_email02").val($(this).text()); //선택값 입력
					$("#str_email02").attr("readOnly", true); //비활성화
				}
			});
		});
	}

</script>
<html>
<head>
<title>부산여행갑시다 그럽시다</title>
</head>
<style type="text/css">
table{
 border-spacing: 5px 5px;
}
</style>
<body>
	<div align="center">
		<!-- <iframe name="ifm" style="width: 0; height: 0;"></iframe> -->
		<form name="regFrm" method="post" action="joinProc.jsp">
			<table id="tbl1" cellpadding="3" style="width: 440px">
				<tr>
					<td id="title" align="center">회&nbsp;원&nbsp;가&nbsp;입</td>
				</tr>
				</table>
				<table>
				<tr></tr>
				<tr>
					<td>아이디</td>
				</tr>
				<tr>
					<td>
							<input name="id" > 
							<input type="button"	 value="중복 확인" onclick="javascript:idCheck(this.form.id.value)">
				    </td>
				</tr>
				<tr>
					<td>비밀번호</td>
				</tr>
				<tr>
					<td><input type="password" name="pwd"></td>
				</tr>
				<tr>
					<td>비밀번호 확인</td>
				</tr>
				<tr>
					<td><input type="password" name="repwd"></td>
				</tr>
				<tr>
					<td>이름</td>
				</tr>
				<tr>
					<td><input name="name"></td>
				</tr>
				<tr>
					<td>생년월일</td>
				</tr>
				<tr>
					<td>
					 <select id="year" name="year" style="width: 100px;"></select> 년&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="month" name="month" style="width: 50px;"></select> 월&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<select id="day" name = "day" style="width: 50px;"></select>일
					
					</td>
				</tr>
				<tr>
					<td>성별</td>
				</tr>
				<tr>
					<td><select name=gender>
							<option value="0" selected>선택하세요.</option>
							<option value="male">남성</option>
							<option value="female">여성</option>
					</select></td>
				</tr>
				<tr>
					<td>이메일</td>
				</tr>
				<tr>
					<td><input type="text" name="str_email01" id="str_email01"
						style="width: 130px"> @ <input type="text"
						name="str_email02" id="str_email02" style="width: 150px;" readOnly
						value="naver.com">
						 <select style="width: 150px; margin-right: 10px" name="selectEmail"
						id="selectEmail">
							<option value="1">직접입력</option>
							<option value="naver.com" selected>naver.com</option>
							<option value="hanmail.net">hanmail.net</option>
							<option value="nate.com">nate.com</option>
							<option value="gmail.com">gmail.com</option>
					</select>
				</tr>
				<tr>
					<td>주소</td>
				<tr>
				<tr>
					<td><input name="zipcode"> <input type="button"
						value="  우편번호 검색  " onclick="zipSearch()"></td>
				</tr>
				<tr>
					<td><input name="address1" size="45"></td>
				</tr>
				<tr>
					<td><input name="address2" size="45"></td>
				</tr>

				<tr>
					<td align="center">개인정보 취급방침</td>
				</tr>
				<tr>
					<td><textarea name="privacy" style="width: 100%" rows="5"
							cols="40" disabled="disabled">
			1. 개인정보의 처리 목적 <부산여행>(‘busan’이하 ‘부산여행’) 은(는) 다음의 목적을 위하여 개인정보를 처리하고 있으며, 다음의 목적 이외의 용도로는 이용하지 않습니다.
- 고객 가입의사 확인, 고객에 대한 서비스 제공에 따른 본인 식별.인증, 회원자격 유지.관리, 물품 또는 서비스 공급에 따른 금액 결제, 물품 또는 서비스의 공급.배송 등

			</textarea></td>
				<tr>
					<td align="center"><input type="radio" name="privacy"
						value="1">동의합니다 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input
						type="radio" name="privacy" value="2" checked="checked">동의하지
						않습니다</td>
				</tr>
				<tr>
					<td align="center"><br /> <input type="button" id="btn1"
						value="회&nbsp;원&nbsp;가&nbsp;입" onclick="inputCheck()">
				</tr>

			</table>
		</form>
	</div>
</body>
</html>
