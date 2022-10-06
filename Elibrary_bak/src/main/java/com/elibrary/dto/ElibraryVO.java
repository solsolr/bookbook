package com.elibrary.dto;

import java.sql.Timestamp;

public class ElibraryVO {
	
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
	//파생 변수
	//별점 평균
	private double avgcstar;
	//카운트
	private int cnt;
	
	private int uno;
	private String nname;
	private String utitle;
	private String usubtitle;
	private String ucontent;
	private Timestamp udate;
	private String uhits;
	private String urecom;
	private String uimage;
	private String uscale;
	
	
	
	
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




	public int getCnt() {
		return cnt;
	}




	public void setCnt(int cnt) {
		this.cnt = cnt;
	}




	public int getUno() {
		return uno;
	}




	public void setUno(int uno) {
		this.uno = uno;
	}




	public String getNname() {
		return nname;
	}




	public void setNname(String nname) {
		this.nname = nname;
	}




	public String getUtitle() {
		return utitle;
	}




	public void setUtitle(String utitle) {
		this.utitle = utitle;
	}




	public String getUsubtitle() {
		return usubtitle;
	}




	public void setUsubtitle(String usubtitle) {
		this.usubtitle = usubtitle;
	}




	public String getUcontent() {
		return ucontent;
	}




	public void setUcontent(String ucontent) {
		this.ucontent = ucontent;
	}




	public Timestamp getUdate() {
		return udate;
	}




	public void setUdate(Timestamp udate) {
		this.udate = udate;
	}




	public String getUhits() {
		return uhits;
	}




	public void setUhits(String uhits) {
		this.uhits = uhits;
	}




	public String getUrecom() {
		return urecom;
	}




	public void setUrecom(String urecom) {
		this.urecom = urecom;
	}




	public String getUimage() {
		return uimage;
	}




	public void setUimage(String uimage) {
		this.uimage = uimage;
	}




	public String getUscale() {
		return uscale;
	}




	public void setUscale(String uscale) {
		this.uscale = uscale;
	}
	
	
} 
