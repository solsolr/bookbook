<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="updateccontent_form.css">
<script src="http://code.jquery.com/jquery.js"></script>
<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script>
var message = "${message}";
var userid = "${userid}";
if(message=='ok'){    
	window.opener.location.href="MemberServlet?command=mypage2&userid="+userid; //부모창 페이지 이동!!!!!!!!
	alert("리뷰가 수정되었습니다.")
	window.close();
}

function reviewok() {
	var cstar = $("input[name='cstar']:checked").val();	
	if(cstar == null){
		alert('별점을 입력해주세요.');
		return false;
	}
	if (document.myform.ccontent.value.length == 0) {
		alert("리뷰 내용을 남겨주세요.");
		return false;
	}
	return true;
}

</script>
<style>
#myform fieldset{
    display: inline-block; /* 하위 별점 이미지들이 있는 영역만 자리를 차지함.*/
    direction: rtl; /* 이모지 순서 반전 */
    border: 0; /* 필드셋 테두리 제거 */
}
#myform fieldset legend{
    text-align: left;
}
#myform input[type=radio]{
    display: none; /* 라디오박스 감춤 */
}
#myform label{
    font-size: 3em; /* 이모지 크기 */
    color: transparent; /* 기존 이모지 컬러 제거 */
    text-shadow: 0 0 0 #f0f0f0; /* 새 이모지 색상 부여 */
}
#myform label:hover{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 */
}
#myform label:hover ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 호버 뒤에오는 이모지들 */
}
#myform input[type=radio]:checked ~ label{
    text-shadow: 0 0 0 #a00; /* 마우스 클릭 체크 */
}
textarea {
	    width: 430px;
	    height: 100px;
	    resize: none;
	  }
#review{
	margin-left: 20px;
}

h2{
	color: #6667ab;
	text-align: center;
}

:root {
	--button-color: #ffffff;
	--button-bg-color: #6667ab;
	--button-hover-bg-color: #3a3b85;
	}
	
button{
		-webkit-appearance: none;
  		-moz-appearance: none;
  		appearance: none;

		/* 생략 */
		margin: 0;
		padding: 0.5rem 1rem;

		font-family: "Noto Sans KR", sans-serif;
		font-size: 1rem;
		font-weight: 600;
		text-align: center;
		text-decoration: none;

		display: inline-block;
		width: auto;
		height: 100%;

		border: none;
		border-radius: 4px;

		box-shadow: 0 4px 6px -1px rgba(0, 0, 0, 0.1), 0 2px 4px -1px rgba(0, 0, 0, 0.06);

  		cursor: pointer;

  		transition: 0.5s;
		background: var(--button-bg-color);
  		color: var(--button-color);
	}
button:active, button:hover, button:focus {
	background: var(--button-hover-bg-color);
	outline: 0;
}
button:disabled {
opacity: 0.5;
}
</style>
</head>
<body>
	<h2>리뷰 수정</h2>
	<form name="myform" id="myform" method="post" action="BookServlet">
            <input type="hidden" name="command" value="ccontent_update">
            <input type="hidden" name="cno" value="${review.cno}">
            <input type="hidden" name="userid" value="${review.userid}">
		<div id="review">
		<div><b>리뷰 내용</b></span></div><br>
		<textarea  name="ccontent" id="reviewContents" placeholder="읽은 책 후기를 남겨주세요~">${review.ccontent}</textarea>
		</div>
		<br>
		<fieldset>
                    <legend><b>별점을 남겨주세요</b></legend>
                    <input type="radio" name="cstar" value="5" id="rate1"><label for="rate1">⭐</label>
                    <input type="radio" name="cstar" value="4" id="rate2"><label for="rate2">⭐</label>
                    <input type="radio" name="cstar" value="3" id="rate3"><label for="rate3">⭐</label>
                    <input type="radio" name="cstar" value="2" id="rate4"><label for="rate4">⭐</label>
                    <input type="radio" name="cstar" value="1" id="rate5"><label for="rate5">⭐</label>
         </fieldset>
		<button type="submit" onclick="return reviewok()">수정</button>
	</form>
</body>
</html>