--학생 테이블 생성
     CREATE TABLE STUDENT
   ("STD_NO" CHAR(5 BYTE) NOT NULL ENABLE, 
	"STD_PW" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"STD_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"STD_STDATE" DATE, 
	"STD_CLSCODE" CHAR(1 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "XPK학생" PRIMARY KEY ("STD_NO")
   );

-- 도서 테이블 생성
CREATE TABLE BOOK
   ("BK_NO" CHAR(4 BYTE) NOT NULL ENABLE, 
	"BK_REGDATE" DATE NOT NULL ENABLE, 
	"BK_CTCODE" CHAR(3 BYTE) NOT NULL ENABLE, 
	"BK_SHFCODE" VARCHAR2(3 BYTE) NOT NULL ENABLE, 
	"BK_TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"BK_WRITER" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"BK_PUB" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"BK_LDSNO" CHAR(5 BYTE), 
	"BK_RSVSNO" CHAR(5 BYTE), 
	"BK_LDCNT" NUMBER(5,0) NOT NULL ENABLE, 
	"BK_RCNT" NUMBER(5,0) NOT NULL ENABLE, 
	 CONSTRAINT "XPK도서" PRIMARY KEY ("BK_NO")
     );

--대출 테이블 생성 ( 조건 : 학생,도서 테이블 선 생성)
CREATE TABLE LEND
   ("BK_NO" CHAR(4 BYTE) NOT NULL ENABLE, 
	"STD_NO" CHAR(5 BYTE) NOT NULL ENABLE, 
	"LD_NO" VARCHAR2(9 BYTE) NOT NULL ENABLE, 
	"LD_DATE" DATE NOT NULL ENABLE, 
	"LD_EPDATE" DATE NOT NULL ENABLE, 
	"LD_RETDATE" DATE, 
	"LD_OVERDUE" NUMBER(3,0), 
	 CONSTRAINT "XPK대출" PRIMARY KEY ("LD_NO"),
     CONSTRAINT "R_1" FOREIGN KEY ("BK_NO")
	  REFERENCES BOOK ("BK_NO") ENABLE, 
	 CONSTRAINT "R_3" FOREIGN KEY ("STD_NO")
	  REFERENCES STUDENT ("STD_NO") ENABLE
     );

--신청도서 테이블 생성 
CREATE TABLE REQUEST
   ("REQ_TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"REQ_WRITER" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"REQ_PUB" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"REQ_PRICE" NUMBER(5,0)
   );
   
--학생테이블 튜플 추가
--학생
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10303', 'a1b1c1', '김석호', null , '1');
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10205', 'zzz01', '김태형',null , 1);
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('20121', 'vv55vv', '이은솔', null , '1');
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('20314', '151515', '박민주', null , '1');
 INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('30116', 'mylove!', '손석구', '2023/05/30' , '1');
 --관리자
 INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('00012', 'ma007', '마동석', null , '2');
SELECT * FROM STUDENT;


--책번호 부여를 위한 시퀀스 생성 (000~999) 
CREATE SEQUENCE regbook_seq
  START WITH 0
  INCREMENT BY 1
  MAXVALUE 999
  MINVALUE 0
  CYCLE
  ;
create sequence ascii_seq
start with 97
increment by 1
minvalue 97
maxvalue 122
cycle
;

DROP SEQUENCE regbook_seq;
DROP sequence ascii_seq;

select regbook_seq.nextval from dual;
select ascii_seq.nextval from dual;

DROP procedure reg_book;

--책 등록용 프로시저
create or replace procedure reg_book(
v_ctcode in book.bk_ctcode%type,
v_shfcode in book.bk_shfcode%type,
v_title in book.bk_title%type,
v_writer in book.bk_writer%type,
v_pub in book.bk_pub%type
) is
v_seqnextval integer;
v_asc integer;
begin
select ascii_seq.currval into v_asc from dual;
select regbook_seq.nextval into v_seqnextval from dual;

if v_seqnextval <> 0 then
select ascii_seq.currval into v_asc from dual;
else
select ascii_seq.nextval into v_asc from dual;
end if;
insert into book (bk_no, bk_regdate, bk_ctcode, bk_shfcode, bk_title, bk_writer, bk_pub, bk_ldcnt, bk_rcnt)
values(chr(v_asc)||lpad(v_seqnextval,3,0), to_date(sysdate,'yyyy-mm-dd'), v_ctcode, v_shfcode, v_title, v_writer, v_pub, 0, 0);
commit;
exception
when others then
dbms_output.put_line('오류 :'||sqlerrm);
end;
/
--작동 예문
--exec reg_book('분류코드','책장번호','책제목,'저자', '출판사');

-- ALTER SEQUENCE regbook_seq INCREMENT BY -( );
--다음값으로 증가값만큼 처리
--현재값 확인후
-- ALTER SEQUENCE regbook_seq INCREMENT BY +1; 로 원상복구

-- 책테이블 튜플 추가
-- 석호 : 대출중인 책 3권, (나무,벌거벗은미술관,달러구트꿈백화점)
-- 태형 : 대출중인 책 1권 (달러구트꿈백화점)
-- 은솔 : 대출중 책 x, 예약중 책1권이라고 설정 (나무)
-- 민주 : 대출중 책 1권 (자본주의), 예약중(사이보그가 되다)
-- 손석구 : 대출중 책 1권 연체(자본주의)


--연체된 경우 시연하기 위해, 2023-05-01 등록
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE('2023-05-01','YYYY-MM-DD'), '308','B1','자본주의','홍기빈', '책세상', 30116, NULL, 2, 1,1);  -- 손석구 대출 중 (연체)
-------------
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '308','B1','자본주의','홍기빈', '책세상', 20314, NULL, 2, 0,1); --민주 대출중
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '308','B1','자본주의','홍기빈', '책세상',NULL, NULL, 0, 0,1); 


INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) -- 석호 대출(10303), 은솔(20121) 예약 중
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '800','H1','나무','베르나르 베르베르', '열린책들', 10303, 20121, 3, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '800','H1','나무','베르나르 베르베르', '열린책들', NULL, NULL, 2, 1,1);
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '800','H1','나무','베르나르 베르베르', '열린책들', NULL, NULL, 1, 0,1); 

INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) -- 석호 대출 중
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '813','H2','달러구트 꿈 백화점','이미예', '팩토리나인', 10303, NULL, 4, 1,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) -- 태형대출 중
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '813','H2','달러구트 꿈 백화점','이미예', '팩토리나인', 10205, NULL, 2, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) 
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '813','H2','달러구트 꿈 백화점','이미예', '팩토리나인', NULL, NULL, 1, 0,1); 

INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) --석호 대출 중
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '650','E1','벌거벗은 미술관 : 양정무의 미술 에세이','양정무', '창비', 10303, NULL, 3, 4,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '650','E1','벌거벗은 미술관 : 양정무의 미술 에세이','양정무', '창비', NULL, NULL, 3, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '650','E1','벌거벗은 미술관 : 양정무의 미술 에세이','양정무', '창비', NULL, NULL, 2, 0,1); 


INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '331','B1','사이보그가 되다','김초엽, 김원영', '사계절', NULL, NULL, 0, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '331','B1','사이보그가 되다','김초엽, 김원영', '사계절', NULL, NULL, 0, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '331','B1','사이보그가 되다','김초엽, 김원영', '사계절', NULL, 20314, 0, 0,1); 

SELECT * FROM BOOK;
------------------------------------------------------------------------------------
-- 책 대출 테이블
SELECT * FROM LEND;

--대출 테이블 대출번호 생성용 시퀀스
CREATE SEQUENCE lendno_seq
  START WITH 1
  INCREMENT BY 1
  MINVALUE 1
  ;
  
DROP SEQUENCE lendno_seq;

-- 대출 테이블 튜플 추가


INSERT INTO LEND(BK_NO, STD_NO, LD_NO, LD_DATE, LD_EPDATE, LD_RETDATE, LD_OVERDUE)
    VALUES('a000', '30116', LENDNO_SEQ.NEXTVAL, TO_DATE('2023-05-01','YYYY-MM-DD'), TO_DATE('2023-05-08','YYYY-MM-DD'), NULL, NULL);
INSERT INTO LEND(BK_NO, STD_NO, LD_NO, LD_DATE, LD_EPDATE, LD_RETDATE, LD_OVERDUE)
    VALUES('a001', '20314', LENDNO_SEQ.NEXTVAL, TO_DATE(SYSDATE,'YYYY-MM-DD'), TO_DATE(SYSDATE + 7,'YYYY-MM-DD'), NULL, NULL);
INSERT INTO LEND(BK_NO, STD_NO, LD_NO, LD_DATE, LD_EPDATE, LD_RETDATE, LD_OVERDUE)
    VALUES('a003', '10303', LENDNO_SEQ.NEXTVAL, TO_DATE(SYSDATE,'YYYY-MM-DD'), TO_DATE(SYSDATE + 7,'YYYY-MM-DD'), NULL, NULL);
INSERT INTO LEND(BK_NO, STD_NO, LD_NO, LD_DATE, LD_EPDATE, LD_RETDATE, LD_OVERDUE)
    VALUES('a006', '10303', LENDNO_SEQ.NEXTVAL, TO_DATE(SYSDATE,'YYYY-MM-DD'), TO_DATE(SYSDATE + 7,'YYYY-MM-DD'), NULL, NULL);
INSERT INTO LEND(BK_NO, STD_NO, LD_NO, LD_DATE, LD_EPDATE, LD_RETDATE, LD_OVERDUE)
    VALUES('a007', '10205', LENDNO_SEQ.NEXTVAL, TO_DATE(SYSDATE,'YYYY-MM-DD'), TO_DATE(SYSDATE + 7,'YYYY-MM-DD'), NULL, NULL);
INSERT INTO LEND(BK_NO, STD_NO, LD_NO, LD_DATE, LD_EPDATE, LD_RETDATE, LD_OVERDUE)
    VALUES('a009', '10303', LENDNO_SEQ.NEXTVAL, TO_DATE(SYSDATE,'YYYY-MM-DD'), TO_DATE(SYSDATE + 7,'YYYY-MM-DD'), NULL, NULL);
    
SELECT * FROM LEND;
SELECT * FROM BOOK;

DELETE FROM BOOK; 
DELETE FROM LEND; 



-----------------------