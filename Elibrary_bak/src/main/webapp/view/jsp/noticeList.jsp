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
<script type="text/javascript" src="script/member.js"></script>
<link href="css/header1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/notice.css">
<link rel="icon" type="image/png" sizes="16x16" href="image/logo.ico">
<style>
	/*input type = button css 입니당 == 회원정보 버튼  */
	/*아니 이거 왜 css에다가 넣으면 적용 안되는데?*/

	input[type="button"] {
	border:none;    /*---테두리 정의---*/
	background-color: #f1f1f1;   /*--백그라운드 정의---*/
	font-size:16px;      /*--폰트 정의---*/
	/*font-weight:bold;   /*--폰트 굵기---*/
	color: black;    /*--폰트 색깔---*/
	/*width: 112px; height: 53px;  /*--버튼 크기---*/
	height: 53px;
	font-size: 16px;
    cursor: pointer;
    padding: 0;
	}

	input[type="button"]:hover {
    background-color: #ddd;
	}
	
	a:hover input[type="button"]{
	background-color: #ddd;
	}
	a:hover{
	cursor: pointer;
	}
	</style>
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
						    <a><input type="button" value="회원정보" class="inputbutton" onclick="open_win('MemberServlet?command=member_check_pass_form&userid=<%=userid %>', 'update')"></a>
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
		
	<h3 class="title_1">>공지사항</h3>
	<div id="wrap" align="center">
	<br><br>
		<table class="list">
			<%
			if((Integer)session.getAttribute("role") != null && (Integer)session.getAttribute("role") == 1){ %>
			<tr>
				<td colspan="5" style="border: white; text-align: right"><a
					href="NoticeServlet?command=notice_write_form">게시글 등록</a></td>
			</tr>
			<% } %>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>작성자</th>
				<th>작성일</th>
				<th>조회</th>
			</tr>
			<c:forEach var="notice" items="${noticeList }"  varStatus="status">
				<tr class="record">
					<td>${fn:length(noticeList) - status.count + 1 }</td>
					<td><a href="NoticeServlet?command=notice_view&num=${notice.num}">
							<b>${notice.title }</b> </a></td>
					<td>${notice.nname}</td>
					<td><fmt:formatDate value="${notice.writedate }" /></td>
					<td>${notice.readcount}</td>
				</tr>
			</c:forEach>
		</table>
	</div>
	
	
</body>
</html>