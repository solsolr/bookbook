<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/modal.css">
<script>
//찾기 페이지 유효성 검사
function findCheck() {
	document.frm.userid.value = document.frm.userid.value.trim();
	if (document.frm.userid.value.length == 0) {
		alert("아이디를 입력하세요.");
		document.frm.userid.focus();
		
		return false;
	}
	if (document.frm.question.value == 0) {
		alert("질문을 선택하세요.");
		return false;
	}
	if (document.frm.answer.value.length == 0) {
		alert("질문에 대한 답을 입력하세요.");
		return false;
	}
	return true;
}
</script>
</head>
<body>
	<div align="center">
		<h1>비밀번호 찾기</h1>
		<form action="MemberServlet" name="frm" method="get">
			<input type="hidden" name="command" value="member_password_fine">
			<table style="width: 80%">
				<tr>
							<th class="a">아이디</th>
							<td class="b"><input type="text" name="userid" size="20"></td>
				</tr>
				<tr>
							<th class="a">본인확인 질문</th>
							<td class="b">	
								<select id="question" name='question'>
							  		<option value='00'>-- 선택 --</option>
							  		<option value='1'>가장 기억의 남는 소설 제목은?</option>
									<option value='2'>본인이 나온 초등학교는?</option>
									<option value='3'>어렸을적 키웠었던 애완동물 이름은?</option>
									<option value='4'>아버지 성함은?</option>
									<option value='5'>내 보물 1호는?</option>
								</select>
				</tr>
				<tr>
							<th class="a">답</th>
							<td class="b"><input type="text" name="answer"><br>
				</tr>
			</table>
			<br> <input id="button_check" type="submit" value=" 확 인 "
				onclick="return findCheck()"> <br>
			<br>${message}
		</form>
	</div>
</body>
</html>