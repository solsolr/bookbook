package com.notice.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBManager;

import com.notice.dto.NoticeVO;

public class NoticeDAO {
	private NoticeDAO() { // 싱글톤 패턴: 객체를 하나 생성한 후 계속 생성하지 않고 처음 생성된 객체를 지속적으로 사용
	}

	private static NoticeDAO instance = new NoticeDAO();  // static: 객체 생성하지 않아도 바로 접근 가능

	public static NoticeDAO getInstance() {  // 생성자를 리턴해주는 메소드
		return instance;
	}

	public List<NoticeVO> selectAllNotices() {
		String sql = "select * from notice order by num desc";
		List<NoticeVO> list = new ArrayList<NoticeVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				NoticeVO nVo = new NoticeVO();
				nVo.setNum(rs.getInt("num"));
				nVo.setNname(rs.getString("nname"));
				nVo.setPass(rs.getString("pass"));
				nVo.setTitle(rs.getString("title"));
				nVo.setContent(rs.getString("content"));
				nVo.setReadcount(rs.getInt("readcount"));
				nVo.setWritedate(rs.getTimestamp("writedate"));
				list.add(nVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}

	public void insertNotice(NoticeVO nVo) {
		String sql = "insert into notice("
				+ "num, nname, pass, title, content) "
				+ "values(notice_no_seq.nextval, ?, ?, ?, ?)";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nVo.getNname());
			pstmt.setString(2, nVo.getPass());
			pstmt.setString(3, nVo.getTitle());
			pstmt.setString(4, nVo.getContent());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public void updateReadCount(String num) {
		String sql = "update notice set readcount=readcount+1 where num=?";
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

	// 게시판 글 상세 내용 보기 :글번호로 찾아온다. : 실패 null,
	public NoticeVO selectOneNoticeByNum(String num) {
		String sql = "select * from notice where num = ?";
		NoticeVO nVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				nVo = new NoticeVO();
				nVo.setNum(rs.getInt("num"));
				nVo.setNname(rs.getString("nname"));
				nVo.setPass(rs.getString("pass"));
				nVo.setTitle(rs.getString("title"));
				nVo.setContent(rs.getString("content"));
				nVo.setWritedate(rs.getTimestamp("writedate"));
				nVo.setReadcount(rs.getInt("readcount"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return nVo;
	}

	public void updateNotice(NoticeVO nVo) {
		String sql = "update notice set nname=?,  pass=?, "
				+ "title=?, content=? where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, nVo.getNname());
			pstmt.setString(2, nVo.getPass());
			pstmt.setString(3, nVo.getTitle());
			pstmt.setString(4, nVo.getContent());
			pstmt.setInt(5, nVo.getNum());
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}

	public NoticeVO checkPassWord(String pass, String num) {
		String sql = "select * from notice where pass=? and num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		NoticeVO nVo = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pass);
			pstmt.setString(2, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				nVo = new NoticeVO();
				nVo.setNum(rs.getInt("num"));
				nVo.setNname(rs.getString("nname"));
				nVo.setPass(rs.getString("pass"));
				nVo.setTitle(rs.getString("title"));
				nVo.setContent(rs.getString("content"));
				nVo.setReadcount(rs.getInt("readcount"));
				nVo.setWritedate(rs.getTimestamp("writedate"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return nVo;
	}

	public void deleteNotice(String num) {
		String sql = "delete notice where num=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, num);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
