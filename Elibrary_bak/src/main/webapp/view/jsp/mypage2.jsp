<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
	<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<link href="css/header1.css" rel="stylesheet">
		<link href="css/mypage2.css" rel="stylesheet">
		<link href="css/button2.css" rel="stylesheet">
		<title>쀽쀽</title>
		<script src="http://code.jquery.com/jquery.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript" src="script/member.js"></script>
		<!-- Modal -->
		<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/animate.min.css" />
		<link rel="stylesheet" href="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/css/jquery.modal.css" />
		
		<script src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/jquery.modal.js"></script>
		
		<script src="//cdn.jsdelivr.net/gh/stove99/jquery-modal-sample@v1.4/js/modal.js"></script>
		<script>
			$(document).ready(function(){
	
				const urlParams = new URL(location.href).searchParams;

				const name = urlParams.get('command'); // url 파라미터 값 저장
				
				if (name == "deletemyconmment"){ //댓글 삭제시 조건 
					$('ul.tabs li').removeClass('current'); // mypage2가 리다이렉트 되면서 current 값 삭제
					$('.tab-content').removeClass('current');//
					
					$("#tab-3_head").addClass('current'); // current 재정의 하여 comment tab을 보여줌
					$("#tab-3").addClass('current'); //
					
					
					$('ul.tabs li').click(function(){ // 기존과 동일하게 목록 클릭시 function 실행
						var tab_id = $(this).attr('data-tab');

						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');

						$(this).addClass('current');
						$("#"+tab_id).addClass('current');
					})
					
				}else{
					$('ul.tabs li').click(function(){
						var tab_id = $(this).attr('data-tab');

						$('ul.tabs li').removeClass('current');
						$('.tab-content').removeClass('current');

						$(this).addClass('current');
						$("#"+tab_id).addClass('current');
						console.log(tab_id)
					})
				}
				
				$('#check_del').click(function(event) {
			        event.preventDefault();
			        this.blur();
			
			        $.popup({
			            url: 'view/jsp/check_del.jsp',
			            close: function(result) {
			                console.log(result);
			                if(result=='Y'){
		    		            location.href="NovelServlet?command=novel_writeform";
			                }
			            }
			        });
			    });

			});
			
			function updateCcontent(cno, ccontent) {
				var url = "BookServlet?command=update_ccontent_form&cno="+cno+"&ccontent="+ccontent;
				var _width = "450";
			    var _height = "350";
				var _left = Math.ceil(( window.screen.width - _width )/2);
				var _top = "100";
				var popup = window.open(url, "_blank_3",
						"toolbar=no, menubar=no, scrollbars=yes, resizable=no, width="+_width+",height="+_height+",left="+_left+", top="+_top);
				//alert('리뷰가 수정되었습니다.');				
			}
			
		</script>
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
			    pageContext.setAttribute("userid2", userid) ;
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
				<a href="ElibraryServlet?command=main"><img src="image/logo.jpg"></a>
				<div class="logo_content"><b>자유로운 연재 출간 플랫폼</b></div>
				<a href="ElibraryServlet?command=main"><b>쀾쀾</b></a>

			</div>
		
		</div>
		
		<h3 class="title_1">>마이페이지</h3>
		<div class="title_2">
			<h3>내 서재</h3>
		</div>	
		
		<div class="mypage2">

			<ul class="tabs">
				<li class="tab-link current" data-tab="tab-1">읽고 있는 책</li>
				<li class="tab-link" data-tab="tab-2">내가 쓴 책</li>
				<li class="tab-link" data-tab="tab-3">나의 후기</li>
			</ul>

			<div id="tab-1" class="tab-content current">
				<table>
					<tr>
						<th colspan="2" class="myth1"><input type="checkbox" class="w-btn w-btn-red" name="check_all">전체선택</th>
						<th colspan="2" class="myth2"><input type="button" class="w-btn-outline w-btn-red-outline" name="check_del" value="선택삭제"
						onclick="location.href='BookServlet?command=deletemybook&userid=<c:out value="${userid}" />'">
							<input type="button" class="w-btn-outline w-btn-yellow-outline" name="download" value="다운로드">
						</th>
					</tr>
					
					<c:forEach var="book" items="${mybookList }">
					<tr>
						<td><input type="checkbox" name="check_${book.cnt}" value="${book.btitle }"></td>
						<td class="mytd1"><img src="${book.bimage }"></td>
						<td class="mytd2"><b>${book.btitle }</b><br>${book.bauthor }</td>
						<td class="mytd3"><input type="button" class="w-btn w-btn-gra3 w-btn-gra-anim" name="read" value="삭제"
						onclick="location.href='BookServlet?command=deletemybook&userid=<c:out value="${userid}" />&bno=${book.bno }'"></td>
					</tr>
					</c:forEach>

				</table>
			</div>
			<div id="tab-2" class="tab-content">
				<table>
					<tr>
						<th colspan="3" class="myth1"><input type="checkbox" name="check_all">전체선택</th>
						<th colspan="3" class="myth2"><button id="check_del" type="button" class="w-btn-outline w-btn-blue-outline" name="check_del">글 연재</button>
						</th>
					</tr>
					<c:forEach var="mwlist" items="${mynovellist }">
						<tr>
							<td><input type="checkbox" name="check_1"></td>
							<td class="mytd1"><img src="${mwlist.uimage }"></td>
							<td class="mytd2">
								<b>${mwlist.utitle }</b>&nbsp;-&nbsp;${mwlist.usubtitle }<br>
							</td>
							<td>조회 수&nbsp;${mwlist.uhits }<br>추천 수&nbsp;${mwlist.urecom }</td>
							<td><fmt:formatDate value="${mwlist.udate }" pattern="yyyy-MM-dd"/></td>
							<td class="mytd3"><input type="button" class="w-btn w-btn-gra1 w-btn-gra-anim" name="read" value="수정"
							onclick="location.href='NovelServlet?command=updatemybookform&uno=${mwlist.uno }'">
							<input type="button" class="w-btn w-btn-gra1 w-btn-gra-anim" name="read" value="삭제"
							onclick="location.href='NovelServlet?command=deletemybook&uno=${mwlist.uno }'"></td>
						</tr>
					</c:forEach>
				</table>
			</div>
			<div id="tab-3" class="tab-content">
				<table>
					<tr>
						<th colspan="1" style="width: 5%;" >No</th>
						<th colspan="1" style="width: 5%;">별점</th>
						<th colspan="1" style="width: 15%;">도서</th>
						<th colspan="2" style="width: 75%;">내용</th>
					</tr>
					
					<c:forEach var="mclist" items="${myconmmentlist }">
					<tr>
						<td class="mytd1"><b>${mclist.cnt }</b></td>
						<td class="mytd2"><b>${mclist.cstar }점</b></td>
						<td class="mytd3"><b>${mclist.btitle }</b></td>
						<td class="mytd4"><span id="ccontent">${mclist.ccontent}</span></td>
						<td class="mytd5" style="text-align:right;"><input type="button" class="w-btn w-btn-gra1 w-btn-gra-anim" name="read" id="ReviewBtn" value="수정"
						onclick="updateCcontent(${mclist.cno}, '${mclist.ccontent}');" > <%--delete_check('MemberServlet?command=Mypage2'); --%>
						<input type="button" class="w-btn w-btn-gra1 w-btn-gra-anim" name="read" value="삭제"
						onclick="location.href='BookServlet?command=deletemyconmment&userid=<c:out value="${userid}" />&bno=${mclist.bno }&cno=${mclist.cno }'"></td>
					</tr>
					</c:forEach>

				</table>
			</div>

		</div>

	</body>
	<%@ include file="footer.jsp"%>
	</html>