package com.userrecom.dto;

/*
CREATE TABLE userrecom
(
	rno                  NUMBER NOT NULL ,                      -- 추천번호(PK)
	uno                  NUMBER NOT NULL ,                      -- 자유연재 번호(FK)
    userid               VARCHAR2(25) NOT NULL ,                -- 사용자 아이디(FK)
	rrecom               VARCHAR2(3) default 'N' NOT NULL CHECK(rrecom in ('N', 'Y')),     -- 추천 여부(o:Y, x:N)
    primary key(rno),
    CONSTRAINT userecom_uno_fk FOREIGN KEY (uno) REFERENCES userbook(uno) ON DELETE CASCADE,        -- 부모 컬럼이 사라지면 같이 삭제
    CONSTRAINT userecom_userid_fk FOREIGN KEY (userid) REFERENCES member(userid) ON DELETE CASCADE    -- 부모 컬럼이 사라지면 같이 삭제
);
 */

public class UserrecomVO {
	private int rno;
	private int uno;
	private String userid;
	private String rrecom;
	public int getRno() {
		return rno;
	}
	public void setRno(int rno) {
		this.rno = rno;
	}
	public int getUno() {
		return uno;
	}
	public void setUno(int uno) {
		this.uno = uno;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public String getRrecom() {
		return rrecom;
	}
	public void setRrecom(String rrecom) {
		this.rrecom = rrecom;
	}
	
}
