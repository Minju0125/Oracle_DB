<41번> 학사관리시스템에 아래 학점관리 테이블을 생성하시오.

CREATE TABLE hakjum (
    grade       CHAR(2)     NOT NULL,
    min_point   NUMBER(3)   NOT NULL,
    max_point   NUMBER(3)   NOT NULL
);

<42번> 학점관리 테이블에 성적 기준표를 삽입하시오,
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

<43번> (연속)학사관리시스템에서 수강학생들의 성적을 학점으로 나타내시오.
SELECT a.STD_NO 학번, a.STD_NAME 학생명, b.SUB_NAME 과목명, c.CLS_SCORE 점수, d.GRADE 학점
FROM STUDENT a, SUBJECT b, CLASS c, HAKJUM d
WHERE (a.STD_NO = c.STD_NO) and (b.SUB_CD = c.SUB_CD)
        AND c.CLS_SCORE BETWEEN d.MIN_POINT AND d.MAX_POINT
ORDER BY c.CLS_SCORE DESC;

<44번> (연속) 학사관리 시스템에서 과목별 평균성적을 구하시오.
과목코드 평균성적

SELECT C.SUB_CD 과목코드, ROUND(AVG(C.CLS_SCORE),1) 과목평균 
FROM CLASS C, SUBJECT S
GROUP BY C.SUB_CD;

----------------------------------45번 다시

<45번> 사원번호가 7499인 사원보다 급여가 많은 사원을 표시하시오, 사원이름과 담당업무, 급여

SELECT E1.EMPNO 사원번호, E1.ENMAE 사원명, E1.JOB 담당업무, E1.SAL 급여
FROM EMP E, EMP E1
WHERE E.EMPNO = 7499 AND E.SAL <= E1.SAL;  

-----------------------------------------------

<46번> 최소급여를 받는 사원의 이름, 담당업무 및 급여를 표시하시오.
SELECT * FROM EMP;

SELECT EMPNO 사원번호, ENAME 사원명, JOB 담당업무, SAL 급여
FROM EMP
WHERE SAL = (SELECT MIN(SAL)최소급여 FROM EMP);

SELECT EMPNO 사원번호, ENAME 사원명, JOB 담당업무, SAL 급여
FROM EMP
WHERE SAL = (SELECT MAX(SAL)최소급여 FROM EMP); -- 서브쿼리

------------------------------------------------

<47번>
평균급여가 가장 적은 직급의 직급 이름과 직급의 평균을 구하시오.
------1단계-------
SELECT JOB 직급, AVG(SAL) 직급평균
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) ASC; 

SELECT JOB 담당업무, ASD 급여평균
FROM    
(SELECT JOB, AVG(SAL) ASD
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) ASC);
----------------------------
SELECT JOB 담당업무, ASD 급여평균
FROM
(SELECT JOB, ,AVG(SAL) ASD
FROM EMP
GROUP BY JOB
ORDER BY AVG(SAL) ASC
WHERE ROWNUM =1;

----------
SELECT JOB AS 직급, AVG(SAL) AS 직급평균
FROM EMP
GROUP BY JOB
HAVING AVG(SAL) = (
  SELECT MIN(AVG(SAL))
  FROM EMP
  GROUP BY JOB
);

<48번>
각 부서의 최소 급여를 받는 사원의 이름, 급여, 부서번호를 표시하시오.

SELECT DEPTNO 부서번호, SAL 급여, ENAME 사원명
FROM EMP
ORDER BY DEPTNO;

--<방법1>
SELECT DEPTNO 부서번호, SAL 급여, ENAME 사원명
FROM EMP
WHERE (DEPTNO, SAL) IN (SELECT DEPTNO, MIN(SAL) FROM EMP GROUP BY DEPTNO)
ORDER BY DEPTNO ;

--<방법2>
SELECT E.DEPTNO 부서번호, E.SAL 급여, E.ENAME 사원명
FROM EMP E
INNER JOIN ( 
      SELECT DEPTNO, MIN(SAL) AS 여기에저장
        FROM EMP
        GROUP BY DEPTNO
        )E1 ON E.DEPTNO = E1.DEPTNO AND E.SAL = E1.여기에저장;
        
--<방법3>
SELECT E.ENAME 사원명, E.SAL 급여, E.DEPTNO 부서번호
    FROM EMP E,
    (SELECT DEPTNO, MIN(SAL)AS SAL
    FROM EMP
    GROUP BY DEPTNO) E1
WHERE E.SAL = E1.SAL
ORDER BY E1.DEPTNO;
--------------------------------------------------------
<49번>
평균 영업사원 // 급여보다 급여가 적으면서 // 업무가 영업사원이 아닌 사원들을 표시
사원번호, 이름 담당업무, 급여

SELECT EMPNO 사원번호, ENAME 이름, JOB 담당업무, SAL 급여
    FROM EMP
    WHERE SAL 
        (SELECT EMPNO 
            FROM EMP
            WHERE 
            GROUP BY 
    ;
  
SELECT AVG(SAL) 영업사원평균급여
FROM EMP
WHERE JOB = '영업사원';

-------49번 다시 ! -------

<50번> 부하직원이 없는 사원의 이름을 표시하시오,
(사원 번호가 매니저로 저장되어 있진 않은 사람을 조회해야함.)

SELECT EMPNO, ENAME, MGR
FROM EMP
WHERE EMPNO IN 
    (SELECT A.ENAME FROM EMP A, EMP B
        WHERE A.EMPNO = B.MGR);
        
SELECT DISTINCT(ENAME) 사원명
FROM EMP
WHERE ENAME NOT IN (SELECT E.ENAME 사원이름
FROM EMP E, EMP E1
WHRER E.EMPNO = E1.MGR);

<51번> 부하직원이 있는 사원의 이름을 표시하시오.
SELECT DISTINCT(A.ENAME) FROM EMP A, EMP B
    WHERE A.EMPNO = B.MGR;
    
<52번> 김동혁과 동일한 부서에 속한 사원의 부서코드, 이름, 입사일을
표시하는 질의를 작성하시오.
(단 김동혁은 제외,)

SELECT DEPTNO 부서코드, ENAME 이름, HIREDATE 입사일
FROM EMP
WHERE DEPTNO IN (SELECT DEPTNO FROM EMP WHERE ENAME = '김동혁');