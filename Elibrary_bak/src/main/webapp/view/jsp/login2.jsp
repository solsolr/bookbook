<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!doctype html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>쀽쀽</title>
		<link rel="stylesheet" type="text/css" href="css/login.css">
		<script type="text/javascript" src="script/member.js"></script>
		<script>
			var message = '${message}';
			if(message) {
				alert('${message}');
			}
		</script>
		<link rel="icon" type="image/png" sizes="16x16" href="image/logo.ico">
		
		<style>
		/*input type = button css 입니당 == 회원정보 버튼  */
		/*아니 이거 왜 css에다가 넣으면 적용 안되는데?*/
	
		/*회원찾기 버튼*/
			#login .findbutton1{
				cursor: pointer;
				border: 0;
				outline: none;
				color: white;
				width: 49.5%;
				height: 100%;
				background-color: #6667ab;
				display: inline-block;
				float: left;
				color: white;
				font-weight: 600;
				padding: 0;
			}
			
			#login .findbutton2{
				cursor: pointer;
				border: none;
				outline: none;
				color: white;
				width: 49.5%;
				height: 100%;
				background-color: #6667ab;
				display: inline-block;
				float: right;
				color: white;
				font-weight: 600;
				padding: 0;
			}
			
			#login .findbutton1:hover{
				background-color: #2E2F95;
			}
			#login .findbutton2:hover{
				background-color: #2E2F95;
			}
		</style>
	</head>
	<body>
	<div class="header2">
		
			<div class="logo">
				<a href="ElibraryServlet?command=main"><img src="image/logo.jpg"></a>
				<div class="logo_content"><b>자유로운 연재 출간 플랫폼</b></div>
				<a href="ElibraryServlet?command=main"><b>쀾쀾</b></a>

			</div>
		
	</div>

	<div id="login">
		
				<h3>> 로그인</h3>
				<form action="MemberServlet?command=login" method="post" name="frm">
					<table id="table1">
						<tr>
							<th class="a">아이디</th>
							<td class="b"><input type="text" name="userid"></td>
						</tr>
						<tr>
							<th class="a">비밀번호</th>
							<td class="b"><input type="password" name="pw"><br>
						</tr>
						<tr>
							<th class="a" rowspan="2"></th>
					  		<td class="b"><button type="submit" class="loginbtn" onclick="return memberCheck()">로그인</button></td>
						</tr>
						<tr>
					  		<td class="b">
					  		<button type="button" class="findbutton1" onclick="open_win('MemberServlet?command=member_fine_form&window=find_id', 'find_id')">아이디 찾기</button>
							<button type="button" class="findbutton2" onclick="open_win('MemberServlet?command=member_fine_form&window=find_password', 'find_password')">비밀번호 찾기</button>	
							</td>
						</tr>
					</table>
				</form>
	</div>

	</body>
	</html>