<41��> �л�����ý��ۿ� �Ʒ� �������� ���̺��� �����Ͻÿ�.

CREATE TABLE hakjum (
    grade       CHAR(2)     NOT NULL,
    min_point   NUMBER(3)   NOT NULL,
    max_point   NUMBER(3)   NOT NULL
);

<42��> �������� ���̺� ���� ����ǥ�� �����Ͻÿ�,
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('A+',96,100);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('A0',90,95);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('B+',85,89);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('B0',80,84);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('C+',75,79);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('C0',70,74);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('D+',65,69);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('D0',60,64);
    INSERT INTO HAKJUM(GRADE,MIN_POINT,MAX_POINT)
        VALUES('F',0,59);

<43��> (����)�л�����ý��ۿ��� �����л����� ������ �������� ��Ÿ���ÿ�.
SELECT a.STD_NO �й�, a.STD_NAME �л���, b.SUB_NAME �����, c.CLS_SCORE ����, d.GRADE ����
FROM STUDENT a, SUBJECT b, CLASS c, HAKJUM d
WHERE (a.STD_NO = c.STD_NO) and (b.SUB_CD = c.SUB_CD)
        AND c.CLS_SCORE BETWEEN d.MIN_POINT AND d.MAX_POINT
ORDER BY c.CLS_SCORE DESC;

<44��> (����) �л���� �ý��ۿ��� ���� ��ռ����� ���Ͻÿ�.
�����ڵ� ��ռ���

SELECT C.SUB_CD �����ڵ�, ROUND(AVG(C.CLS_SCORE),1) ������� 
FROM CLASS C, SUBJECT S
GROUP BY C.SUB_CD;

----------------------------------45�� �ٽ�

<45��> �����ȣ�� 7499�� ������� �޿��� ���� ����� ǥ���Ͻÿ�, ����̸��� ������, �޿�

SELECT E1.EMPNO �����ȣ, E1.ENMAE �����, E1.JOB ������, E1.SAL �޿�
FROM EMP E, EMP E1
WHERE E.EMPNO = 7499 AND E.SAL <= E1.SAL;  

-----------------------------------------------

<46��> �ּұ޿��� �޴� ����� �̸�, ������ �� �޿��� ǥ���Ͻÿ�.
SELECT * FROM EMP;

SELECT EMPNO �����ȣ, ENAME �����, JOB ������, SAL �޿�
FROM EMP
WHERE SAL = (SELECT MIN(SAL)�ּұ޿� FROM EMP);

SELECT EMPNO �����ȣ, ENAME �����, JOB ������, SAL �޿�
FROM EMP
WHERE SAL = (SELECT MAX(SAL)�ּұ޿� FROM EMP); -- ��������

------------------------------------------------

<47��>
��ձ޿��� ���� ���� ������ ���� �̸��� ������ ����� ���Ͻÿ�.
------1�ܰ�-------
SELECT JOB ����, AVG(SAL) �������
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) ASC; 

SELECT JOB ������, ASD �޿����
FROM    
(SELECT JOB, AVG(SAL) ASD
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) ASC);
----------------------------
SELECT JOB ������, ASD �޿����
FROM
(SELECT JOB, ,AVG(SAL) ASD
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) ASC
WHERE ROWNUM =1;

----------
SELECT JOB AS ����, AVG(SAL) AS �������
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (
  SELECT MIN(AVG(SAL))
  FROM EMP
  GROUP BY JOB
);

<48��>
�� �μ��� �ּ� �޿��� �޴� ����� �̸�, �޿�, �μ���ȣ�� ǥ���Ͻÿ�.

SELECT DEPTNO �μ���ȣ, SAL �޿�, ENAME �����
FROM EMP
ORDER BY DEPTNO;

--<���1>
SELECT DEPTNO �μ���ȣ, SAL �޿�, ENAME �����
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MIN(SAL) FROM EMP GROUP BY DEPTNO)
ORDER BY DEPTNO ;

--<���2>
SELECT E.DEPTNO �μ���ȣ, E.SAL �޿�, E.ENAME �����
FROM EMP E
INNER JOIN ( 
      SELECT DEPTNO, MIN(SAL) AS ���⿡����
        FROM EMP
        GROUP BY DEPTNO
        )E1 ON E.DEPTNO = E1.DEPTNO AND E.SAL = E1.���⿡����;
        
--<���3>
SELECT E.ENAME �����, E.SAL �޿�, E.DEPTNO �μ���ȣ
    FROM EMP E,
    (SELECT DEPTNO, MIN(SAL)AS SAL
    FROM EMP
    GROUP BY DEPTNO) E1
WHERE E.SAL = E1.SAL
ORDER BY E1.DEPTNO;
--------------------------------------------------------
<49��>
��� ������� // �޿����� �޿��� �����鼭 // ������ ��������� �ƴ� ������� ǥ��
�����ȣ, �̸� ������, �޿�

SELECT EMPNO �����ȣ, ENAME �̸�, JOB ������, SAL �޿�
    FROM EMP
    WHERE SAL 
        (SELECT EMPNO 
            FROM EMP
            WHERE 
            GROUP BY 
    ;
  
SELECT AVG(SAL) ���������ձ޿�
FROM EMP
WHERE JOB = '�������';

-------49�� �ٽ� ! -------

<50��> ���������� ���� ����� �̸��� ǥ���Ͻÿ�,
(��� ��ȣ�� �Ŵ����� ����Ǿ� ���� ���� ����� ��ȸ�ؾ���.)

SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE EMPNO IN 
    (SELECT A.ENAME FROM EMP A, EMP B
        WHERE A.EMPNO = B.MGR);
        
SELECT DISTINCT(ENAME) �����
FROM EMP
WHERE ENAME NOT IN (SELECT E.ENAME ����̸�
FROM EMP E, EMP E1
WHRER E.EMPNO = E1.MGR);

<51��> ���������� �ִ� ����� �̸��� ǥ���Ͻÿ�.
SELECT DISTINCT(A.ENAME) FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;
    
<52��> �赿���� ������ �μ��� ���� ����� �μ��ڵ�, �̸�, �Ի�����
ǥ���ϴ� ���Ǹ� �ۼ��Ͻÿ�.
(�� �赿���� ����,)

SELECT DEPTNO �μ��ڵ�, ENAME �̸�, HIREDATE �Ի���
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = '�赿��');