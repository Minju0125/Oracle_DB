DROP TABLE EMP;

CREATE TABLE EMP

(EMPID CHAR(6) NOT NULL,
NAME VARCHAR2(20) NOT NULL,
DEPT VARCHAR2(20) NOT NULL,
HIRE_DATE DATE,
BIRTHDAY VARCHAR2(20),
ADDRESS VARCHAR2(50),
JOB VARCHAR2(20),
SALARY NUMBER(10),
CONSTRAINT PK_EMP PRIMARY KEY(EMPID));

INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1006', '��¼�', '���ߺ�', SYSDATE, '1985.10.12', '���� ���� ���� 345', 'ERP ���α׷�', 350);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1002', '������', '������', SYSDATE, '1985.10.12', '�Ⱦ� �����', 'Ư������', 400);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1003', '�赿��', '�����', SYSDATE, '1985.10.12', '�λ� ���ϵ�', 'ǰ������', 300);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1004', '�����', '�λ��', SYSDATE, '1985.10.12', '�뱸 �޼���', '�޿�����', 450);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1005', '�ڼ���', '���ź�', SYSDATE, '1985.10.12', '���� ������', '��������', 320);
        

SELECT * FROM EMP;

=====================================

CREATE VIEW VIEW_EMP1
AS
SELECT EMPID, NAME, DEPT, HIRE_DATE, SALARY
FROM EMP;

CREATE VIEW VIEW_EMP2
AS
SELECT EMPID, NAME, DEPT, JOB
FROM EMP;

CREATE VIEW VIEW_EMP3
AS
SELECT EMPID, NAME, BIRTHDAY, ADDRESS
FROM EMP;

SELECT * FROM VIEW_EMP1;
SELECT * FROM VIEW_EMP2;
SELECT * FROM VIEW_EMP3;

======================================
<1��> VIEW_EMP1���� ������� 2000�� �����̰� �޿��� 350���� �̻��� ����� ��ȸ�Ͻÿ�.

SELECT EMPID �����ȣ, NAME �����, HIRE_DATE �����, SALARY �޿�
    FROM VIEW_EMP1
    WHERE HIRE_DATE >= '2000.01.01' AND SALARY >=350 ; 
    
-- SELECT EMPID �����ȣ, NAME �����, SUBSTR(HIRE_DATE,1,4) ��뿬�� FROM VIEW_EMP1
-- WHERE SUBSTR(HIRE_DATE,1,4) > '2000' AND SALARY >= 350;

-- SELECT EMPID �����ȣ, NAME �����, SUBSTR(HIRE_DATE,1,4) ��뿬�� FROM VIEW_EMP1
-- WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') > '2000-12-31' AND SALARY >= 350;
                                             
    
<2��> VIEW_EMP2���� ����(job)�� Ư�������� ����� ��ȸ�Ͻÿ�.

SELECT EMPID �����ȣ, NAME �����, JOB ������
    FROM VIEW_EMP2
    WHERE JOB  = 'Ư������' ;
    
<3��> VIEW_EMP3���� ������ 1985�⵵�� ����� ��ȸ�Ͻÿ�. 

SELECT EMPID �����ȣ, NAME �����, BIRTHDAY ����
    FROM VIEW_EMP3
    WHERE SUBSTR(BIRTHDAY,1,4) = '1985';
    
 --------- 10���� ������ ����� ��ȸ�Ͻÿ�. ------------------
 
 SELECT EMPID �����ȣ, NAME �����, BIRTHDAY ����
    FROM VIEW_EMP3
    WHERE SUBSTR(BIRTHDAY,6,2) = '10';
-----------------------------------------------------------    
    
<4��> VIEW_EMP1���� ����ο���, ��ձ޿�, �����޿�, �ְ�޿��� ��ȸ�Ͻÿ�.

SELECT  COUNT(*)����ο���, ROUND(AVG(SALARY),2) ��ձ޿�, MIN(SALARY) �����޿�, MAX(SALARY) �ְ�޿� --ROUND�� �Ҽ��� �ݿø� �Լ��ε� �� ����? // ��ü �� ���� count(*)
    FROM VIEW_EMP1;

-- ROUND �Լ��� Ư�� �Ҽ����� �ݿø��ϰ�, �������� ������ �Լ�. (�ش� ��ġ���� �ݿø�)
-- ROUND (��, �ڸ���)


<5��> VIEW_EMP2���� ����(job)�� ��ǰ���̵� ����� ��� ��ȸ�Ͻÿ�.

SELECT *
    FROM VIEW_EMP2
    WHERE JOB LIKE '%ǰ%'; 
        -- Ư�����ڿ��� ���� ���θ� Ȯ���� �� LIKE �����ڿ� INSTR �Լ� ���
        -- LIKE �����ڴ� ������ (WHERE) ���� Ư�� ���ڿ��� ���Ե� �����͸� ã�� ��
        -- INSTR �Լ��� Ư�� ���ڿ��� ���Ե� ��ġ�� ��ȯ�ϹǷ� Ư�� ���ڿ��� �ڸ��� ��� (�̰� ���� �� �𸣰��� !)

-------- �̸��� �达�� ����� ��ȸ�Ͻÿ�.---------

SELECT *
    FROM VIEW_EMP2
    WHERE NAME LIKE '��%'; 
                    --'%��%' �̶�� �ᵵ ��. 
------------------------------------------------   

<6��> VIEW_EMP3���� 1984~1989�� ���̿� �¾ ������� �ѿ����� ǥ���Ͻÿ�.(1�δ� 100����)

SELECT  COUNT (*) �����, (COUNT(*)*1000000) �ѿ��� -- �ο��� �� ���� COUNT ��
    FROM VIEW_EMP3
    WHERE (SUBSTR(BIRTHDAY,1,4)>='1984' AND SUBSTR(BIRTHDAY,1,4)<='1989');
    -- WHERE (BIRTHDAY>='1984.01.01' AND BIRTHDAY>='1989.12.31');