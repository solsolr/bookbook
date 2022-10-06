<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="header.jsp"%>
<%@ include file="banner.jsp"%>
<!DOCTYPE html>
<html lang="en">
<html>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="css/main2.css">
	
<!-- bxslider -->
	<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Hi+Melody&display=swap" rel="stylesheet">
	<script src="http://code.jquery.com/jquery.js"></script>
	<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>


	<!-- jQuery library (served from Google) -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.css" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/bxslider/4.2.15/jquery.bxslider.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/bxslider.css">

	<script>
		$(document).ready(function(){
			  $('.sec3_list').bxSlider({
			    auto:true, // 자동 실행 여부			
			    pager: false, // 현재 위치 페이징 표시 여부 설정	
			    controls: true, // 이전 다음 버튼 노출 여부
			    autoControls: false,
			    minSlides: 5, // 최소 노출 개수
			    maxSlides: 5, // 최대 노출 개수
			    moveSlides: 1, // 슬라이드 이동시 개수
			    slideWidth: 285, // 슬라이드 너비
			    slideMargin: 20, // 슬라이드간의 간격	
			    autoHover:true, // 마우스 호버시 정지 여부
			    prevText:"",
			    nextText:""
			    
			    /*mode: 'horizontal',// 가로 방향 수평 슬라이드			
				 speed: 500, // 이동 속도를 설정			
				 auto: true// 자동 실행 여부	*/		
			  });
		});
	</script>

	
</head>
<body>
	<div class ="wrap">
		<div class = "box2">
			<h1>쀾쀾 독점 출판</h1>
			<div class = 'book_rank_form'>
			<c:forEach var="book" items="${bookList }">
				<div class = "book_rank_text">${book.cnt }</div>
				<div class = "book_rank_image"><img id='book_rank_image'src="${book.bimage }" width="90%", height="100%"></div>
			</c:forEach>


			</div>	
		</div>

<!-- bxslider -->		

<div id="banner">
		  <div class="banner_inner">
			    <h1>도전! 지은e-book</h1>
			    <div id="banner_list">
					    <ul class="sec3_list">
					    <c:forEach var="Novel" items="${selectMainNovel }">
					    	<li>
					        <span><a href="NovelServlet?command=novel_board&title=${Novel.utitle}"><img src="${Novel.uimage }" alt=""></a></span>
					        <dl>
					          <dt>제목 : ${Novel.utitle }</dt>
					          <dd>작가 : ${Novel.nname }</dd>
					        </dl>
					      </li>
					    </c:forEach>

			    </div>
		  </div>
	</div>
			
	<div class = "box3">
		<h1>최신인기작</h1>
		<div class = 'book_grid_form'>
		<c:forEach var="latestbook" items="${latestbookList }">
			<div class ='book_item'>
				<a href="BookServlet?command=bookdetailedpage&num=${latestbook.bno}" class ='book_item_form'>
					<div><img id='book_item_image'src="${latestbook.bimage }" width="150px", height="220px"></div>
					
					<article id = 'book_title'>
						<span>제목 : ${latestbook.btitle }<br></span>
						<span>작가 : ${latestbook.bpublisher }<br></span>
						<span>별점 : ${latestbook.avgcstar }<br></span>
					</article>
				</a>
			</div>
		</c:forEach>
		</div>
		
		
		<h1>자유연재소설</h1>
		<div class = 'book_grid_form'>
		<c:forEach var="Novel" items="${selectMainNovel }">
			<div class ='book_item'>
				<a href="NovelServlet?command=novel_board&title=${Novel.utitle}" class ='book_item_form'>
					<div><img id='book_item_image'src="${Novel.uimage }" width="150px", height="220px"></div>
					
					<article id = 'book_title'>
						<span>제목 : ${Novel.utitle }<br></span>
						<span>작가 : ${Novel.nname }<br></span>
					</article>
				</a>
			</div>
		</c:forEach>
		</div>
	</div>
		
		
		
		
		
		</div>
		
	</div>
</body>
<%@ include file="footer.jsp"%>
</html>