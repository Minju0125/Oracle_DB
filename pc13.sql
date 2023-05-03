select * from dual; -- SQL �ּ� (--)

CREATE TABLE EMPOLYER
    ( EMPNO CHAR(6) NOT NULL, 
    ENAME VARCHAR2(20) NOT NULL,
    DEPT VARCHAR2(16) NOT NULL,
    TEL VARCHAR2(14),
    SALARY NUMBER(10),
    CONSTRAINT PK_EMPOLUER PRIMARY KEY(EMPNO));
    ALTER TABLE EMPOLYER ADD (ADDRESS VARCHAR(50) NOT NULL);
    ALTER TABLE EMPOLYER MODIFY (DEPT VARCHAR2(20));
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('100', '�����', '������', '010-8422-8117', 300, '���������� ���� �л��31���� 31');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('101', 'ȫ����', '��ȹ��', '010-7562-3217', 350, '���������� ���� ����29���� 50');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('102', '�̸���', '��ȹ��', '010-5562-6677', 500, '���������� �߱� ����30���� 10');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('103', '������', '������', '010-4442-5614', 350, '���������� �߱� ��ȭ��10���� 30');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('109', '�κ�ö', '�ѹ���', '010-2542-8211', 250, '���������� ���� �곻��1205���� 24');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('108', '�ڹ���', '�ѹ���', '010-4032-2635', 250, '���������� �߱� �������1347���� 24');
        
SELECT * FROM EMPOLYER;
                        -- ������ ��ȸ
                        -- * �� ������ ��� ! ���̺� �ִ� ��� �ʵ带 ��ȸ
DROP TABLE EMPOLYER; -- ���̺� ����
                        
 1. �����ȣ�� 109�� ����� ��ȸ�Ͻÿ�.
 SELECT EMPNO,ENAME,TEL,SALARY,ADDRESS 
  FROM EMPOLYER
  WHERE EMPNO = '109';
 
 2. �޿��� 500������ ����� ��ȸ�Ͻÿ�.
 
 SELECT EMPNO, ENAME, TEL, SALARY, ADDRESS
  FROM EMPOLYER
  WHERE SALARY = 500;

 3. ���� ������� ��ȸ�Ͻÿ�.
 SELECT COUNT(*)�����
  FROM EMPOLYER ; 
 
 4. �޿��� 300���� �̻��� ����� ��ȸ�Ͻÿ�.
 SELECT EMPNO, ENAME, TEL, SALARY, ADDRESS
  FROM EMPOLYER 
  WHERE SALARY >=300 ; 
  
 5. (����2��) ��� ��ȣ�� 102�� �̻��̰�, �޿��� 400���� �̻��� ����� ��ȸ�Ͻÿ�.
 SELECT EMPNO, ENAME, TEL, SALARY, ADDRESS
  FROM EMPOLYER
  WHERE EMPNO>=102 AND SALARY >=400 ; 
  -- ���� 2���� ���� AND ���
  
 6. (����) ������̺��� ���� �� �ٽ� �����ϰ� �����͸� �����Ͻÿ�.
  DROP TABLE EMPOLYER;
  
  CREATE TABLE EMPOLYER
    ( EMPNO CHAR(6) NOT NULL, 
    ENAME VARCHAR2(20) NOT NULL,
    DEPT VARCHAR2(20) NOT NULL,
    TEL VARCHAR2(14),
    SALARY NUMBER(10),
    ADDRESS VARCHAR(50) NOT NULL, 
    
    CONSTRAINT PK_EMPOLYER PRIMARY KEY(EMPNO));
      
    
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('100', '�����', '������', '010-8422-8117', 300, '���������� ���� �л��31���� 31');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('101', 'ȫ����', '��ȹ��', '010-7562-3217', 350, '���������� ���� ����29���� 50');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('102', '�̸���', '��ȹ��', '010-5562-6677', 500, '���������� �߱� ����30���� 10');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('103', '������', '������', '010-4442-5614', 350, '���������� �߱� ��ȭ��10���� 30');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('109', '�κ�ö', '�ѹ���', '010-2542-8211', 250, '���������� ���� �곻��1205���� 24');
   
  
 
  
  
        