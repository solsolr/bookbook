<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/header1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/notice.css">
<script type="text/javascript" src="script/member.js"></script>
<script type="text/javascript" src="script/notice.js"></script>

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
	font-size: 16px;
    cursor: pointer;
    padding: 0;
	}
	#menu111{
	height: 53px;
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
						    <a><input id="menu111" type="button" value="회원정보" class="inputbutton" onclick="open_win('MemberServlet?command=member_check_pass_form&userid=<%=userid %>', 'update')"></a>
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
		
	<h3 class="title_1">>공지사항 수정</h3>
	<div id="wrap" align="center">
	<br><br>
		<form name="frm" method="post" action="NoticeServlet">
			<input type="hidden" name="command" value="notice_update"> <input
				type="hidden" name="num" value="${notice.num}">
			<table>
				<tr>
					<th>작성자</th>
					<td><input type="text" size="12" name="nname"
						value="${notice.nname}" readonly> * 필수</td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" size="12" name="pass"> *
						필수 (게시물 수정 삭제시 필요합니다.)</td>
				</tr>
				<tr>
					<th>제목</th>
					<td><input type="text" size="70" name="title"
						value="${notice.title}"></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><textarea cols="70" rows="15" name="content">${notice.content}</textarea></td>
				</tr>
			</table>
			<br>
			<br> <input type="submit" value="등록"
				onclick="return noticeCheck()" style="width:15%;line-height:30px;background-color:#6667ab;border:0;color:white;font-weight:700;font-size:18px;"> <input type="reset"
				value="다시 작성" style="width:15%;line-height:30px;background-color:#6667ab;border:0;color:white;font-weight:700;font-size:18px;"> <input type="button" value="목록"
				onclick="location.href='NoticeServlet?command=notice_list'" style="width:15%;line-height:30px;background-color:#6667ab;border:0;color:white;font-weight:700;font-size:18px;">
		</form>
	</div>
</body>
</html>