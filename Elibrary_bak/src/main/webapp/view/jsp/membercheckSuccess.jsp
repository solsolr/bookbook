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
if (window.name == "update") {
	window.opener.parent.location.href = "MemberServlet?command=mypage1&userid=${param.userid}";
} else if (window.name == 'delete') {
	alert('회원탈퇴 되었습니다.');
	window.opener.parent.location.href = "MemberServlet?command=member_delete&userid=${param.userid}";
	}
	window.close();
</script>
</body>
</html>