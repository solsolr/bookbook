<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/modal.css">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<div align="center">
		<h1>비밀번호 확인</h1>
		<form action="MemberServlet" name="frm" method="get">
			<input type="hidden" name="command" value="member_check_pass">
			<input type="hidden" name="userid" value="${param.userid}">
			<table style="width: 80%">
				<tr>
					<th>비밀번호</th>
					<td class="d"><input id="password_check_input" type="password" name="pass" size="20"></td>
				</tr>
			</table>
			<br> <input id="button_check" type="submit" value=" 확 인 "
				onclick="return passCheck()"> <br>
			<br>${message}
		</form>
	</div>
</body>
</html>