<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberBoard | Join</title>
</head>
<style>
	td{
		padding : 3px;
	}
</style>

<body>
	
	 <form action="memberJoin" method="POST" name="joinForm">
	 	<table>
	 		<tr>
	 			<td>아이디</td>
	 			<td><input type="text" name="mId" id="mId">
	 				<input type="button" onclick="IdCheck()" value="중복확인">
	 				<br><span id="idResult"></span></td>
	 		</tr>
	 		<tr>
	 			<td>패스워드</td>
	 			<td><input type="password" name="mPw" id="mPw"></td>
	 		</tr>
	 		<tr>
	 			<td colspan="2">
	 				<input type="button" onclick="submitForm()" value="회원가입">
	 				<input type="reset" value="다시작성">
	 			</td>
	 		</tr>
	 		
	 	</table>
	 </form>
	
</body>

<script>
	var checkId = false;
	
	var mId = document.getElementById("mId");
	var idResult = document.getElementById("idResult");
	idResult.style.color ="#ff0000";
	idResult.innerHTML="사용중인 아이디 입니다!!";
	
	
	console.log(checkId);
	function IdCheck(){
		var mId = document.getElementById("mId");
		var idResult = document.getElementById("idResult");
		
		if(mId.value==""){
			idResult.style.color ="#ff0000";
			idResult.innerHTML="아이디를 입력해 주세요!";
		} else {
			location.href="idCheck?mId="+mId.value;
		}
	}
	
	function submitForm(){
		alert('아이디 중복체크를 해주세요!');
	}
</script>


</html>