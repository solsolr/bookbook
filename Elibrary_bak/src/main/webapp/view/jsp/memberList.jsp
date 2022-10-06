<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>memberList</title>
<link rel="stylesheet" type="text/css" href="css/shopping.css">
</head>
<body>
	<div id="wrap" align="center">
		<h1>사용자 리스트</h1>
		<table class="list">
			<tr>
				<td colspan="7" style="border: white; text-align: right"><a
					href="MemberServlet?command=sign_up_form">사용자 등록</a></td>
			</tr>
			<tr>
				<th>userid</th>
				<th>pw</th>
				<th>admin</th>
				<th>nname</th>
				<th>payment</th>
				<th>question</th>
				<th>answer</th>
			</tr>
			<c:forEach var="member" items="${memberList}">
				<tr class="record">
					<td>${member.userid }</td>
					<td>${member.pw}</td>
					<td>${member.admin}</td>
					<td>${member.nname}</td>
					<td>${member.payment}</td>
					<td>${member.question}</td>
					<td>${member.answer}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>