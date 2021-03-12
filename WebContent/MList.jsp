<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MemberBoard | MemberList</title>
<style>
table, th, tr, td {
	border: 1px black solid;
	border-collapse: collapse;
}

th, td {
	padding: 5px;
}

.table {
	margin: auto;
}

.div1{
	width : 60%;
	margin: auto;
}

</style>
</head>
<body>
<div class="div1">
	<table class="table" style="text-align: center">

		<thead>
			<tr class="noborder">
			<td class="noborder" colspan="5">
			<div style="text-align: right">
		<select name="limit" id="limit" onchange="funSel()">
			<option>게시글 갯수</option>
			<option value="3">3개씩</option>
			<option value="5">5개씩</option>
			<option value="10">10개씩</option>
		</select>
	</div>
	</td>
			</tr>
			<tr>
				<th>번호</th>
				<th>이름</th>
			</tr>
		</thead>

		<tbody>
			<c:forEach var="member" items="${mList}" varStatus="num">
				<tr>
					<td>${num.count}</td>
					<td>${member.mName}</td>
					<td><a href="memberView?mId=${member.mId}">${member.mId}</a></td>
					<td><a href="memberDelete?mId=${member.mId}">탈퇴</a></td>
				</tr>

			</c:forEach>
		</tbody>
	</table>
	
</div>


	<!-- 페이징 처리 -->
	<div style="text-align: center">
		<!-- [이전] 에 대한 페이징 처리 -->
		<c:if test="${paging.page<=1}">[이전]&nbsp;</c:if>

		<c:if test="${paging.page>1}">
			<a href="PagingList?page=${paging.page-1}&limit=${paging.limit}">[이전]</a>&nbsp;
								</c:if>

		<!-- 페이지 숫자에 대한 페이징 처리 -->
		<c:forEach begin="${paging.startPage}" end="${paging.endPage}" var="i"
			step="1">
			<c:choose>

				<c:when test="${i eq paging.page}">
											${i}
										</c:when>

				<c:otherwise>
					<a href="memberList?page=${i}&limit=${paging.limit}">${i}</a>
				</c:otherwise>
			</c:choose>
		</c:forEach>

		<!-- [다음] 에 대한 페이징 처리 -->
		<c:if test="${paging.page>=paging.maxPage}">[다음]&nbsp;</c:if>

		<c:if test="${paging.page<paging.maxPage}">
			<a href="memberList?page=${paging.page+1}&limit=${paging.limit}">[다음]</a>&nbsp;
								</c:if>
	</div>
	
	

	

</body>

<script>
	function funSel() {
		var limit = document.getElementById("limit").value;
		location.href = "memberList?limit=" + limit;
	}
</script>


</html>