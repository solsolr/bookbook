<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>

	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>쀽쀽</title>
		<link rel="stylesheet" type="text/css" href="css/header1.css">
		<link rel="stylesheet" type="text/css" href="css/login.css">
				<script src="http://code.jquery.com/jquery.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<link rel="icon" type="image/png" sizes="16x16" href="image/logo.ico">
	
	<style>
			/*라디오 선택 상자 작게*/
			#contactChoice1, #contactChoice2, #contactChoice3{
				width: 3% !important;
				height: 40% !important;
			}
			
			/*form-footer 간격 주기*/
			#login form {
				margin-bottom: 5%;
			}
			
			#mypage1_form{
				width: 100% !important;
				margin-top: 3%;
				text-align: center;
			}
			
			#table3{
				height: 400px !important; 	
				padding-top: 3%;		
			}
			
			.button2{
				cursor: pointer;
				border: none;
				width: 70%;
				height: 90%;
				background-color: #f1f1f1;
				margin-left: 5%;
			}
			
			#login .button2 {
				color: black;
				font-weight: 300;
			}
			
			/*회원정보수정 회원탈퇴 버튼*/
			#login .button101{
				cursor: pointer;
				border: 0;
				outline: none;
				font-size: 18px;
				color: white;
				width: 49.5%;
				height: 100%;
				background-color: #6667ab;
				display: inline-block;
				float: left;
			}
			
			#login .button102{
				cursor: pointer;
				border: 0;
				outline: none;
				font-size: 18px;
				color: white;
				width: 49.5%;
				height: 100%;
				background-color: #6667ab;
				display: inline-block;
				float: right;
			}
			
			#login .button101:hover{
				background-color: #2E2F95;
			}
			#login .button102:hover{
				background-color: #2E2F95;
			}
			
			/*아이디 중복 확인 버튼 추가*/
			 #table3 td .b{
				width: 50% !important;
			}
			
			#table3 td .c{
				width:30% !important;
			}

			#table3 th{
				width: 20% !important;
			}

			#login select{
				width: 100%;
				height: 85%;
			}
			
	</style>
	
	<script>
	$(document).ready(function(){
		$("#question").val(${member.question}).prop("selected", true);
		$('input:radio[name=payment]:input[value="${member.payment}"]').prop("checked", true);
	});
	
	function UpdateMemberCheck() {
		
		document.frm.nname.value = document.frm.nname.value.trim();
		
		if (document.frm.nname.value.length == 0) {
			alert("닉네임을 입력하세요.");
			return false;
		}
		
		if(document.frm.nname.value == document.frm.nnamecheck.value){                
			document.frm.NnameDuplication.value = "Nnamecheck";                        
		}
		
		if(document.frm.NnameDuplication.value != "Nnamecheck"){                
			alert("닉네임 중복체크를 해주세요.");                
			return false;            
		}
		if (document.frm.pw.value.length == 0) {
			alert("비밀번호를 입력하세요.");
			return false;
		}
		if (document.frm.pwd.value.length == 0) {
			alert("비밀번호 확인을 입력하세요.");
			return false;
		}
		if(document.frm.pw.value != document.frm.pwd.value ){                
		alert("비밀번호를 동일하게 입력하세요.");                
		return false;            
		}   
		if (document.frm.question.value == 0) {
			alert("질문을 선택하세요.");
			return false;
		}
		if (document.frm.answer.value.length == 0) {
			alert("질문에 대한 답을 입력하세요.");
			return false;
		}
		
		alert("회원정보가 수정되었습니다.");
		return true;
	}
	
	function inputNnameChk(){            
		document.frm.NnameDuplication.value ="NnameUncheck";        
		}
	// 닉네임 중복 체크
	function opeNnameChk() {
		var str = document.frm.nname.value;

		//공백만 입력된 경우
		var blank_pattern = /^\s+|\s+$/g;
		if(str.replace(blank_pattern, '' ) == "" ){
		    alert('공백만 입력되었습니다.');
		    return false;
		}
		//문자열에 공백이 있는 경우
		var blank_pattern = /[\s]/g;
		if( blank_pattern.test(str) == true){
		    alert('공백이 입력되었습니다.');
		    document.frm.nname.value = document.frm.nname.value.trim();
		    return false;
		}
		
		if (document.frm.nname.value == "") {
			alert('닉네임을 입력하여 주십시오.');
			document.form.nname.focus();
			return;
		}
		var url = "nnameCheck.do?nname=" + document.frm.nname.value;
		var _width = "450";
	    var _height = "200";
		var _left = Math.ceil(( window.screen.width - _width )/2);
		var _top = "100";
		window.open(url, "_blank_2",
						"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width="+_width+",height="+_height+",left="+_left+", top="+_top);
	}

	//nickname 중복체크 공백제거
	function blank2(nname){
		opener.frm.nname.value = document.frm.nname.value.trim();
		var str = document.frm.nname.value;
		//문자열에 공백이 있는 경우
		var blank_pattern = /[\s]/g;
		if( blank_pattern.test(str) == true){
		    alert('공백이 입력되었습니다.');
		    opener.frm.nname.value = document.frm.nname.value.trim();
		    opener.frm.nname.value = "";
		    self.close();
		}
	}

	function nnameok(nname) {
		opener.frm.nname.value = document.frm.nname.value;
		opener.frm.reid2.value = document.frm.nname.value;
		opener.frm.NnameDuplication.value = "Nnamecheck";
		self.close();
	}
	
	function open_win(url, name) {
		var _width = "500";
	    var _height = "250";
		var _left = Math.ceil(( window.screen.width - _width )/2);
		var _top = "100";
		window.open(url, name, "width="+_width+ ", height="+_height+",left="+_left+", top="+_top);
	}
	
	</script>
	
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
				<a href="ElibraryServlet?command=main"><img src="image/logo.jpg"></a>
				<div class="logo_content"><b>자유로운 연재 출간 플랫폼</b></div>
				<a href="ElibraryServlet?command=main"><b>쀾쀾</b></a>

			</div>
		
	</div>

	<div id="login">
		
				<h3>>마이페이지</h3>
				<form name="frm" method="post" id="mypage1_form" action= "MemberServlet">
					<input type="hidden" name="command" value="mypage1_update_member">
					<input type="hidden" name="userid" value="${member.userid}">
					<h3>회원정보수정</h3>
					<table id="table3">
						<tr>
							<th class="a">아이디</th>
							<td class="b" style="background-color: lightgray;">&nbsp;<%=(String)session.getAttribute("userid") %></td>
							<td class="c"></td>
						</tr>
						<tr>
							<th class="a">닉네임</th>
							<td class="b"><input type="text" name="nname" value="${member.nname}" onkeydown="inputNnameChk()"><br>
											<input type="hidden" name="reid2" size="20"><input type="hidden" name="nnamecheck" value="${member.nname}">
							<td class="C"><input type="button" class="button2" value="중복확인" onclick="opeNnameChk()">
										  <input type="hidden" name="NnameDuplication" value="NnameUncheck"></td>
						</tr>
						<tr>
							<th class="a">비밀번호</th>
							<td class="b"><input type="password" name="pw"><br>
							<td class="c"  rowspan="6">
						</tr>
						<tr>
							<th class="a">비밀번호 확인</th>
							<td class="b"><input type="password" name="pwd"><br>
						</tr>
						
						<tr>
							<th class="a">본인확인 질문</th>
							<td class="b">	
								<select id="question" name='question'>
							  		<option value='00'>-- 선택 --</option>
							  		<option value='1'>가장 기억의 남는 소설 제목은?</option>
									<option value='2'>본인이 나온 초등학교는?</option>
									<option value='3'>어렸을적 키웠었던 애완동물 이름은?</option>
									<option value='4'>아버지 성함은?</option>
									<option value='5'>내 보물 1호는?</option>
								</select>
						</tr>
						
						<tr>
							<th class="a">답</th>
							<td class="b"><input type="text" name="answer" value="${member.answer}"><br>
						</tr>
						
						<tr>
							<th class="a">결제 정보</th>
							<td class="b">
								<input type="radio" id="contactChoice1" name="payment" value="0"> <label for="contactChoice1">Free</label>
								<input type="radio" id="contactChoice2" name="payment" value="1"> <label for="contactChoice2">Basic</label>
								<input type="radio" id="contactChoice3" name="payment" value="2"> <label for="contactChoice3">Premium</label>
							
						</tr>
						
						<tr>
							<th class="a"></th>
							<td class="b"><button class="button101" type="submit" onclick="return UpdateMemberCheck()"><span>수정</span></button>
							<button type="button" class="button102" onclick="open_win('MemberServlet?command=member_check_pass_form&userid=${member.userid}', 'delete')"><span>회원탈퇴</span></button>
						</tr>
	
					</table>
				</form>

	</div>

	</body>
	<%@ include file="footer.jsp"%>
	</html>