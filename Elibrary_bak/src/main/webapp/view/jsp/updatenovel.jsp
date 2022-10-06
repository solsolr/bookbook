<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>쀽쀽</title>
<link href="css/header1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/notice.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script type="text/javascript" src="script/novel.js"></script>
<link rel="icon" type="image/png" sizes="16x16" href="image/logo.ico">
</head>
<body>
	<header>
		<div class="header1">
		<%
			if((String)session.getAttribute("userid")!=null) {
				String nname = (String)session.getAttribute("nname");
				String userid = (String)session.getAttribute("userid");
		%>
			<ul>
				<li><div class="dropdown">
						<button class="dropbtn">마이페이지</button>
						<div class="dropdown-content">
						    <a href="MemberServlet?command=mypage1">회원정보</a>
						    <a href="MemberServlet?command=mypage2">내 서재</a>
						    <a href="#">관심사</a>
						</div>
					</div>
				</li>
				<li> | </li>
				<li><a href="MemberServlet?command=logout"><b>로그아웃</b></a></li>
				<li><font color="red"><b><%=nname %></b></font>님 환영합니다.</li>
			</ul>
		<% } else { %>
			<ul>
				<li><a href="MemberServlet?command=login_form"><b>로그인</b></a></li>
				<li> | </li>
				<li><a href="MemberServlet?command=sign_up_form"><b>회원가입</b></a></li>
			</ul>
		<% } %>
		</div>
	</header>
	
	<div class="header2">

		<div class="logo">
			<img src="image/logo.jpg">
			<div class="logo_content"><b>자유로운 연재 출간 플랫폼</b></div>
			<a href="ElibraryServlet?command=main"><b>쀾쀾</b></a>
		</div>
	
	</div>
		
	<h3 class="title_1">>자유연재 글 수정</h3>
	<br><br>
	<div id="wrap" align="center">
		<form action="NovelServlet" method="post">
			<input type="hidden" name="command" value="updatemybook">
			<input type="hidden" name="uno" value="${novel.uno }">
			<table>
				<tr>
					<th>제목</th>
					<td style="color: #6667ab;"><b>${novel.utitle }</b></td>
				</tr>
				<tr>
					<th>부제목</th>
					<td><input type="text" name="usubtitle" id="usubtitle" value="${novel.usubtitle }" style="width: 90%;line-height:30px;"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td height="300px"><textarea name="ucontent" id="ucontent" style="width: 90%;height:95%;">${novel.ucontent }</textarea></td>
				</tr>
				<tr>
					<th>등록일</th>
					<td><fmt:formatDate value="${novel.udate }" pattern="yyyy-MM-dd"/></td>
				</tr>
				<tr>
					<th>이미지</th>
					<td>
						<input type="text" name="uimage" id="uimage" value="${novel.uimage }" style="width: 90%;line-height:30px;"><br>
						<font color="red">※ 이미지 호스팅된 url만 입력해주세요.</font>
					</td>
				</tr>
				<tr>
					<td colspan="2" style="text-align:center;border:0;">
						<input type="button" value="취소" onclick="history.back()" style="width:15%;line-height:30px;background-color:#6667ab;border:0;color:white;font-weight:700;font-size:18px;">		
						<input type="submit" value="수정" onclick="return novelCheck()" style="width:15%;line-height:30px;background-color:#6667ab;border:0;color:white;font-weight:700;font-size:18px;">
					</td>
				</tr>
			</table>
		</form>
	<br><br>
	</div>
</body>
</html>