<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
table, th, tr, td {
	border: 1px black solid;
	border-collapse: collapse;
}

th, td {
	padding: 10px;
}

.table {
	margin: auto;
}

.div1{
	width : 100%;
	margin: auto;
}
</style>
</head>
<body>
<div class="div1">
	<table class="table" style="text-align: center">
		<thead>
			<tr>
				<th> 순위 </th>
				<th> 아이디 </th>
				<th> 점수 </th>
				<td><button onclick="inti()">메인페이지로</button></td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="bview" items="${bList}" varStatus="num">
				<tr>
					<td>${num.count}</td>
					<td>${bview.bId}</td>
					<td>${bview.bSocre}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</body>
<script>
	function inti() {
		location.href = "index.jsp";
	}
</script>
</html>