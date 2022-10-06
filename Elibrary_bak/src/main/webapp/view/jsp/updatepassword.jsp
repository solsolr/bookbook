<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/modal.css">
<script>
var message = "${message}";
if(message=='ok'){    
	window.opener.location.href="MemberServlet?command=login_form"; //부모창 페이지 이동!!!!!!!!
	alert("비밀번호 변경이 완료되었습니다.")
	window.close();
}
//비밀번호 유효성 검사
function passUpdateCheck() {
	if (document.frm.pw.value.length == 0) {
		alert("비밀번호를 입력하세요.");
		return false;
	}
	if (document.frm.pwd.value.length == 0) {
		alert("비밀번호 확인을 입력하세요.");
		return false;
	}
	if(document.frm.pw.value != document.frm.pwd.value ){                
		alert("비밀번호를 동일하게 입력하세요.");                
		return false;            
	}
	return true;
}
</script>
</head>
<body>
	<div align="center">
		<h1>비밀번호 변경</h1>
		<form action="MemberServlet" name="frm" method="get">
			<input type="hidden" name="command" value="member_password_update">
			<input type="hidden" name="userid" value="${param.userid}">
			<table style="width: 80%">
						<tr>
							<th class="a">비밀번호</th>
							<td class="b"><input type="password" name="pw"><br>
						</tr>
						<tr>
							<th class="a">비밀번호 확인</th>
							<td class="b"><input type="password" name="pwd"><br>
						</tr>
			</table>
			<br> <input id="button_check" type="submit" value=" 확 인 "
				onclick="return passUpdateCheck()"> <br>
			<br>${message}
		</form>
	</div>
</body>
</html>