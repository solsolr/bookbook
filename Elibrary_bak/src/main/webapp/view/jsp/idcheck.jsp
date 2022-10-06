<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/modal2.css">
<script type="text/javascript" src="script/member.js"></script>
</head>
<body>
	<h2>아이디 중복확인</h2>
	<form action="idCheck.do" method="get" name="frm">
		<span class="span1"><b>아이디</b></span> <input type=text name="userid" value="${userid}"> <input id="button_check" type=submit
			value="중복 체크" onclick="blank1('${userid}')"> <br><br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.userid.value = "";
			</script>
			<span class="span2"><b>${userid}는 이미 사용 중인 아이디입니다.</b></span>
		</c:if>
		<c:if test="${result==-1}">
		<span class="span2"><b>${userid}는 사용 가능한 아이디입니다.</b></span>
		<input id="button_check" type="button" value="사용" class="cancel" onclick="idok('${userid}')">
		</c:if>
	</form>
</body>
</html>
