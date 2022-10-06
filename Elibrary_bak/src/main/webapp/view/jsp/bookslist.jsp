<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="css/bookslist.css">

</head>
<body>	
	<div class ="wrap">
		<div class = "serch_box3">
			<div id = 'moretext'>
				<span> >도서 전체</span><button id="morebutton">더보기</button>
			</div>

			
			<div class = 'serch_book_grid_form'>
				<c:forEach var="book" items="${bookList }">
								<div class ='serch_book_item'>
					<a href="BookServlet?command=bookdetailedpage&num=${book.bno}" class ='serch_book_item_form' >
						<div calss = 'serch_book_item_image' ><img id='serch_book_image' src="${book.bimage }" width="50%", height="90%"></div>
						<article id='serch_book_txt'>
							<p>${book.btitle }</p>
							<p>★(${book.avgcstar })</p>
						</article>
					</a>
				</div>
				</c:forEach>
			</div>
		</div>

	</div>

</body>
<%@ include file="footer.jsp"%>
</html>