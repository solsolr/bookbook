package com.member.dto;

/* 
CREATE TABLE member
(
	userid               VARCHAR2(25) NOT NULL,                              -- 사용자 아이디(PK)
	pw                   VARCHAR2(50) NOT NULL ,                             -- 사용자 비밀번호
	admin                INTEGER default 0 NOT NULL check(admin in(0, 1)),   -- 권한(user:0, admin:1)
	nname                VARCHAR2(20) unique NOT NULL,                       -- 닉네임
	payment              INTEGER default 0 NOT NULL,                         -- 결제정보(x:0, 3권:1, 5권:2) 
    question             NUMBER(3) NOT NULL check(question in (1, 2, 3, 4, 5)),                                 -- 회원 정보 찾을 때 질문
    answer               VARCHAR2(50) NOT NULL,                              -- 회원 정보 찾을 때 확인할 답
    primary key(userid)
);
 */

public class MemberVO {
	private String userid;
	private String pw;
	private int admin;
	private String nname;
	private int payment;
	private int question;
	private String answer;
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public int getAdmin() {
		return admin;
	}
	public void setAdmin(int admin) {
		this.admin = admin;
	}
	public String getNname() {
		return nname;
	}
	public void setNname(String nname) {
		this.nname = nname;
	}
	public int getPayment() {
		return payment;
	}
	public void setPayment(int payment) {
		this.payment = payment;
	}
	public int getQuestion() {
		return question;
	}
	public void setQuestion(int question) {
		this.question = question;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	
	
	
}
