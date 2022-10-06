<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ page import="java.sql.*" %>
<%@ page import="util.DBManager" %>
<%@ include file="header.jsp"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/novel_board.css" rel="stylesheet">
</head>
<body>
<%
String title = request.getParameter("title");
String sql = "select SUM(uhits)as uhits,SUM(urecom)as urecom, min(udate)as udate from userbook where utitle =?";

Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;

try {
	conn = DBManager.getConnection();
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, title);
	rs = pstmt.executeQuery();
	if (rs.next()) {

		Timestamp min_date = rs.getTimestamp("udate");
		
		String sum_urecom = rs.getString("urecom");
		String sum_uhits = rs.getString("uhits");


%>
    <div class ="wrap">
        <div class = "novel_content_box">
            <div class = "novel_image_form">
                <img id='novel_image'src="${novelbord[0].uimage}" width="100%", height="100%">
            </div>
            <div class="novel_content">
                <ul class='novel_content_text'>
                    <ul class = "novel_title" id="novel_title"><h2>${novelbord[0].utitle}</h2></ul>
                    <ul><br></ul>
                    <ul>작가 : ${novelbord[0].nname}</ul>
                    <ul><br></ul>
                    <ul class="novel_content_date">
                        <li>연재 시작일 :</li><li><fmt:formatDate value="<%=min_date %>" pattern="yyyy-MM-dd"/></li>                       
                        <br>
                    </ul>
                    <ul class="novel_content_cnt">
                        <li>조회수 :</li><li><%=sum_uhits %></li><li>추천수</li><li><%=sum_urecom %></li>                        
                    </ul>
                </ul>
                <br>
                <div class="novel_summary" >
                    남들이 다 탑을 오를 때, 난 탑의 지하로 파내려가기 시작했다.
                    지하 1층으로, 지하 2층으로, 지하 3층으로… 끊임없는 삽질!
                    그리고 난 1000조를 벌었다.
                </div>
            </div>
            <div >
 <%	}
} catch (SQLException e) {
	e.printStackTrace();
} finally {
	DBManager.close(conn, pstmt, rs);
}
 %>              
            
            </div>

        </div>
        <div class = "box3">
        </div>
        <!-- board list area -->
    <div id="board-list">
        <div class="container">
            <table class="board-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">제목</th>
                    <th scope="col" class="th-title">조회</th>
                    <th scope="col" class="th-title">추천</th>
                    <th scope="col" class="th-date">등록일</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="novel" items="${novelbord }"  varStatus="status">
                <tr>
                	<td>${fn:length(novelbord) - status.count + 1 }</td>
                	<th>
                	<a href="NovelServlet?command=novel_View&num=${novel.uno}">${novel.utitle} - ${novel.usubtitle}</a>
                	</th>
                	<td>${novel.uhits}</td>
                	 <td>${novel.urecom}</td>
                	 <td><fmt:formatDate value="${novel.udate}" pattern="yyyy-MM-dd"/></td>
                 </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>


</body>
<%@ include file="footer.jsp"%>
</html>