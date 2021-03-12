<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberBoard | Join</title>
</head>
<style>
td {
	padding: 3px;
}
</style>

<body>

	<form action="memberJoin" method="POST" name="joinForm">
		<table>
			<tr>
				<td>아이디</td>
				<td><input type="text" name="mId" id="mId" value="${mId}">
					<input type="button" onclick="IdCheck()" value="중복확인"> <br>
				<span id="idResult"></span></td>
			</tr>
			<tr>
				<td>패스워드</td>
				<td><input type="password" name="mPw" id="mPw"
					onkeyup="PwCheck()"> <br>
				<span id="pwResult"></span></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" onclick="submitForm()"	value="회원가입">
				<input type="reset" value="다시작성"></td>
			</tr>

		</table>
	</form>

</body>

<script>
	var checkId = true;

	var mId = document.getElementById("mId");
	var idResult = document.getElementById("idResult");
	idResult.style.color = "#0000ff";
	idResult.innerHTML = "사용가능한 아이디 입니다!!";

	console.log(checkId);
	function IdCheck() {
		var mId = document.getElementById("mId");
		var idResult = document.getElementById("idResult");

		if (mId.value == "") {
			idResult.style.color = "#ff0000";
			idResult.innerHTML = "아이디를 입력해 주세요!";
		} else {
			location.href = "idCheck?mId=" + mId.value;
		}
	}

	function PwCheck() {
		var mPw = document.getElementById("mPw");
		var pwResult = document.getElementById("pwResult");

		var mPwVal = mPw.value;

		var num = mPwVal.search(/[0-9]/g);
		var eng = mPwVal.search(/[a-z]/ig);
		var spe = mPwVal.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi);

		if (mPwVal.length <= 0) {
			pwResult.innerHTML = "";
			return false;
		} else if (mPwVal.length!=4) {
			pwResult.style.color = "#ff0000";
			pwResult.innerHTML = "4자리로 입력해주세요!";
			return false;
		} else if (mPwVal.search(/\s/) != -1) {
			pwResult.style.color = "#ff0000";
			pwResult.innerHTML = "비밀번호는 공백 없이 입력해주세요!";
			return false;
		} else if (num < 0 || eng > 0 || spe > 0) {
			pwResult.style.color = "#ff0000";
			pwResult.innerHTML = "숫자만 입력하세요!";
			return false;
		} else {
			pwResult.style.color = "#0000ff";
			pwResult.innerHTML = "적절한 비밀번호 입니다!";
			return true;
		}

	}
	

	
	function submitForm() {
		
		if (!checkId) {
			alert('아이디를 확인해주세요!');
		} else if (!PwCheck()) {
			alert('비밀번호를 확인해주세요!');
		} else {
			joinForm.submit();	
		}		


	}
	
</script>




</html>