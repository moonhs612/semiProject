<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberBoard | 회원정보</title>
<style>
table, tr, td, th {
	border: 1px solid black;
	border-collapse: collapse;
	padding: 3px;
}
</style>
</head>
<body>

	<table>
		<caption>${member.mId}님회원정보</caption>
		<tr>
			<th>아이디</th>
			<td>${member.mId}</td>
		</tr>
		<tr>
			<th>패스워드</th>
			<td>${member.mPw}</td>
		</tr>
		<tr>
			<td colspan="2">
				<button onclick="location.href='memberModifyForm?mId=${member.mId}'">수정하기</button>

				<c:if test="${sessionScope.loginId eq member.mId}">
					<button onclick="location.href='memberDelete?mId=${member.mId}'">탈퇴하기</button>
				</c:if>
				
				<button onclick="location.href='memberList'">회원목록보기</button>
			</td>
		</tr>
	</table>


</body>
</html>