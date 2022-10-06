<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>쀽쀽</title>
		<link rel="stylesheet" type="text/css" href="css/login2.css">
		<link rel="stylesheet" type="text/css" href="css/header1.css">
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript" src="script/member.js"></script>
		<link rel="icon" type="image/png" sizes="16x16" href="image/logo.ico">
	</head>
	<body>
	<header>
			<div class="header1">
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
				<a href="ElibraryServlet?command=main"><img src="image/logo.jpg"></a>
				<div class="logo_content"><b>자유로운 연재 출간 플랫폼</b></div>
				<a href="ElibraryServlet?command=main"><b>쀾쀾</b></a>

			</div>
		
	</div>

	<div id="login">
		
				<h3>> 회원가입</h3>
				<form name="frm" method="post" action="MemberServlet">
					<input type="hidden" name="command" value="sign_up">
					<table id="table2">
						<tr>
							<th class="a">아이디</th>
							<td class="b"><input type="text" name="userid" onkeydown="inputIdChk()"></td>
										<input type="hidden" name="reid" size="20">
							<td class="C"><input type="button" class="button2" value="중복확인" onclick="OpenidChk()">
										  <input type="hidden" name="idDuplication" value="idUncheck"></td>
						</tr>
						<tr>
							<th class="a">닉네임</th>
							<td class="b"><input type="text" name="nname" onkeydown="inputNnameChk()"><br>
											<input type="hidden" name="reid2" size="20">
							<td class="C"><input type="button" class="button2" value="중복확인" onclick="opeNnameChk()">
										  <input type="hidden" name="NnameDuplication" value="NnameUncheck"></td>
						</tr>
						<tr>
							<th class="a">비밀번호</th>
							<td class="b"><input type="password" name="pw"><br>
							<td class="c"  rowspan="5">
						</tr>
						<tr>
							<th class="a">비밀번호 확인</th>
							<td class="b"><input type="password" name="pwd"><br>
						</tr>
						
						<tr>
							<th class="a">본인확인 질문</th>
							<td class="b">	<select name='question'>
											  <option value='00' selected>-- 선택 --</option>
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
						
						<tr>
							<th class="a"></th>
							<td class="b"><button id="button1" type="submit" onclick="return MemberCheck()"><span>회원가입</span></button>
						</tr>
			
	
					</table>
				</form>
	</div>

	</body>
	</html>