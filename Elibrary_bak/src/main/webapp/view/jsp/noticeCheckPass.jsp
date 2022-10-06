<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/notice.css">
<script type="text/javascript" src="script/notice.js"></script>
</head>
<body>
	<div id="wrap">
		<h1>비밀번호 확인</h1>
		<form action="NoticeServlet" name="frm" method="get">
			<input type="hidden" name="command" value="notice_check_pass">
			<input type="hidden" name="num" value="${param.num}">
			<table style="width: 50%">
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="pass" size="20"></td>
				</tr>
			</table>
			<br> <input type="submit" value=" 확 인 "
				onclick="return passCheck()" style="width:15%;line-height:30px;background-color:#6667ab;border:0;color:white;font-weight:700;font-size:18px;"> <br>
			<br>${message}
		</form>
	</div>
</body>
</html>