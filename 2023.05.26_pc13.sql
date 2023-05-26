<53번>
급여가 평균 금여보다 많은 사원들의 사원번호와 이름을 표시하되
결과를 급여에 대해서 오름차순으로 정렬하시오.

SELECT EMPNO 사원번호, ENAME 사원명, SAL 급여
FROM EMP
WHERE SAL > (SELECT AVG(SAL) FROM EMP)
ORDER BY SAL;

<54번>
이름에 "국"이 포함된 사원과 같은 부서에서 일하는 사원의 사원번호와 이름을 표시하시오.

SELECT EMPNO 사원번호, ENAME 사원명
FROM EMP
WHERE DEPTNO =(SELECT DEPTNO FROM EMP WHERE ENAME LIKE '%국%')
ORDER BY ENAME;

SELECT E1.EMPNO 사원번호, E1.ENAME 사원명
FROM EMP E, EMP E1
WHERE E.DEPTNO = E1.DEPTNO AND
E.ENAME LIKE '%국%';

<55번>
부서위치가 서울인 사원의 이름과 부서번호 및 담당업무를 표시하시오.

SELECT E.ENAME 사원명, E.DEPTNO 부서번호, E.JOB 담당업무, D.LOC 부서위치
FROM EMP E, DEPT D
WHERE D.LOC = '서울' AND E.DEPTNO = D.DEPTNO;

SELECT E.ENAME 사원명, E.DEPTNO 부서번호, E.JOB 담당업무, D.LOC 부서위치
FROM EMP E
JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE D.LOC = '서울';

<56번>
김지완에게 보고하는 사원의 이름과 급여를 표시하시오.

SELECT E.ENAME 사원명, E.SAL 급여
FROM EMP E, EMP E1 
WHERE E1.EMPNO = (SELECT E.EMPNO FROM EMP E WHERE E.MGR = 7782);


SELECT E1.ENAME 사원이름, E1.SAL 급여
FROM EMP E, EMP E1
WHERE E.EMPNO = E1.MGR AND E.ENAME = '김지완';


SELECT * FROM EMP;

<57번>
조사부 부서의 사원에 대한 부서번호, 사원이름 및 담당 업무를 표시하시오.

SELECT DEPTNO 부서번호, ENAME 사원명, JOB 담당업무
FROM EMP
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = '조사부');

<58번> 
평균 월급보다 많은 급여를 받고 이름에 "우"가 들어간 사원과 같은 부서에서 근무하는 사원의
사원번호와 사원이름. 급여를 표시하시오.

SELECT E1.EMPNO, E1.ENAME, E1.SAL
FROM EMP E, EMP E1
WHERE E.DEPTNO = E1.DEPTNO AND (E.SAL> (SELECT AVG(SAL) FROM (EMP)) AND
E.ENAME LIKE '%우%';

<59번> 평균급여가 가장 적은 업무를 찾으시오.
-- ASC 해서 가장 첫번째거 구하면 됨.

SELECT JDD 담당업무, ASD 급여
FROM
(SELECT JOB JDD, AVG(SAL) ASD
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) DESC)
WHERE ROWNUM = 1;


<60번> 
담당업무가 관리자인 사원이 소속된 부서와 동일한 부서의 사원을 표시하시오.

SELECT EMPNO 사원번호, ENAME 사원명, JOB 담당업무
FROM EMP
WHERE DEPTNO = (SELECT DISTINCT DEPTNO FROM EMP WHERE JOB = '관리자');

SELECT CHR(65) "CHR", ASCII('ABC') "ASCII" FROM DUAL; --FROM DUAL 오라클에서 제공하는 기본테이블 
SELECT ASCII( CHR(65) ) RESULT FROM DUAL;
SELECT CHR(75) "CHR", ASCII('K') "ASCII" FROM DUAL;

- 회원테이블의 회원ID Column의 ASCII값을 검색하시오 ?
SELECT ASCII(MEM_ID) 회원ASCII, CHR(ASCII(MEM_ID)) 회원CHR FROM MEMBER;

SELECT  RPAD ('HELLO', 10, '☞') "RPAD",
        LPAD ('BYE', 10, '☜') "LPAD"
FROM DUAL;

-----------------------------------
SET SERVEROUTPUT ON -- 꼭 써야함
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
-- 문자열 위치 찾기
SELECT INSTR ('hello heidi', 'he',1) AS RESULT1,
    INSTR('hello heidi', 'i',10) AS RESULT2 --> 10번째 문자부터 시작해서 찾은 i는 몇번째인가?
    FROM DUAL;

SELECT LENGTH('SQL 프로젝트') "LENGTH", -- 공백포함길이
    LENGTHB('SQL 프로젝트') "LENGTHB" -- 공백포함 바이트 수 
    FROM DUAL;
    
SELECT ABS(-365) FROM DUAL; --절댓값

SELECT SIGN(12), SIGN(0), SIGN(-55) FROM DUAL; -- 양수인 경우 1, 0은 0, 음수면 -1 반환

SELECT POWER(3,2), POWER(2,10)  FROM DUAL; -- 제곱

SELECT  SQRT(2) , SQRT(9) FROM DUAL; -- 제곱근

--------------------------------

SELECT ROUND(3145.123,1 ) 결과 FROM DUAL; --소수점 첫째 자리에서 반올림

SELECT ROUND(345.777, 1) 결과1, TRUNC(345.777, 1) 결과2    FROM DUAL; -- TRUNC는 반올림 안하고, 그 자릿수에서 그냥 끊어버림

SELECT GREATEST('강아지',256,1111) FROM DUAL;
