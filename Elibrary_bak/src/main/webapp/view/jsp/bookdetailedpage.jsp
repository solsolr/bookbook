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
	<link rel="stylesheet" type="text/css" href="css/bookdetailedpage2.css">

	<script src="http://code.jquery.com/jquery.js"></script>
		<script src="http://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
		<script type="text/javascript" src="script/bcommentlist.js"></script>
<style>
	textarea {
	    width: 100%;
	    height: 6.25em;
	    resize: none;
	  }
	/*bcomment-table 크기*/
  .bcomment-table {
    font-size: 15px;
    width: 100%;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
  }
  
  .bcomment-table a {
    color: #333;
    display: inline-block;
    line-height: 1.4;
    word-break: break-all;
    vertical-align: middle;
  }
  .bcomment-table a:hover {
    text-decoration: underline;
  }
  .bcomment-table th {
    text-align: center;
  }
  
  .bcomment-table .th-num {
    width: 100px;
    text-align: center;
  }
  
  .bcomment-table .th-date {
    width: 200px;
  }
  
  .bcomment-table th, .board-bcomment td {
    padding: 14px 0;
  }
  
  .bcomment-table tbody td {
    border-top: 1px solid #e7e7e7;
    text-align: center;
  }
  
  .bcomment-table tbody th {
    padding-left: 28px;
    padding-right: 14px;
    border-top: 1px solid #e7e7e7;
    text-align: left;
  }
  
  .bcomment-table tbody th p{
    display: none;
  }
	  
	  
</style>
<script>
			var message = '${message}';
			if(message) {
				alert('${message}');
			}
</script>
</head>
<body>
	<c:set var="genre" value="${detaile.bgenre}" />
    <div class ="wrap">
        <div class = "box2">
             <div class ="book_forme">
                <img id='book_image' src="${detaile.bimage}" style="width:200px;height:300px;">
                <div class="book_forme2">
                    <p>도서 > ${detaile.bgenre} > ${detaile.btitle}</p> <!-- 도서분류 -->
                    <h1>${detaile.btitle}</h1> <!-- 제목 -->

					<p>작가 : ${detaile.bauthor}</p><!-- 작가 -->
					
                    <p>출판사 : ${detaile.bpublisher}</p><!-- 출판사 -->
                    
                    <p>출판일 : <fmt:formatDate value="${detaile.bdate}" pattern="yyyy-MM-dd"/></p><!-- 출판일 -->
                                        <p>
						별점 : 
						(${detaile.avgcstar})
					</p>
			<%
			if((String)session.getAttribute("userid")!=null) {
				String userid = (String)session.getAttribute("nname");
				String userid2 = (String)session.getAttribute("userid");
			    pageContext.setAttribute("userid2", userid2) ;

			%>
					<form action='BookServlet?command=addmybook&userid=<c:out value="${userid2}" />&num=${detaile.bno }' method="post">
					<p>
					<button>도서 빌리기</button>

					</p>
					</form>
  			<%}else{%>                
  				<a href="MemberServlet?command=sign_up_form"><b>회원가입 후 서비스 이용 가능</b></a>
  			<%} %>

                </div>
            </div>
        </div>
        <div id = 'moretext'>
            <span> >작품소개</span>
        </div>
        <div class = 'book_introduction'>
            <p class="book_detail_content">
			${detaile.bintro}
            </p>
        </div>
        <div id = 'moretext'>
            <span> >출판사 서평 </span>
        </div>
        <div class ='company_review'>
            <p class="book_detail_content">
            ${detaile.breview}
            </p>
        </div>
        <div id = 'moretext'>
            <span> >리뷰 </span>
        </div>
        <div class ='review'>
            <form name="myform" id="myform" method="post" action="BookServlet">
            <input type="hidden" name="command" value="bcomment_insert">
            <input type="hidden" name="userid" value="<%=(String)session.getAttribute("userid") %>">
            <input type="hidden" name="bno" value="${detaile.bno}">
                <fieldset>
                    <legend>별점을 남겨주세요</legend>
                    <input type="radio" name="cstar" value="5" id="rate1"><label for="rate1">⭐</label>
                    <input type="radio" name="cstar" value="4" id="rate2"><label for="rate2">⭐</label>
                    <input type="radio" name="cstar" value="3" id="rate3"><label for="rate3">⭐</label>
                    <input type="radio" name="cstar" value="2" id="rate4"><label for="rate4">⭐</label>
                    <input type="radio" name="cstar" value="1" id="rate5"><label for="rate5">⭐</label>
                </fieldset>
            <%
			if((String)session.getAttribute("userid")!=null) {
				String userid = (String)session.getAttribute("nname");
				String userid2 = (String)session.getAttribute("userid");
		    %>
			<button id="button1" type="submit" onclick="return ReviewCheck()"><span>리뷰 남기기</span></button>
			<% } else { %>
			<button id="button1" onclick='return ReviewNoCheck()'>리뷰 남기기</button>
			<% } %>
			<div id= Contentsform>
			<textarea  name="ccontent" id="reviewContents" placeholder="읽은 책 후기를 남겨주세요~"></textarea>
			</div>
            </form>
    	</div>
    	
    <!-- bcomment list area -->
    <div id="bcomment-list">
        <div class="container">
            <table class="bcomment-table">
                <thead>
                <tr>
                    <th scope="col" class="th-num">번호</th>
                    <th scope="col" class="th-title">사용자</th>
                    <th scope="col" class="th-title">리뷰 내용</th>
                    <th scope="col" class="th-title">별점</th>
                </tr>
                </thead>
                <tbody>
                <c:forEach var="bcomment" items="${bcommentList}">
                <c:set var="i" value="${i+1}"/>
                <tr>
                	<td>${i}</td>
                	<td>${bcomment.userid}</td>
                	<th>${bcomment.ccontent}</th>
                	
	                	<c:choose>
	                		<c:when test="${bcomment.cstar == 1}">        
	                		<td>★</td>
	                		</c:when>
	                		
		                	<c:when test="${bcomment.cstar == 2}">        
	                		<td>★★</td>
	                		</c:when>
	                		
	                		<c:when test="${bcomment.cstar == 3}">        
	                		<td>★★★</td>
	                		</c:when>
	                		
	                		<c:when test="${bcomment.cstar == 4}">        
	                		<td>★★★★</td>
	                		</c:when>
	                		
							<c:otherwise>
							<td>★★★★★</td>
							</c:otherwise>
						</c:choose>
					
                 </tr>
                </c:forEach>
                </tbody>
            </table>
        </div>
    </div>	
    	
    	
    	
     </div>   
    <div class="rank_div">
    	<table class="rank">
    		<tr style="border: 2px solid silver;border-width: 2px 0 2px 0;">
    			<td colspan="2" style="text-align: center;color:#555;"><b>${detaile.bgenre} 랭킹</b></td>
    		</tr>
 	<c:set var="bgenre" value="${detaile.bgenre}" />
  <%
      String bgenre = (String)pageContext.getAttribute("bgenre") ;
 
	  String sql = "SELECT A.BGENRE,A.bno,ROUND(AVG(cstar),2) as avgstar, A.BTITLE,A.bpublisher, A.BIMAGE FROM book A LEFT JOIN bcomment B ON A.bno = B.bno group by A.BGENRE,A.bno, A.btitle , A.bpublisher, A.BIMAGE having a.BGENRE = '"+bgenre+"' order by ROUND(AVG(cstar),2) desc";
	
	  Connection conn = null;
	  Statement stmt = null;
	  ResultSet rs = null;
	
	  try {
	  	conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
	  	stmt = conn.createStatement();
	  	rs = stmt.executeQuery(sql);
	  	int cnt =1;
	  	while (rs.next()) {
	  		
	  		String rank_title = rs.getString("btitle");
 			String rank_bno = rs.getString("bno");
 %>   

    		<tr>
    			<th><%=cnt %></th>
    			<td><a href="BookServlet?command=bookdetailedpage&num=<%=rank_bno%>"><%=rank_title %></a></td>
    		</tr>

 <%			cnt++;	
 	if(cnt==11){
 		break;
 	}
 }

} catch (SQLException e) {
	e.printStackTrace();
} finally {
	DBManager.close(conn, stmt, rs);
}
 %> 
    	</table>
    </div>
    <div class="clear"></div>

</body>
<%@ include file="footer.jsp"%>
</html>