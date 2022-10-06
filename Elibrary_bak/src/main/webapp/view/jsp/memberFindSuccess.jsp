<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type="text/javascript">
if (window.name == "find_id") {
	var userid = "${userid}";
	opener.frm.userid.value = userid;
	alert('아이디를 찾았습니다.');
	window.close();
} else if (window.name == 'find_password') {
	alert('새로운 비밀번호로 변경해주세요.');
	var userid = "${userid}";
	location.href = "MemberServlet?command=member_password_update_form&userid="+userid;
}
</script>
</body>
</html>