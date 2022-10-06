<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBManager" %>


<%@ include file="header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>Document</title>
	<link rel="stylesheet" type="text/css" href="css/booksearchpage.css">

</head>
<body>

	<div class ="wrap">
		<div class = "serch_box3">
			<div id = 'moretext'>
				<span> >검색 결과</span><button id="morebutton">더보기</button>
			</div>
			<br>
			<h2>도서 검색 결과</h2>
			<div class = 'serch_book_grid_form'>
			
				<c:forEach var="book" items="${searchList }">
				<div class ='serch_book_item'>
					<a href="BookServlet?command=bookdetailedpage&num=${book.bno}" class ='serch_book_item_form' >
						<div calss = 'serch_book_item_image' ><img id='serch_book_image' src="${book.bimage }" width="50%", height="90%"></div>
						<article id='serch_book_txt'>
							<p>${book.btitle }</p>

						</article>
					</a>
				</div>
				</c:forEach>

			</div>
		<br>
		<br>
		<h2>소설 검색 결과</h2>
				<div class = 'serch_book_grid_form'>
<%
String keyword = request.getParameter("keyword");
String sql = "select utitle,nname,uimage from userbook where utitle like '%"+keyword+"%' GROUP BY utitle, uimage,nname";

Connection conn = null;
Statement stmt = null;
ResultSet rs = null;

try {
	conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
	stmt = conn.createStatement();
	rs = stmt.executeQuery(sql);
	while (rs.next()) {

		String novel_image = rs.getString("uimage");
		System.out.print(novel_image);
		String novel_title = rs.getString("utitle");
		String novel_nname = rs.getString("nname");


%>			



				<div class ='serch_book_item'>
					<a href="NovelServlet?command=novel_board&title=<%=novel_title %>" class ='serch_book_item_form' >
						<div calss = 'serch_book_item_image' ><img id='serch_book_image' src="<%=novel_image %>" width="50%", height="90%"></div>
						<article id='serch_book_txt'>
							<p><%=novel_title %></p>

						</article>
					</a>
				</div>


 <%	}

} catch (SQLException e) {
	e.printStackTrace();
} finally {
	DBManager.close(conn, stmt, rs);
}
 %>  
 		</div>
	</div>


</body>
<%@ include file="footer.jsp"%>
</html>