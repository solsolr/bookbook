package com.novel.dto;

import java.sql.Timestamp;

public class NovelVO {
	

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
	
	
	//파생 변수
	//총 조회수 
	private String sumuhits;
	private String sumurecom;
	
	
	
	public String getSumuhits() {
		return sumuhits;
	}
	public void setSumuhits(String sumuhits) {
		this.sumuhits = sumuhits;
	}
	public String getSumurecom() {
		return sumurecom;
	}
	public void setSumurecom(String sumurecom) {
		this.sumurecom = sumurecom;
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
