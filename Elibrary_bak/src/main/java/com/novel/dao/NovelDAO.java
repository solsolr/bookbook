package com.novel.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.notice.dto.NoticeVO;
import com.novel.dto.NovelVO;
import com.userrecom.dto.UserrecomVO;

import util.DBManager;

public class NovelDAO {
	private NovelDAO() {
	}

	private static NovelDAO instance = new NovelDAO(); //객채 생성

	public static NovelDAO getInstance() {
		return instance;
	}

	public List<NovelVO> selectAllNovel() {//리스트타입 메소드 작성
		String sql = "select utitle,nname,uimage from userbook GROUP BY utitle, uimage,nname"; // 쿼리문
		List<NovelVO> list = new ArrayList<NovelVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				NovelVO nVo = new NovelVO();
				nVo.setUtitle(rs.getString("utitle"));
				nVo.setNname(rs.getString("nname"));
				nVo.setUimage(rs.getString("uimage"));
				list.add(nVo);
				cnt++;
				if (cnt==20) {
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
	public List<NovelVO> novelboarddpage(String title) {//장르별 리스트타입 메소드 작성
		String sql = "select * from userbook where utitle='"+title+"' order by uno desc"; // 쿼리문
		//System.out.print(sql);
		List<NovelVO> list = new ArrayList<NovelVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				NovelVO nVo = new NovelVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				//bVo.setBpublisher(rs.getString("A.bpublisher"));
				nVo.setUtitle(rs.getString("utitle"));
				nVo.setUsubtitle(rs.getString("usubtitle"));
				nVo.setUimage(rs.getString("uimage"));
				nVo.setUno(rs.getInt("uno"));
				nVo.setUdate(rs.getTimestamp("udate"));
				nVo.setUrecom(rs.getString("urecom"));
				nVo.setNname(rs.getString("nname"));
				nVo.setUhits(rs.getString("uhits"));
				//bVo.setBimage(rs.getString("A.BIMAGE"));
				//System.out.println(bVo.getBimage()+"이미지파일");
				list.add(nVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	public void updateReadCount(String num) {
		String sql = "update userbook set uhits=uhits+1 where uno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	

	public  NovelVO selectNovelRead(String num) {
		String sql = "select * from userbook where uno='"+num+"'";
		NovelVO nVo = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				nVo = new NovelVO();
				nVo.setUno(rs.getInt("uno"));
				nVo.setNname(rs.getString("nname"));
				nVo.setUtitle(rs.getString("utitle"));
				nVo.setUsubtitle(rs.getString("usubtitle"));
				nVo.setUcontent(rs.getString("ucontent"));
				nVo.setUdate(rs.getTimestamp("udate"));
				nVo.setUhits(rs.getString("uhits"));
				nVo.setUrecom(rs.getString("urecom"));
				nVo.setUimage(rs.getString("uimage"));
				nVo.setUscale(rs.getString("uscale"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return nVo;
	}
	
	public String userrecomCheck(String num, String userid) {
		String sql = "select rrecom from userrecom where uno='"+num+"' and userid='"+userid+"'";
		String userrecom = "";
//		UserrecomVO nVo = null;
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
//				nVo = new UserrecomVO();
//				nVo.setRno(rs.getInt("rno"));
//				nVo.setUno(rs.getInt("uno"));
//				nVo.setUserid(rs.getString("userid"));
//				nVo.setRrecom(rs.getString("rrecom"));
				userrecom = rs.getString("rrecom");
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return userrecom;
	}
	
	public void updateUserRecom(int uno, String userid) {
		String sql = "update userrecom set rrecom='Y' where uno=? and userid=?;";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.setString(2, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void deleteUserRecom(int uno, String userid) {
		String sql = "delete from userrecom where uno=? and userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.setString(2, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void insertUserRecom(UserrecomVO nvo) {
		String sql = "INSERT into userrecom(rno, uno, userid, rrecom)"
				+ "VALUES (userrecom_no_seq.nextval,?,?,'Y')";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, nvo.getUno());
			pstmt.setString(2, nvo.getUserid());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void updateLikeCountPlus(int uno) {
		String sql = "update userbook set urecom=urecom+1 where uno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void updateLikeCountMinus(int uno) {
		String sql = "update userbook set urecom=urecom-1 where uno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public List<NovelVO> mynovellist(String nname) {//리스트타입 메소드 작성
		String sql = "select * from userbook where nname='"+nname+"'"; // 쿼리문
		List<NovelVO> list = new ArrayList<NovelVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				NovelVO nVo = new NovelVO();
				nVo.setUno(rs.getInt("uno"));
				nVo.setUtitle(rs.getString("utitle"));
				nVo.setUsubtitle(rs.getString("usubtitle"));
				nVo.setUhits(rs.getString("uhits"));
				nVo.setUrecom(rs.getString("urecom"));
				nVo.setUdate(rs.getTimestamp("udate"));
				nVo.setUimage(rs.getString("uimage"));
				list.add(nVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	public NovelVO mynovelonelist(String uno) {//리스트타입 메소드 작성
		String sql = "select * from userbook where uno = ?";
		NovelVO nVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, uno);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				nVo = new NovelVO();
				nVo.setUno(rs.getInt("uno"));
				nVo.setNname(rs.getString("nname"));
				nVo.setUtitle(rs.getString("utitle"));
				nVo.setUsubtitle(rs.getString("usubtitle"));
				nVo.setUcontent(rs.getString("ucontent"));
				nVo.setUdate(rs.getTimestamp("udate"));
				nVo.setUimage(rs.getString("uimage"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return nVo;
	}
	
	public void updatemynovel(NovelVO nVo) {
		String sql = "update userbook set usubtitle=?,  ucontent=?, "
				+ "uimage=? where uno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nVo.getUsubtitle());
			pstmt.setString(2, nVo.getUcontent());
			pstmt.setString(3, nVo.getUimage());
			pstmt.setInt(4, nVo.getUno());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	public void deletemynovel(int uno) {
		String sql = "delete from userbook where uno=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, uno);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void novel_insert(NovelVO nVo) {
		String sql = "insert into userbook(uno, nname, utitle, usubtitle, ucontent, udate, uimage, uscale)"
				+ "values(userbook_no_seq.nextval,?,?,?,?,sysdate,?,?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nVo.getNname());
			pstmt.setString(2, nVo.getUtitle());
			pstmt.setString(3, nVo.getUsubtitle());
			pstmt.setString(4, nVo.getUcontent());
			pstmt.setString(5, nVo.getUimage());
			pstmt.setString(6, nVo.getUscale());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

}
