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
	<link rel="stylesheet" type="text/css" href="css/novellist.css">

</head>
<body>
<include-html target="header.jsp" completed="headerCompleted"></include-html>	
	<div class ="wrap">
		<div class = "serch_box3">
			<div id = 'moretext'>
				<span> >자유연재</span><button id="morebutton">더보기</button>
			</div>
		
					<div class = 'serch_book_grid_form'>
				<c:forEach var="novel" items="${novelList }">
								<div class ='serch_book_item'>
					<a href="NovelServlet?command=novel_board&title=${novel.utitle}" class ='serch_book_item_form' >
						<div calss = 'serch_book_item_image' ><img id='serch_book_image' src="${novel.uimage }" width="50%", height="90%"></div>
						<article id='serch_book_txt'>
							<p>${novel.utitle}</p>
							<p>${novel.nname }</p>
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