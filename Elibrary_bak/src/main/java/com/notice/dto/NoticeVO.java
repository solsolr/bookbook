package com.notice.dto;

import java.sql.Timestamp;

/*
CREATE TABLE notice
(
num         NUMBER(5) NOT NULL,         -- 공지사항 번호(PK)
pass        VARCHAR2(30) NOT NULL,      -- 비밀번호
nname        VARCHAR2(30) NOT NULL,     -- 글쓴이 닉네임(FK)
title       VARCHAR2(50) NOT NULL,      -- 제목
content     VARCHAR2(4000) NOT NULL,    -- 내용
readcount   NUMBER(4) DEFAULT 0,        -- 조회수
writedate   DATE DEFAULT sysdate,       -- 날짜
primary key(num),
CONSTRAINT notice_nname_fk FOREIGN KEY (nname) REFERENCES member(nname)
);
 */

public class NoticeVO {
	private int num;
	private String pass;
	private String nname;
	private String title;
	private String content;
	private int readcount;
	private Timestamp writedate;
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public Timestamp getWritedate() {
		return writedate;
	}
	public void setWritedate(Timestamp writedate) {
		this.writedate = writedate;
	}
	
}
