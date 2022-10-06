package com.book.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.book.dto.BookVO;

import util.DBManager;

public class BookDAO {
	private BookDAO() {
	}

	private static BookDAO instance = new BookDAO(); //객채 생성

	public static BookDAO getInstance() {
		return instance;
	}

	public List<BookVO> selectAllBooks() {//리스트타입 메소드 작성
		String sql = "SELECT A.bno, A.bgenre,ROUND(AVG(cstar),2) as avgstar, A.BTITLE,A.bpublisher, A.BIMAGE FROM book A LEFT JOIN bcomment B ON A.bno = B.bno group by A.bno,A.bgenre, A.btitle , A.bpublisher, A.BIMAGE order by ROUND(AVG(cstar),2) desc"; // 쿼리문
		List<BookVO> list = new ArrayList<BookVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				BookVO bVo = new BookVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				//bVo.setBpublisher(rs.getString("A.bpublisher"));
				bVo.setBimage(rs.getString("bimage"));
				bVo.setBtitle(rs.getString("btitle"));
				bVo.setAvgcstar(rs.getDouble("avgstar"));
				bVo.setBno(rs.getInt("bno"));
				bVo.setBgenre("bgenre");
				//bVo.setBimage(rs.getString("A.BIMAGE"));
				//System.out.println(bVo.getBimage()+"이미지파일");
				list.add(bVo);
				cnt++;
				if (cnt==34) {
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	public BookVO bookdetailedpage(String num) {//book 별 상세 페이지
		String sql = "SELECT A.bno, A.bgenre, A.bdate,A.bauthor , ROUND(AVG(cstar),2) as avgstar, A.BTITLE,A.bpublisher,A.bintro, A.breview,A.BIMAGE FROM book A LEFT JOIN bcomment B ON A.bno = B.bno group by A.bno, A.bgenre, A.bdate, A.btitle ,A.bauthor, A.bpublisher, A.BIMAGE,A.bintro, A.breview having A.bno =?"; // 쿼리문
		BookVO bVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bVo = new BookVO();
				bVo.setBno(rs.getInt("bno"));
				bVo.setBimage(rs.getString("bimage")); //이미지 주소
				bVo.setBauthor(rs.getString("bauthor")); // 작가
				bVo.setBpublisher(rs.getString("bpublisher")); // 출판사
				bVo.setBdate(rs.getTimestamp("bdate")); //도서 출판일 
				bVo.setBtitle(rs.getString("btitle")); //도서 제목
				bVo.setBintro(rs.getString("bintro"));
				bVo.setBreview(rs.getString("breview")); // 서평
				bVo.setAvgcstar(rs.getDouble("avgstar"));//별점
				bVo.setBgenre(rs.getString("bgenre")); // 장르
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return bVo;
	}
	
	public List<BookVO> selectGenreBooks(String genre) {//장르별 리스트타입 메소드 작성
		String sql = "SELECT A.bno, A.BGENRE, ROUND(AVG(cstar),2) as avgstar, A.BTITLE,A.bpublisher, A.BIMAGE FROM book A LEFT JOIN bcomment B ON A.bno = B.bno group by A.bno, A.BGENRE, A.btitle , A.bpublisher, A.BIMAGE having A.BGENRE = '"+genre+"' order by ROUND(AVG(cstar),2) desc"; // 쿼리문
		List<BookVO> list = new ArrayList<BookVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				BookVO bVo = new BookVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				//bVo.setBpublisher(rs.getString("A.bpublisher"));
				bVo.setBimage(rs.getString("bimage"));
				bVo.setBtitle(rs.getString("btitle"));
				bVo.setAvgcstar(rs.getDouble("avgstar"));
				bVo.setBno(rs.getInt("bno"));
				//bVo.setBimage(rs.getString("A.BIMAGE"));
				//System.out.println(bVo.getBimage()+"이미지파일");
				list.add(bVo);
				cnt++;
				if (cnt==30) {
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	public List<BookVO> bookdetailerank(String genre) {//장르별 리스트타입 메소드 작성
		String sql = "SELECT A.bno, A.BGENRE, ROUND(AVG(cstar),2) as avgstar, A.BTITLE,A.bpublisher, A.BIMAGE FROM book A LEFT JOIN bcomment B ON A.bno = B.bno group by A.bno, A.BGENRE, A.btitle , A.bpublisher, A.BIMAGE having A.BGENRE = '"+genre+"' order by ROUND(AVG(cstar),2) desc"; // 쿼리문
		List<BookVO> list = new ArrayList<BookVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				BookVO bVo = new BookVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				//bVo.setBpublisher(rs.getString("A.bpublisher"));
				bVo.setBimage(rs.getString("bimage"));
				bVo.setBtitle(rs.getString("btitle"));
				bVo.setAvgcstar(rs.getDouble("avgstar"));
				bVo.setBno(rs.getInt("bno"));
				//bVo.setBimage(rs.getString("A.BIMAGE"));
				//System.out.println(bVo.getBimage()+"이미지파일");
				list.add(bVo);
				cnt++;
				if (cnt==30) {
					break;
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}

	public List<BookVO> mybooklist(String userid) {//리스트타입 메소드 작성
		String sql = "SELECT * FROM book A INNER JOIN library B ON A.bno = B.bno and userid = '"+userid+"'"; // 쿼리문
		System.out.println(sql);
		List<BookVO> list = new ArrayList<BookVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				BookVO bVo = new BookVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				//bVo.setBpublisher(rs.getString("A.bpublisher"));
				bVo.setBimage(rs.getString("bimage"));
				bVo.setBtitle(rs.getString("btitle"));
				bVo.setBno(rs.getInt("bno"));
				bVo.setBauthor(rs.getString("bauthor"));
				bVo.setBgenre("bgenre");
				bVo.setCnt(cnt);
				//bVo.setBimage(rs.getString("A.BIMAGE"));
				//System.out.println(bVo.getBimage()+"이미지파일");
				list.add(bVo);
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	public void deletemybook(String userid, String bno) {
		String sql = "delete library where userid ='"+userid+"' and bno="+bno+"";
		//System.out.println(sql);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
	}
	public void addmybook(String userid, String bno) {//게시판 추가
		String sql = "INSERT INTO library (userid,bno) VALUES ('"+userid+"',"+bno+")";
		System.out.println(sql);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
	}
	
	public BookVO checkaddmybook(String userid, String bno) {//게시판 추가
		String sql = "select * from library where userid='"+userid+"'and bno="+bno+"";
		System.out.println(sql);
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		BookVO bVo = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			if (rs.next()) {
				bVo = new BookVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				//bVo.setBpublisher(rs.getString("A.bpublisher"));
				bVo.setUserid(rs.getString("userid"));
				bVo.setBno(rs.getInt("bno"));
			}else {
				//System.out.print("조건안걸림3");
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			DBManager.close(conn, stmt, rs);
		}
		return bVo;
	}
	public List<BookVO> myconmmentlist(String userid) {//리스트타입 메소드 작성
		String sql = "		SELECT A.bno,b.cstar,b.userid, A.BTITLE, b.ccontent, b.cno FROM book A LEFT JOIN bcomment b ON A.bno = B.bno where userid='"+userid+"'"; // 쿼리문

		List<BookVO> list = new ArrayList<BookVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt=1;
			while (rs.next()) {
				BookVO bVo = new BookVO();

				bVo.setCnt(cnt);
				bVo.setBtitle(rs.getString("btitle"));
				bVo.setCstar(rs.getInt("CSTAR"));
				bVo.setCcontent(rs.getString("Ccontent"));
				bVo.setCno(rs.getInt("cno"));
				bVo.setBno(rs.getInt("bno"));
				//System.out.print(bVo.getCcontent());
				list.add(bVo);
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	//리뷰 등록
		public void insertBcomment(BookVO bVo) {
			String sql = "insert into bcomment("
					+ "cno, bno, userid, cstar, ccontent)"
					+ "values(bcomment_no_seq.nextval, ?, ?, ?, ?)";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bVo.getBno());
				pstmt.setString(2, bVo.getUserid());
				pstmt.setInt(3, bVo.getCstar());
				pstmt.setString(4, bVo.getCcontent());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}

		//특정 책에 대한 리뷰 list
		public List<BookVO> selectAllBcomment(String num) {
			String sql = "select * from bcomment where bno="+num+"";
			List<BookVO> list = new ArrayList<BookVO>();
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				while (rs.next()) {
					BookVO bVo = new BookVO();
					bVo.setCno(rs.getInt("cno"));
					bVo.setBno(rs.getInt("bno"));
					bVo.setUserid(rs.getString("userid"));
					bVo.setCstar(rs.getInt("cstar"));
					bVo.setCcontent(rs.getString("ccontent"));
					list.add(bVo);
				}
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, stmt, rs);
			}
			return list;
		}
		
		//특정 리뷰 select
		public BookVO ReviewSelect(String cno) {
			String sql = "select * from bcomment where cno = ?";
			BookVO bVo = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, cno);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					bVo = new BookVO();
					bVo.setUserid(rs.getString("userid"));
					bVo.setCno(rs.getInt("cno"));
					bVo.setBno(rs.getInt("bno"));
					bVo.setCstar(rs.getInt("cstar"));
					bVo.setCcontent(rs.getString("ccontent"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return bVo;
		}
		
		// 리뷰 수정: cno로 검색하여 나머지 값 수정
		public void updateBcomment(BookVO bVo) {
			String sql = "update bcomment set cstar=?,"
					+ "ccontent=? where cno=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, bVo.getCstar());
				pstmt.setString(2, bVo.getCcontent());
				pstmt.setInt(3, bVo.getCno());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
		public void deletemyconmment(String userid, String bno, String cno) {
			String sql = "delete bcomment where userid ='"+userid+"' and bno="+bno+" and cno="+cno;
			//System.out.println(sql);
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
				stmt = conn.createStatement();
				rs = stmt.executeQuery(sql);
				System.out.println(sql);
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				DBManager.close(conn, stmt, rs);
			}
		}
}

