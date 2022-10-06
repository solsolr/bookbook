package com.book.dto;

import java.sql.Timestamp;

public class BookVO {
	
	//book table 컬럼
	private int bno;
	private String btitle;
	private String bcontent;
	private String bgenre;
	private Timestamp bdate;
	private String bpublisher;
	private String bauthor;
	private String bintro;
	private String breview;
	private String bimage;
	
	//library table 컬럼
	private String userid;
	
	
	//bconmment table 칼럼
	private int cno;
	private int cstar;
	private String ccontent;
	
	//파생 변수
	//별점 평균
	private double avgcstar;

	private int cnt;
	
	
	public int getCno() {
		return cno;
	}
	public void setCno(int cno) {
		this.cno = cno;
	}
	public int getCstar() {
		return cstar;
	}
	public void setCstar(int cstar) {
		this.cstar = cstar;
	}
	public String getCcontent() {
		return ccontent;
	}
	public void setCcontent(String ccontent) {
		this.ccontent = ccontent;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public int getBno() {
		return bno;
	}
	public void setBno(int bno) {
		this.bno = bno;
	}
	public String getBtitle() {
		return btitle;
	}
	public void setBtitle(String btitle) {
		this.btitle = btitle;
	}
	public String getBcontent() {
		return bcontent;
	}
	public void setBcontent(String bcontent) {
		this.bcontent = bcontent;
	}
	public String getBgenre() {
		return bgenre;
	}
	public void setBgenre(String bgenre) {
		this.bgenre = bgenre;
	}
	public Timestamp getBdate() {
		return bdate;
	}
	public void setBdate(Timestamp bdate) {
		this.bdate = bdate;
	}
	public String getBpublisher() {
		return bpublisher;
	}
	public void setBpublisher(String bpublisher) {
		this.bpublisher = bpublisher;
	}
	public String getBauthor() {
		return bauthor;
	}
	public void setBauthor(String bauthor) {
		this.bauthor = bauthor;
	}
	public String getBintro() {
		return bintro;
	}
	public void setBintro(String bintro) {
		this.bintro = bintro;
	}
	public String getBreview() {
		return breview;
	}
	public void setBreview(String breview) {
		this.breview = breview;
	}
	public String getBimage() {
		return bimage;
	}
	public void setBimage(String bimage) {
		this.bimage = bimage;
	}
	public double getAvgcstar() {
		return avgcstar;
	}
	public void setAvgcstar(double avgcstar) {
		this.avgcstar = avgcstar;
	}
	
	
} 
