<53��>
�޿��� ��� �ݿ����� ���� ������� �����ȣ�� �̸��� ǥ���ϵ�
����� �޿��� ���ؼ� ������������ �����Ͻÿ�.

SELECT EMPNO �����ȣ, ENAME �����, SAL �޿�
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL;

<54��>
�̸��� "��"�� ���Ե� ����� ���� �μ����� ���ϴ� ����� �����ȣ�� �̸��� ǥ���Ͻÿ�.

SELECT EMPNO �����ȣ, ENAME �����
FROM EMP
WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%��%')
ORDER BY ENAME;

SELECT E1.EMPNO �����ȣ, E1.ENAME �����
FROM EMP E, EMP E1
WHERE E.DEPTNO = E1.DEPTNO AND
E.ENAME LIKE '%��%';

<55��>
�μ���ġ�� ������ ����� �̸��� �μ���ȣ �� �������� ǥ���Ͻÿ�.

SELECT E.ENAME �����, E.DEPTNO �μ���ȣ, E.JOB ������, D.LOC �μ���ġ
FROM EMP E, DEPT D
WHERE D.LOC = '����' AND E.DEPTNO = D.DEPTNO;

SELECT E.ENAME �����, E.DEPTNO �μ���ȣ, E.JOB ������, D.LOC �μ���ġ
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = '����';

<56��>
�����Ͽ��� �����ϴ� ����� �̸��� �޿��� ǥ���Ͻÿ�.

SELECT E.ENAME �����, E.SAL �޿�
FROM EMP E, EMP E1 
WHERE E1.EMPNO = (SELECT E.EMPNO FROM EMP E WHERE E.MGR = 7782);


SELECT E1.ENAME ����̸�, E1.SAL �޿�
FROM EMP E, EMP E1
WHERE E.EMPNO = E1.MGR AND E.ENAME = '������';


SELECT * FROM EMP;

<57��>
����� �μ��� ����� ���� �μ���ȣ, ����̸� �� ��� ������ ǥ���Ͻÿ�.

SELECT DEPTNO �μ���ȣ, ENAME �����, JOB ������
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = '�����');

<58��> 
��� ���޺��� ���� �޿��� �ް� �̸��� "��"�� �� ����� ���� �μ����� �ٹ��ϴ� �����
�����ȣ�� ����̸�. �޿��� ǥ���Ͻÿ�.

SELECT E1.EMPNO, E1.ENAME, E1.SAL
FROM EMP E, EMP E1
WHERE E.DEPTNO = E1.DEPTNO AND (E.SAL> (SELECT AVG(SAL) FROM (EMP)) AND
E.ENAME LIKE '%��%';

<59��> ��ձ޿��� ���� ���� ������ ã���ÿ�.
-- ASC �ؼ� ���� ù��°�� ���ϸ� ��.

SELECT JDD ������, ASD �޿�
FROM
(SELECT JOB JDD, AVG(SAL) ASD
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) DESC)
WHERE ROWNUM = 1;


<60��> 
�������� �������� ����� �Ҽӵ� �μ��� ������ �μ��� ����� ǥ���Ͻÿ�.

SELECT EMPNO �����ȣ, ENAME �����, JOB ������
FROM EMP
WHERE DEPTNO = (SELECT DISTINCT DEPTNO FROM EMP WHERE JOB = '������');

SELECT CHR(65) "CHR", ASCII('ABC') "ASCII" FROM DUAL; --FROM DUAL ����Ŭ���� �����ϴ� �⺻���̺� 
SELECT ASCII( CHR(65) ) RESULT FROM DUAL;
SELECT CHR(75) "CHR", ASCII('K') "ASCII" FROM DUAL;

- ȸ�����̺��� ȸ��ID Column�� ASCII���� �˻��Ͻÿ� ?
SELECT ASCII(MEM_ID) ȸ��ASCII, CHR(ASCII(MEM_ID)) ȸ��CHR FROM MEMBER;

SELECT  RPAD ('HELLO', 10, '��') "RPAD",
        LPAD ('BYE', 10, '��') "LPAD"
FROM DUAL;

-----------------------------------
SET SERVEROUTPUT ON -- �� �����
DECLARE 
  V_ID  NUMBER := 1;
  V_ID2 NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
  WHILE V_ID < 20 LOOP
    DBMS_OUTPUT.PUT(RPAD(' ' , v_id2, ' '));
    DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID , '*'));    
    V_ID  := V_ID  + 2;  
    V_ID2 := V_ID2 - 1;  
  END LOOP;  
END;
-----------------------
-- ���ڿ� ��ġ ã��
SELECT INSTR ('hello heidi', 'he',1) AS RESULT1,
    INSTR('hello heidi', 'i',10) AS RESULT2 --> 10��° ���ں��� �����ؼ� ã�� i�� ���°�ΰ�?
    FROM DUAL;

SELECT LENGTH('SQL ������Ʈ') "LENGTH", -- �������Ա���
    LENGTHB('SQL ������Ʈ') "LENGTHB" -- �������� ����Ʈ �� 
    FROM DUAL;
    
SELECT ABS(-365) FROM DUAL; --����

SELECT SIGN(12), SIGN(0), SIGN(-55) FROM DUAL; -- ����� ��� 1, 0�� 0, ������ -1 ��ȯ

SELECT POWER(3,2), POWER(2,10)  FROM DUAL; -- ����

SELECT  SQRT(2) , SQRT(9) FROM DUAL; -- ������

--------------------------------

SELECT ROUND(3145.123,1 ) ��� FROM DUAL; --�Ҽ��� ù° �ڸ����� �ݿø�

SELECT ROUND(345.777, 1) ���1, TRUNC(345.777, 1) ���2    FROM DUAL; -- TRUNC�� �ݿø� ���ϰ�, �� �ڸ������� �׳� �������

SELECT GREATEST('������',256,1111) FROM DUAL;
