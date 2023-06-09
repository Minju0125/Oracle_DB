--�л� ���̺� ����
     CREATE TABLE STUDENT
   ("STD_NO" CHAR(5 BYTE) NOT NULL ENABLE, 
	"STD_PW" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"STD_NAME" VARCHAR2(20 BYTE) NOT NULL ENABLE, 
	"STD_STDATE" DATE, 
	"STD_CLSCODE" CHAR(1 BYTE) NOT NULL ENABLE, 
	 CONSTRAINT "XPK�л�" PRIMARY KEY ("STD_NO")
   );

-- ���� ���̺� ����
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
	 CONSTRAINT "XPK����" PRIMARY KEY ("BK_NO")
     );

--���� ���̺� ���� ( ���� : �л�,���� ���̺� �� ����)
CREATE TABLE LEND
   ("BK_NO" CHAR(4 BYTE) NOT NULL ENABLE, 
	"STD_NO" CHAR(5 BYTE) NOT NULL ENABLE, 
	"LD_NO" VARCHAR2(9 BYTE) NOT NULL ENABLE, 
	"LD_DATE" DATE NOT NULL ENABLE, 
	"LD_EPDATE" DATE NOT NULL ENABLE, 
	"LD_RETDATE" DATE, 
	"LD_OVERDUE" NUMBER(3,0), 
	 CONSTRAINT "XPK����" PRIMARY KEY ("LD_NO"),
     CONSTRAINT "R_1" FOREIGN KEY ("BK_NO")
	  REFERENCES BOOK ("BK_NO") ENABLE, 
	 CONSTRAINT "R_3" FOREIGN KEY ("STD_NO")
	  REFERENCES STUDENT ("STD_NO") ENABLE
     );

--��û���� ���̺� ���� 
CREATE TABLE REQUEST
   ("REQ_TITLE" VARCHAR2(100 BYTE) NOT NULL ENABLE, 
	"REQ_WRITER" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"REQ_PUB" VARCHAR2(30 BYTE) NOT NULL ENABLE, 
	"REQ_PRICE" NUMBER(5,0)
   );
   
--�л����̺� Ʃ�� �߰�
--�л�
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10303', 'a1b1c1', '�輮ȣ', null , '1');
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('10205', 'zzz01', '������',null , 1);
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('20121', 'vv55vv', '������', null , '1');
INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('20314', '151515', '�ڹ���', null , '1');
 INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('30116', 'mylove!', '�ռ���', '2023/05/30' , '1');
 --������
 INSERT INTO STUDENT (STD_NO, STD_PW, STD_NAME, STD_STDATE, STD_CLSCODE)
 VALUES('00012', 'ma007', '������', null , '2');
SELECT * FROM STUDENT;


--å��ȣ �ο��� ���� ������ ���� (000~999) 
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

--å ��Ͽ� ���ν���
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
dbms_output.put_line('���� :'||sqlerrm);
end;
/
--�۵� ����
--exec reg_book('�з��ڵ�','å���ȣ','å����,'����', '���ǻ�');

-- ALTER SEQUENCE regbook_seq INCREMENT BY -( );
--���������� ��������ŭ ó��
--���簪 Ȯ����
-- ALTER SEQUENCE regbook_seq INCREMENT BY +1; �� ���󺹱�

-- å���̺� Ʃ�� �߰�
-- ��ȣ : �������� å 3��, (����,���Ź����̼���,�޷���Ʈ�޹�ȭ��)
-- ���� : �������� å 1�� (�޷���Ʈ�޹�ȭ��)
-- ���� : ������ å x, ������ å1���̶�� ���� (����)
-- ���� : ������ å 1�� (�ں�����), ������(���̺��װ� �Ǵ�)
-- �ռ��� : ������ å 1�� ��ü(�ں�����)


--��ü�� ��� �ÿ��ϱ� ����, 2023-05-01 ���
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE('2023-05-01','YYYY-MM-DD'), '308','B1','�ں�����','ȫ���', 'å����', 30116, NULL, 2, 1,1);  -- �ռ��� ���� �� (��ü)
-------------
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '308','B1','�ں�����','ȫ���', 'å����', 20314, NULL, 2, 0,1); --���� ������
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '308','B1','�ں�����','ȫ���', 'å����',NULL, NULL, 0, 0,1); 


INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) -- ��ȣ ����(10303), ����(20121) ���� ��
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '800','H1','����','�������� ��������', '����å��', 10303, 20121, 3, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '800','H1','����','�������� ��������', '����å��', NULL, NULL, 2, 1,1);
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '800','H1','����','�������� ��������', '����å��', NULL, NULL, 1, 0,1); 

INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) -- ��ȣ ���� ��
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '813','H2','�޷���Ʈ �� ��ȭ��','�̹̿�', '���丮����', 10303, NULL, 4, 1,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) -- �������� ��
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '813','H2','�޷���Ʈ �� ��ȭ��','�̹̿�', '���丮����', 10205, NULL, 2, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) 
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '813','H2','�޷���Ʈ �� ��ȭ��','�̹̿�', '���丮����', NULL, NULL, 1, 0,1); 

INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM) --��ȣ ���� ��
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '650','E1','���Ź��� �̼��� : �������� �̼� ������','������', 'â��', 10303, NULL, 3, 4,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '650','E1','���Ź��� �̼��� : �������� �̼� ������','������', 'â��', NULL, NULL, 3, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '650','E1','���Ź��� �̼��� : �������� �̼� ������','������', 'â��', NULL, NULL, 2, 0,1); 


INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '331','B1','���̺��װ� �Ǵ�','���ʿ�, �����', '�����', NULL, NULL, 0, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '331','B1','���̺��װ� �Ǵ�','���ʿ�, �����', '�����', NULL, NULL, 0, 0,1); 
INSERT INTO BOOK(BK_NO, BK_REGDATE, BK_CTCODE, BK_SHFCODE, BK_TITLE, BK_WRITER, BK_PUB, BK_LDSNO, BK_RSVSNO, BK_LDCNT, BK_RCNT,BK_STM)
    VALUES('a'||LPAD(REGBOOK_SEQ.NEXTVAL,3,0), TO_DATE(SYSDATE,'YYYY-MM-DD'), '331','B1','���̺��װ� �Ǵ�','���ʿ�, �����', '�����', NULL, 20314, 0, 0,1); 

SELECT * FROM BOOK;
------------------------------------------------------------------------------------
-- å ���� ���̺�
SELECT * FROM LEND;

--���� ���̺� �����ȣ ������ ������
CREATE SEQUENCE lendno_seq
  START WITH 1
  INCREMENT BY 1
  MINVALUE 1
  ;
  
DROP SEQUENCE lendno_seq;

-- ���� ���̺� Ʃ�� �߰�


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