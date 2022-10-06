package com.elibrary.dao;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;


import com.elibrary.dto.ElibraryVO;


import util.DBManager;

public class ElibraryDAO {
	private ElibraryDAO() {
	}

	private static ElibraryDAO instance = new ElibraryDAO(); //객채 생성

	public static ElibraryDAO getInstance() {
		return instance;
	}

	public List<ElibraryVO> selectAllBooks_main() {//리스트타입 메소드 작성
		String sql = "SELECT A.bno,A.bgenre,ROUND(AVG(cstar),2) as avgstar, A.BTITLE,A.bpublisher, A.BIMAGE "
				+ "FROM book A LEFT JOIN bcomment B ON A.bno = B.bno group by A.bno,A.bgenre,A.btitle , "
				+ "A.bpublisher, A.BIMAGE order by ROUND(AVG(cstar),2) desc"; // 쿼리문
		List<ElibraryVO> list = new ArrayList<ElibraryVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				ElibraryVO eVo = new ElibraryVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				//bVo.setBpublisher(rs.getString("A.bpublisher"));
				eVo.setBimage(rs.getString("bimage"));
				eVo.setCnt(cnt);
				eVo.setBno(rs.getInt("bno"));
				eVo.setBgenre(rs.getString("bgenre"));
				//bVo.setBtitle(rs.getString("btitle"));
				//bVo.setAvgcstar(rs.getDouble("avgstar"));
				//bVo.setBimage(rs.getString("A.BIMAGE"));
				//System.out.println(bVo.getBimage()+"이미지파일");
				list.add(eVo);
				
				if (cnt==5) {
					break;
				}
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	public List<ElibraryVO> selectLatestBooks_main() {//메인페이지 최신순위도서 리스
		String sql = "SELECT A.bno,A.bgenre,ROUND(AVG(cstar),2) as avgstar, A.BTITLE,A.bpublisher, "
				+ "A.BIMAGE, A.BDATE FROM book A LEFT JOIN bcomment B ON A.bno = B.bno group by A.bgenre,A.bno, A.btitle , "
				+ "A.bpublisher, A.BIMAGE,A.BDATE order by A.BDATE desc"; // 쿼리문
		List<ElibraryVO> list = new ArrayList<ElibraryVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				ElibraryVO eVo = new ElibraryVO();
				//bVo.setBtitle(rs.getString("A.btitle"));
				eVo.setBpublisher(rs.getString("bpublisher"));
				eVo.setBimage(rs.getString("bimage"));
				//eVo.setCnt(cnt);
				eVo.setBtitle(rs.getString("btitle"));
				eVo.setAvgcstar(rs.getDouble("avgstar"));
				eVo.setBno(rs.getInt("bno"));
				eVo.setBgenre(rs.getString("bgenre"));
				//bVo.setBimage(rs.getString("A.BIMAGE"));
				//System.out.println(bVo.getBimage()+"이미지파일");
				list.add(eVo);
				
				if (cnt==6) {
					break;
				}
				cnt++;
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
	
	public List<ElibraryVO> selectMainNovel() {//리스트타입 메소드 작성
		String sql = "select utitle,nname,uimage from userbook GROUP BY utitle, uimage,nname"; // 쿼리문
		List<ElibraryVO> list = new ArrayList<ElibraryVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			int cnt =1;
			while (rs.next()) {
				ElibraryVO nVo = new ElibraryVO();
				nVo.setUtitle(rs.getString("utitle"));
				nVo.setNname(rs.getString("nname"));
				nVo.setUimage(rs.getString("uimage"));
				list.add(nVo);
				cnt++;
				if (cnt==7) {
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
	
	public List<ElibraryVO> searchbook(String keyword) {//리스트타입 메소드 작성
		String sql = "select * from book where btitle like '%"+keyword+"%'"; // 쿼리문
		//System.out.println(sql);
		List<ElibraryVO> list = new ArrayList<ElibraryVO>(); //객체 성성
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		try {
			conn = DBManager.getConnection(); //커넥션 얻어옴 DB 매니저로부터
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);

			while (rs.next()) {
				ElibraryVO nVo = new ElibraryVO();
				nVo.setBno(rs.getInt("bno"));
				nVo.setBimage(rs.getString("bimage"));
				nVo.setBtitle(rs.getString("btitle"));
				list.add(nVo);

			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			DBManager.close(conn, stmt, rs);
		}
		return list;
	}
}
