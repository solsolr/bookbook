<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
	<title>쀽쀽</title>
	
	<link href="css/header.css" rel="stylesheet">
	<link rel="icon" type="image/png" sizes="16x16" href="image/logo.ico">
	<script type="text/javascript" src="script/member.js"></script>
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
		<div class="header2">
			<form action="ElibraryServlet" method="get">
			<input type="hidden" name="command" value="booksearchpage">

				<div class="logo">
					<img src="image/logo.jpg">
					<div class="logo_content"><b>자유로운 연재 출간 플랫폼</b></div>
					<a href="ElibraryServlet?command=main"><b>쀾쀾</b></a>
					<input type="submit" value=""  class="search-btn">
				    <input class="search-txt" name = "keyword" type="text" placeholder="검색어를 입력해 주세요">
				</div>
			</form>
		</div>
		<div class="clear"></div>
		<div class="header3">
			<img src="image/menu.jpg">
			<ul>
				<li class="menu">
					<a href="BookServlet?command=booklist"><b>도서</b></a>
				</li>
				<li class="menu">
					<a href="NovelServlet?command=novellist"><b>자유연재</b></a>
				</li>
				<li class="menu">
					<a href="NoticeServlet?command=notice_list"><b>공지사항</b></a>
				</li>
			</ul>
		</div>
		<div class="menu_all_dp">
			<div class="menu_all_list">
				<ul>
					<li><c:set var="genre" value="소설" /><a href="BookServlet?command=bookgenrelist&genre=${genre}">소설</a></li>
					<li><c:set var="genre" value="시" /><a href="BookServlet?command=bookgenrelist&genre=${genre}">서적/시</a></li>
					<li><c:set var="genre" value="여행" /><a href="BookServlet?command=bookgenrelist&genre=${genre}">여행</a></li>
					<li><c:set var="genre" value="정치사회" /><a href="BookServlet?command=bookgenrelist&genre=${genre}">정치사회</a></li>
					<li><c:set var="genre" value="역사문화" /><a href="BookServlet?command=bookgenrelist&genre=${genre}">역사문화</a></li>
				</ul>
			</div>


				</ul>
			</div>
		</div>
	</header>
</body>
</html>