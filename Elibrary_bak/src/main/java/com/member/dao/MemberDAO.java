package com.member.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.member.dto.MemberVO;

import util.DBManager;

public class MemberDAO {
	private MemberDAO() { // 싱글톤 패턴: 객체를 하나 생성한 후 계속 생성하지 않고 처음 생성된 객체를 지속적으로 사용
	}

	private static MemberDAO instance = new MemberDAO();  // static: 객체 생성하지 않아도 바로 접근 가능

	public static MemberDAO getInstance() {  // 생성자를 리턴해주는 메소드
		return instance;
	}

	// 회원 정보 리스트: admin일 때만 보이게 해야함
	public List<MemberVO> selectAllMembers() {
		String sql = "select * from member";
		List<MemberVO> list = new ArrayList<MemberVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			while (rs.next()) {
				MemberVO mVo = new MemberVO();
				mVo.setUserid(rs.getString("userid"));
				mVo.setPw(rs.getString("pw"));
				mVo.setAdmin(rs.getInt("admin"));
				mVo.setNname(rs.getString("nname"));
				mVo.setPayment(rs.getInt("payment"));
				mVo.setQuestion(rs.getInt("question"));
				mVo.setAnswer(rs.getString("answer"));
				list.add(mVo);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}

	// 회원가입
		public void insertMember(MemberVO mVo) {
			String sql = "insert into member("
					+ "userid, pw, nname, question, answer) "
					+ "values(?, ?, ?, ?, ?)";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mVo.getUserid());
				pstmt.setString(2, mVo.getPw());
				pstmt.setString(3, mVo.getNname());
				pstmt.setInt(4, mVo.getQuestion());
				pstmt.setString(5, mVo.getAnswer());
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}

	
	//아이디 중복확인
		public int confirmID(String userid) {
			int result = -1;
			String sql = "select userid from member where userid=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, userid);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = 1;
				} else {
					result = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return result;
		}

		//닉네임 중복확인
		public int confirmNname(String nname) {
			int result = -1;
			String sql = "select userid from member where nname=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nname);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					result = 1;
				} else {
					result = -1;
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				try {
					if (rs != null)
						rs.close();
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			return result;
		}

	// 회원 상세 내용 보기 :아이디로 찾아온다. : 실패 null,
	public MemberVO selectOneMemberByUserid(String userid) {
		String sql = "select * from member where userid = ?";
		MemberVO mVo = null;
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mVo = new MemberVO();
				mVo.setUserid(rs.getString("userid"));
				mVo.setPw(rs.getString("pw"));
				mVo.setAdmin(rs.getInt("admin"));
				mVo.setNname(rs.getString("nname"));
				mVo.setPayment(rs.getInt("payment"));
				mVo.setQuestion(rs.getInt("question"));
				mVo.setAnswer(rs.getString("answer"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt, rs);
		}
		return mVo;
	}
	
	// 회원 아이디 찾기 :닉네임으로 찾아온다. : 실패 null,
		public MemberVO selectOneMemberByNname(String nname) {
			String sql = "select * from member where nname = ?";
			MemberVO mVo = null;
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, nname);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					mVo = new MemberVO();
					mVo.setUserid(rs.getString("userid"));
					mVo.setPw(rs.getString("pw"));
					mVo.setAdmin(rs.getInt("admin"));
					mVo.setNname(rs.getString("nname"));
					mVo.setPayment(rs.getInt("payment"));
					mVo.setQuestion(rs.getInt("question"));
					mVo.setAnswer(rs.getString("answer"));
				}
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt, rs);
			}
			return mVo;
		}

	// 회원 정보 수정: userid로 검색하여 나머지 값 수정
	public void updateMember(MemberVO mVo) {
		String sql2 = "create or replace trigger trigger1"
				+ "after update on member"
				+ "for each row"
				+ "begin"
				+ "  update userbook"
				+ "  set nname=:new.nname"
				+ "  where nname=:old.nname;"
				+ "end;"
				+ "/";
		String sql = "update member set pw=?,"
				+ "nname=?, payment=?, question=?, answer=? where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql2);
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, mVo.getPw());
			pstmt.setString(2, mVo.getNname());
			pstmt.setInt(3, mVo.getPayment());
			pstmt.setInt(4, mVo.getQuestion());
			pstmt.setString(5, mVo.getAnswer());
			pstmt.setString(6, mVo.getUserid());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, pstmt);
		}
	}
	
	//회원 password 수정
		public void updateMemberPassword(MemberVO mVo) {
			String sql = "update member set pw=? where userid=?";
			Connection conn = null;
			PreparedStatement pstmt = null;
			try {
				conn = DBManager.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, mVo.getPw());
				pstmt.setString(2, mVo.getUserid());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				DBManager.close(conn, pstmt);
			}
		}
	
	// 로그인 처리
	public MemberVO checkIdPassWord(String pw, String userid) {
		String sql = "select * from member where pw=? and userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		MemberVO mVo = null;
		System.out.println("here");
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pw);
			pstmt.setString(2, userid);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				mVo = new MemberVO();
				mVo.setUserid(rs.getString("userid"));
				mVo.setPw(rs.getString("pw"));
				mVo.setAdmin(rs.getInt("admin"));
				mVo.setNname(rs.getString("nname"));
				mVo.setPayment(rs.getInt("payment"));
				mVo.setQuestion(rs.getInt("question"));
				mVo.setAnswer(rs.getString("answer"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return mVo;
	}

	// 회원 삭제
	public void deleteMember(String userid) {
		String sql = "delete member where userid=?";
		Connection conn = null;
		PreparedStatement pstmt = null;
		try {
			conn = DBManager.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userid);
			pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
