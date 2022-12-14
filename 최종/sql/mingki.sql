/*
	sf                  sf   
	romance             로맨스
	horror              호러
	thriller            스릴러
	martial_arts        무협
	fantasy             판타지
	game                게임
	self_development    자기개발
*/

-- 사용자 테이블
drop table member CASCADE CONSTRAINTS;
CREATE TABLE member
(
	userid               VARCHAR2(25) NOT NULL,         -- 사용자 아이디(PK)
	pw                   VARCHAR2(50) NOT NULL ,        -- 사용자 비밀번호
	admin                INTEGER default 0 NOT NULL CHECK(admin in (0, 1)),    -- 권한(user:0, admin:1)
	nname                VARCHAR2(20) unique NOT NULL,  -- 닉네임
	payment              INTEGER default 0 NOT NULL CHECK(payment in (0, 1, 2)),    -- 결제정보(x:0, 3권:1, 5권:2) 
    question             number(3) NOT NULL check(question in (1, 2, 3, 4, 5)),           -- 질문 번호
    answer               VARCHAR2(50) NOT NULL ,         -- 질문의 정답
    primary key(userid)
);
select * from member;

insert into member (userid, pw, admin, nname, question, answer) values('hshshs516', '1234', 1, 'sol', 3, '뉴질랜드');

-- 도서 테이블
drop table book CASCADE CONSTRAINTS;
CREATE TABLE book
(
	bno                  NUMBER(10) NOT NULL ,      -- 도서 번호(PK)
	btitle               VARCHAR2(100) NOT NULL ,   -- 제목
	bcontent             CLOB NOT NULL ,            -- 내용
	bgenre               VARCHAR2(30) NOT NULL ,    -- 장르
	bdate                DATE NOT NULL ,            -- 출판일
	bpublisher           VARCHAR2(50) NOT NULL ,    -- 출판사
    bauthor              VARCHAR2(50) NOT NULL ,    -- 작가
	bintro               VARCHAR2(4000) NOT NULL ,  -- 도서 소개
	breview              VARCHAR2(4000) NOT NULL ,  -- 서평
	bimage               VARCHAR2(60) NOT NULL,     -- 이미지
    primary key(bno)
);
commit;

--clob 4000자 이상 삽입하기
insert into book values (book_no_seq.nextval, '로아', TO_CLOB('2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀머들의 기대를 충족') || TO_CLOB('2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선
과거 국외 아이피들은 스마일게이트에서 차단하였다.  있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문엔진 4가 나온 후 엔진을 변경하기에는 초기 작업물들이 모두 언리얼 엔진 3에 맞춘 작업물이었고,')
 || TO_CLOB('2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선
과거 국외 아이피들은 스마일게이트에서 차단하였다.  있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문엔진 4가 나온 후 엔진을 변경하기에는 초기 작업물들이 모두 언리얼 엔진 3에 맞춘 작업물이었고,')
, 'horror', sysdate, '한빛', '금강선', '언리얼 엔진 3 사용. 개발을 2012년부터 시작했는데 언리얼 엔진 4가 나온 후 엔진을 변경하기에는 초기 작업물들이 모두 언리얼 엔진 3에 맞춘 작업물이었고, 기존 셰이딩 방식(언리얼 엔진 3)과 물리기반 셰이딩 방식(언리얼 엔진 4)의 차이, 키즈멧(언리얼 엔진 3)과 블루프린트(언리얼 엔진 4)의 차이, 그리고 엔진의 모든 구조적 차이 때문에 만들어진 리소스를 수정하려면 작업량이 많을 수밖에 없다. 현재 3D 모델러나 레벨 담당 개발자의 구인 모집 페이지를 봐도 언리얼 엔진 3라고 적혀 있다. 다만 TA나 클라이언트 개발자 구인 페이지에 언리얼 엔진 4 사용자 우대를 보면 NC의 블레이드 소울처럼 언리얼 엔진 4로 업데이트를 진행할 가능성도 충분히 있다.',
'언리얼 엔진 3 사용. 개발을 2012년부터 시작했는데 언리얼 엔진 4가 나온 후 엔진을 변경하기에는 초기 작업물들이 모두 언리얼 엔진 3에 맞춘 작업물이었고, 기존 셰이딩 방식(언리얼 엔진 3)과 물리기반 셰이딩 방식(언리얼 엔진 4)의 차이, 키즈멧(언리얼 엔진 3)과 블루프린트(언리얼 엔진 4)의 차이, 그리고 엔진의 모든 구조적 차이 때문에 만들어진 리소스를 수정하려면 작업량이 많을 수밖에 없다. 현재 3D 모델러나 레벨 담당 개발자의 구인 모집 페이지를 봐도 언리얼 엔진 3라고 적혀 있다. 다만 TA나 클라이언트 개발자 구인 페이지에 언리얼 엔진 4 사용자 우대를 보면 NC의 블레이드 소울처럼 언리얼 엔진 4로 업데이트를 진행할 가능성도 충분히 있다.',
'ekfsle.jpg');

select * from book;


--plsql
declare

? v_clob clob;

begin
  ?v_clob := '과거 국외 아이피들은 스마일게이트에서 차단적인 이용기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해';
? ?update book
? ? ? ? set bcontent = v_clob
? ?where bno=1;
end;
/

-- clob 4000자 이상 update하기
UPDATE book

SET bcontent = TO_CLOB('2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀머들의 기대를 충족') || TO_CLOB('2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선
과거 국외 아이피들은 스마일게이트에서 차단하였다.  있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문엔진 4가 나온 후 엔진을 변경하기에는 초기 작업물들이 모두 언리얼 엔진 3에 맞춘 작업물이었고,')
 || TO_CLOB('2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선
과거 국외 아이피들은 스마일게이트에서 차단하였다.  있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문엔진 4가 나온 후 엔진을 변경하기에는 초기 작업물들이 모두 언리얼 엔진 3에 맞춘 작업물이었고,')
where bno=1;

--
UPDATE book

SET bcontent = 'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr'
where bno=1;

commit;

--
insert into book bcontent values(empty_clob());
update book set bcontent = to_clob('과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이지조차 못 들어가냐며 기대하고 있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선
과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이지조차 못 들어가냐며 기대하고 있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이지조차 못 들어가냐며 기대하고 있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이지조차 못 들어가냐며 기대하고 있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이지조차 못 들어가냐며 기대하고 있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이지조차 못 들어가냐며 기대하고 있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선과거 국외 아이피들은 스마일게이트에서 차단하였다. 그로 인해 for All RPG Fans라는 문구에 안 맞게 홈페이지조차 못 들어가냐며 기대하고 있던 해외 게이머들이 불만을 쏟아내고 있는 상태다. 현재 이게 해외 팬들 한테 밈이 되었는지 공식 유튜브 계정에서 홍보 영상 마지막에 For All RPG Fans 문구가 나오면 해외 팬들이 계속 절규하였다.
2022년 기준 해외 IP를 차단하는 등의 정책을 펴고 있진 않으나 고객센터 문의 결과 정상적인 이용에는 어느 정도 제약이 있을 수 있으며 작업장 등의 문제를 막기 위해 지속적으로 정상적인 플레이를 하고 있는 유저임을 증명해야 하는 불편함이 있다고 답변하였다. 영상 설명 참고 따라서 현재 한국 서버에서 플레이하고 있는 해외 로스트아크 스트리머들은 이러한 불편함을 감수하고 플레이를 하고 있는 것이다. 초반에 이러한 정책을 폈던 것은 서버 대기열 문제로 인한 것으로 추정되는데, 현재는 이 문제가 어느 정도 해결된데다 대다수의 해외 스트리머들이 플레이하는 시간은 한국 시간으로 새벽인 경우가 많기 때문에 정책을 변경한 것으로 보인다.
이후 2021년 6월 11일 스팀 출시 발표를 하며 해외 게이머들의 기대를 충족하였지만, 2021년 게임스컴 이후 출시가 2022년으로 미뤄졌다. 연기 사유는 당시에 밝혀지지 않아서 아마존의 뉴월드 출시로 인해서 미뤄졌다는 추측이 존재했는데, 금강선 디렉터가 2022년 2월 8일에 밝히기를 컨텐츠 현지화(로컬라이징) 작업의 완성을 위해 연기했다고 밝혔다. 그걸 아마존이 공지 안해서 열받았다는 금강선')
where bcontent =1;



DROP SEQUENCE book_no_seq;
CREATE SEQUENCE book_no_seq INCREMENT BY 1 START WITH 1;    -- bno: book 테이블 시퀀스

 
-- 도서 리뷰 테이블
drop table bcomment CASCADE CONSTRAINTS;
CREATE TABLE bcomment
(
	cno                  NUMBER(10) NOT NULL ,      -- 리뷰 테이블(PK)
    bno                  NUMBER(10) NOT NULL ,      -- 도서번호(FK)[book]
    userid               VARCHAR2(25) NOT NULL,     -- 사용자 아이디(FK)[user]
	cstar                NUMBER(3) NOT NULL ,       -- 별점
	ccontent             VARCHAR2(1000) NULL ,      -- 리뷰 내용
    primary key(cno),
    CONSTRAINT bcomment_bno_fk FOREIGN KEY (bno) REFERENCES book(bno) ON DELETE CASCADE,            -- 부모 컬럼이 사라지면 같이 삭제
    CONSTRAINT bcomment_userid_fk FOREIGN KEY (userid) REFERENCES member(userid) ON DELETE CASCADE  -- 부모 컬럼이 사라지면 같이 삭제
);

insert into bcomment(cno, bno, userid, cstar, ccontent) values(bcomment_no_seq.nextval, 109, 'root', 3, '1234');

DROP SEQUENCE bcomment_no_seq;
CREATE SEQUENCE bcomment_no_seq INCREMENT BY 1 START WITH 1;    -- cno: bcomment 테이블 시퀀스

select * from bcomment;
select * from bcomment where userid = 'root';
select * from bcomment where userid = 'root';
delete from bcomment where cno = 1;
commit;

-- 내 서재 테이블
drop table library CASCADE CONSTRAINTS;
CREATE TABLE library
(
	userid               VARCHAR2(25) NOT NULL,     -- 사용자 아이디(PK,FK)[user]
	bno                  NUMBER(10) NOT NULL,       -- 도서번호(PK,FK)[book]
    primary key(userid, bno),
    CONSTRAINT library_userid_fk FOREIGN KEY (userid) REFERENCES member(userid) ON DELETE CASCADE,    -- 부모 컬럼이 사라지면 같이 삭제
    CONSTRAINT library_bno_fk FOREIGN KEY (bno) REFERENCES book(bno) ON DELETE CASCADE              -- 부모 컬럼이 사라지면 같이 삭제
);

 
-- 자유연재 테이블
drop table userbook CASCADE CONSTRAINTS;
CREATE TABLE userbook
(
	uno                  NUMBER(10) NOT NULL ,              -- 자유연재 번호(PK)
	nname                VARCHAR2(25) NOT NULL ,            -- 닉네임(FK)[user]
    utitle               VARCHAR2(100) NOT NULL ,           -- 자유연재 제목
    usubtitle            VARCHAR2(50) NULL ,                -- 자유연재 서브제목
	ucontent             CLOB NOT NULL ,                    -- 자유연재 내용
	udate                DATE NOT NULL ,                    -- 등록일
	uhits                NUMBER(10) default 0 NOT NULL ,    -- 조회수
	urecom               NUMBER(10) default 0 NOT NULL ,    -- 추천수
	uimage               VARCHAR2(50) NOT NULL ,            -- 이미지
	uscale               INTEGER NOT NULL check(uscale in (1, 0)),                 -- 장편/단편(장편:1,단편:0)
    primary key(uno),
    CONSTRAINT userbook_nname_fk FOREIGN KEY (nname) REFERENCES member(nname) ON DELETE CASCADE              -- 부모 컬럼이 사라지면 같이 삭제   -- 부모 컬럼이 사라져도 삭제 x
);

select * from userbook;
select constraint_name, constraint_type from user_constraints where table_name='USERBOOK';
Select * from ALL_TRIGGERS;

insert into userbook values(


DROP SEQUENCE userbook_no_seq;
CREATE SEQUENCE userbook_no_seq INCREMENT BY 1 START WITH 1;    -- uno: userbook 테이블 시퀀스
-- 자유연재 추천 테이블
drop table userrecom CASCADE CONSTRAINTS;
CREATE TABLE userrecom
(
	rno                  NUMBER NOT NULL ,                      -- 추천번호(PK)
	uno                  NUMBER NOT NULL ,                      -- 자유연재 번호(FK)
    userid               VARCHAR2(25) NOT NULL ,                -- 사용자 아이디(FK)
	rrecom               VARCHAR2(3) NOT NULL CHECK(rrecom in ('N', 'Y')),     -- 추천 여부(o:Y, x:N)
    primary key(rno),
    CONSTRAINT userecom_uno_fk FOREIGN KEY (uno) REFERENCES userbook(uno) ON DELETE CASCADE,        -- 부모 컬럼이 사라지면 같이 삭제
    CONSTRAINT userecom_userid_fk FOREIGN KEY (userid) REFERENCES member(userid) ON DELETE CASCADE    -- 부모 컬럼이 사라지면 같이 삭제
);


DROP SEQUENCE userrecom_no_seq;
CREATE SEQUENCE userrecom_no_seq INCREMENT BY 1 START WITH 1;    -- rno: userecom 테이블 시퀀스

select * from bcomment where userid='root';
delete from bcomment where bno=109;
commit;

-- 공지사항 테이블
drop table notice CASCADE CONSTRAINTS;
CREATE TABLE notice
(
	nno                  NUMBER(10) NOT NULL ,      -- 공지사항 번호(PK)
	ntitle               VARCHAR2(50) NOT NULL ,    -- 제목
	ncontent             VARCHAR2(4000) NOT NULL ,  -- 내용
	ndate                DATE NOT NULL ,            -- 날짜
    primary key(nno)
);

 
DROP SEQUENCE notice_no_seq;
CREATE SEQUENCE notice_no_seq INCREMENT BY 1 START WITH 1;    -- nno: notice 테이블 시퀀스

 
desc member;
desc book;
desc bcomment;
desc library;
desc userbook;
desc userrecom;
desc notice;


SELECT A.bno,b.cstar,b.userid, A.BTITLE, b.ccontent, b.cno FROM book A LEFT JOIN bcomment b ON A.bno = B.bno where userid='jisu111';
SELECT * FROM ALL_TRIGGERS;
