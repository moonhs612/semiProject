<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberBoard|회원수정</title>
<style>
table, tr, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 3px;
}
</style>
</head>
<body>
	<form action="memberModify" method="POST" name="modiForm"
		enctype="multipart/form-data">
		<table>
			<caption>${modify.mId}님회원정보</caption>
			<tr>
				<th>아이디</th>
				<td>${modify.mId}</td>
				<input type="hidden" name="mId" value="${modify.mId}">
			</tr>
			<tr>
				<th>현재 패스워드</th>
				<td><input type="password" id="mPw"></td>
			</tr>
			<tr>
				<th>변경할 패스워드</th>
				<td><input type="password" name="mPw"></td>
			</tr>
			<tr>
				<td colspan="2">
				<input type="button" value="정보수정"	onclick="memberModify()"> 
				<input type="reset" value="다시작성">
				</td>
			</tr>
		</table>
	</form>

</body>

<script>
	function memberModify() {
		var password = '${modify.mPw}';
		var passwordConfirm = document.getElementById("mPw").value;

		if (password == passwordConfirm) {
			modiForm.submit();
		} else {
			alert('비밀번호가 틀립니다.');
		}
	}
</script>





</html>