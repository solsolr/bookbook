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
	<h2>닉네임 중복확인</h2>
	<form action="nnameCheck.do" method="get" name="frm">
		<span class="span1"><b>닉네임</b></span> <input type=text name="nname" value="${nname}"> <input id="button_check" type=submit
			value="중복 체크" onclick="blank2('${nname}')"> <br><br>
		<c:if test="${result == 1}">
			<script type="text/javascript">
				opener.document.frm.nname.value = "";
			</script>
			<span class="span2"><b>${nname}는 이미 사용 중인 닉네임입니다.</b></span>
		</c:if>
		<c:if test="${result==-1}">
		<span class="span2"><b>${nname}는 사용 가능한 닉네임입니다.</b></span>
		<input id="button_check" type="button" value="사용" class="cancel" onclick="nnameok('${nname}')">
		</c:if>
	</form>
</body>
</html>