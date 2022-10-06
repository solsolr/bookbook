<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBManager" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="http://code.jquery.com/jquery.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link href="css/header1.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/novelview.css">
<script type="text/javascript" src="script/notice.js"></script>
</head>
<script>
	$(document).ready(function() {
		if($("#userrecom").val()=='Y') {
			$("#like_img").attr("src", "image/like_after.png");
		} else {
			$("#like_img").attr("src", "image/like_before.png");
		}
		
		var likecount;
		
		$('#like').click(function(){
			if($('#userid').val() == "") {
				alert('로그인이 필요합니다.');
				location.replace('MemberServlet?command=login_form');
			} else {
				$.ajax({
		            url:"http://localhost:8082/Elibrary/NovelServlet",
		            type:"POST",
		            data:{"command":"novel_like", "uno":${novel.uno }, "userid":$("#userid").val(),
		            		"userrecom":$("#userrecom").val()} , 
		            success: function(result) {
		                if (result == 'Y') {
		                	$("#like_img").attr("src", "image/like_after.png");
		                    $("#userrecom").val('Y');
		                    likecount = Number($("#likecount").text())+1;
		                    $("#likecount").text(likecount);
		                } else if(result == 'N') {
		                	$("#like_img").attr("src", "image/like_before.png");
		                	$("#userrecom").val('N');
		                	likecount = Number($("#likecount").text())-1;
		                    $("#likecount").text(likecount);
		                } else {
		                	alert("잠시후 다시 시도해주세요.");
		                }
		            },
		            error: function (request, status, error) {
		                console.log("code: " + request.status)
		                console.log("message: " + request.responseText)
		                console.log("error: " + error);
		            }
		        });
			}
		});
	});
		
</script>
<%@ include file="header.jsp"%>
<body>
	
	<div id="novelview" align="center">
		<div class="title">
			<b style="color:navy;">${novel.utitle }</b> - <span style="color:#555;">${novel.usubtitle }</span>
		</div>
		<div class="udate">
			<fmt:formatDate value="${novel.udate }" pattern="yyyy-MM-dd"/>
		</div>
		<div class="clear"></div>
		<div class="allcontent">
			<div class="novelimage">
				<img src="${novel.uimage }">
			</div>
			<div class="ucontent">
				${novel.ucontent }
			</div>
		</div>
		<c:set var="utitle" value="${novel.utitle}" />
		<div class = "novel_like">
            조회수&nbsp;&nbsp;${novel.uhits }&nbsp;&nbsp;&nbsp;
			추천수&nbsp;&nbsp;<span id="likecount">${novel.urecom }</span>&nbsp;&nbsp;&nbsp;              
			<% String userid = session.getAttribute("userid") != null?(String)session.getAttribute("userid"):""; %>
			<input type="hidden" id="userid" value="<%=userid %>">   
			<input type="hidden" id="userrecom" value="${userrecom }">  
			<button id="like" style="background-color:#FFF;width:70px;height:70px;">
				<img src="" id="like_img" style="width:65px;height:65px;">
			</button><br><br>
			<button onclick="location.href='NovelServlet?command=novel_board&title=${novel.utitle}'">목록</button>     
	       </div>
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>