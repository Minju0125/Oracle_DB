--학생계정
INSERT INTO STUDENT (STD_ID, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10113', 'genius007', '김석호', null , 1);
INSERT INTO STUDENT (STD_ID, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10118', 'fishinglover22', '김태형','2023/05/30' , 1);
INSERT INTO STUDENT (STD_ID, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10229', 'TkfrnrtnS2', '이은솔', null , 1);
INSERT INTO STUDENT (STD_ID, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10315', 'BirdHater15', '박민주', null , 1);
 INSERT INTO STUDENT (STD_ID, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10316', 'HESANGKANG!', '손석구', null , 1);

 --관리자 계정
 INSERT INTO STUDENT (STD_ID, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('00106', 'Mabely66', '마동석', null , 2);

--책번호 부여를 위한 시퀀스 생성 (00000~99999) 
DROP SEQUENCE BKNO;

CREATE SEQUENCE BKNO
INCREMENT BY +1
START WITH 1
MINVALUE 1
MAXVALUE 99999
CYCLE;

--책정보 입력
--서가코드 분류코드  또 하나 뭐더라,, 암튼 세개 잇을 예정.
 
--813.6 이316ㄷ
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('813', LPAD(BKNO.NEXTVAL,5,0) ,'달러구트 꿈 백화점','이미예','팩토리나인','17','10113','10118' );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('813', LPAD(BKNO.NEXTVAL,5,0) ,'달러구트 꿈 백화점','이미예','팩토리나인','17','10113','10118' );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('813', LPAD(BKNO.NEXTVAL,5,0) ,'달러구트 꿈 백화점','이미예','팩토리나인','17','10113','10118' );

--904 최962ㅐo
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('904', LPAD(BKNO.NEXTVAL,5,0) ,'역사의 쓸모 : 자유롭고 떳떳한 삶을 위한 22가지 통찰','최태성','다산북스','5','10113',null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('904', LPAD(BKNO.NEXTVAL,5,0) ,'역사의 쓸모 : 자유롭고 떳떳한 삶을 위한 22가지 통찰','최태성','다산북스','4',null,null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('904', LPAD(BKNO.NEXTVAL,5,0) ,'역사의 쓸모 : 자유롭고 떳떳한 삶을 위한 22가지 통찰','최태성','다산북스','17',null,null);

--813.6 손495ㅇ
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('813', LPAD(BKNO.NEXTVAL,5,0) ,'아몬드','손원평 ','창비','5','10113',null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('813', LPAD(BKNO.NEXTVAL,5,0) ,'아몬드','손원평 ','창비','4',null,null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('813', LPAD(BKNO.NEXTVAL,5,0) ,'아몬드','손원평 ','창비','17',null,null);

--802.56 카122ㄷ
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('802', LPAD(BKNO.NEXTVAL,5,0) ,'데일 카네기 성공대화론','데일 카네기 ','현대지성','5','10113',null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('802', LPAD(BKNO.NEXTVAL,5,0) ,'데일 카네기 성공대화론','데일 카네기 ','현대지성','4',null,null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('802', LPAD(BKNO.NEXTVAL,5,0) ,'데일 카네기 성공대화론','데일 카네기 ','현대지성','17',null,null);

--320.4 고436ㅇ	
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('320', LPAD(BKNO.NEXTVAL,5,0) ,'이 책은 돈 버는 법에 관한 이야기 : 서민갑부 고명환의 생각법,독서법,장사법','고명환 ','라곰','5','10113',null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('320', LPAD(BKNO.NEXTVAL,5,0) ,'이 책은 돈 버는 법에 관한 이야기 : 서민갑부 고명환의 생각법,독서법,장사법','고명환 ','라곰','4',null,null );
INSERT INTO BOOK (BK_GROUPNO, BK_BKNO ,BK_TITLE, BK_WRITER, BK_PUB, BK_LDCOUNT, BK_RSVID, BK_LDID)
VALUES('320', LPAD(BKNO.NEXTVAL,5,0) ,'이 책은 돈 버는 법에 관한 이야기 : 서민갑부 고명환의 생각법,독서법,장사법','고명환 ','라곰','17',null,null);

-- 책 대여 테이블
SELECT * FROM LENDING;

INSERT INTO BOOK (LD_NO,STD_ID, BK_GROUPNO , LD_DATE, LD_EPDATE, LD_RETDATE, LE_OVERDUE)
VALUES(SYSDATE,'10113', 고유번호?, );
// 이게 GOURPNO 가 맞을지??
// 여기서 813은 고유하지 않음

SELECT TO_CHAR(SYSDATE, 'YYMMDD') || LPAD(DATE_SEQ.NEXTVAL,4,0) FROM DUAL;

 --매일 1부터 초기화되는 시퀀스생성
CREATE SEQUENCE DATE_SEQ
INCREMENT BY 1
START WITH 1
MINVALUE 1
MAXVALUE 9999
CYCLE;

-- 매일 초기화되어ex )2300605001 이 되는 시퀀스 생성하기
CREATE OR REPLACE TRIGGER  tg_DAILYRESET
    BEFORE INSERT ON LENDING
    FOR EACH ROW
    BEGIN 
    IF INSERTING THEN
        ALTER SEQUENCE ORDER_SEQ INCREMENT BY 1;
        INSERT INTO BOOK (LD_NO,STD_ID, BK_GROUPNO , LD_DATE, LD_EPDATE, LD_RETDATE, LE_OVERDUE)
        VALUES(:NEW.(TO_CHAR(SYSDATE, 'YYMMDD')||LPAD(DATE_SEQ.NEXTVAL,4,0)),:NEW.STD_ID, :NEW.BK_GROUPNO , :NEW.LD_DATE, :NEW.LD_EPDATE, :NEW.LD_RETDATE, :NEW.LE_OVERDUE)
    END IF;
END DAILYRESET;
/


SELECT TO_CHAR(SYSDATE, 'YYMMDD') FROM DUAL;