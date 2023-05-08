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
    VALUES ('1006', '장승수', '개발부', SYSDATE, '1985.10.12', '대전 서구 내동 345', 'ERP 프로그램', 350);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1002', '곽희준', '영업부', SYSDATE, '1985.10.12', '안양 용봉동', '특수영업', 400);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1003', '김동준', '생산부', SYSDATE, '1985.10.12', '부산 대하동', '품질관리', 300);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1004', '성재규', '인사부', SYSDATE, '1985.10.12', '대구 달성동', '급여관리', 450);
INSERT INTO EMP(EMPID, NAME, DEPT, HIRE_DATE, BIRTHDAY, ADDRESS, JOB, SALARY)
    VALUES ('1005', '박성범', '구매부', SYSDATE, '1985.10.12', '대전 오류동', '수입자재', 320);
        

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
<1번> VIEW_EMP1에서 고용일이 2000년 이후이고 급여가 350만원 이상인 사원을 조회하시오.

SELECT EMPID 사원번호, NAME 사원명, HIRE_DATE 고용일, SALARY 급여
    FROM VIEW_EMP1
    WHERE HIRE_DATE >= '2000.01.01' AND SALARY >=350 ; 
    
-- SELECT EMPID 사원번호, NAME 사원명, SUBSTR(HIRE_DATE,1,4) 고용연도 FROM VIEW_EMP1
-- WHERE SUBSTR(HIRE_DATE,1,4) > '2000' AND SALARY >= 350;

-- SELECT EMPID 사원번호, NAME 사원명, SUBSTR(HIRE_DATE,1,4) 고용연도 FROM VIEW_EMP1
-- WHERE TO_CHAR(HIRE_DATE, 'YYYY-MM-DD') > '2000-12-31' AND SALARY >= 350;
                                             
    
<2번> VIEW_EMP2에서 업무(job)가 특수영업인 사원을 조회하시오.

SELECT EMPID 사원번호, NAME 사원명, JOB 담당업무
    FROM VIEW_EMP2
    WHERE JOB  = '특수영업' ;
    
<3번> VIEW_EMP3에서 생일이 1985년도인 사원을 조회하시오. 

SELECT EMPID 사원번호, NAME 사원명, BIRTHDAY 생일
    FROM VIEW_EMP3
    WHERE SUBSTR(BIRTHDAY,1,4) = '1985';
    
 --------- 10월에 생일인 사람을 조회하시오. ------------------
 
 SELECT EMPID 사원번호, NAME 사원명, BIRTHDAY 생일
    FROM VIEW_EMP3
    WHERE SUBSTR(BIRTHDAY,6,2) = '10';
-----------------------------------------------------------    
    
<4번> VIEW_EMP1에서 고용인원수, 평균급여, 최저급여, 최고급여를 조회하시오.

SELECT  COUNT(*)고용인원수, ROUND(AVG(SALARY),2) 평균급여, MIN(SALARY) 최저급여, MAX(SALARY) 최고급여 --ROUND는 소수점 반올림 함수인데 왜 쓰지? // 전체 행 개수 count(*)
    FROM VIEW_EMP1;

-- ROUND 함수는 특정 소수점을 반올림하고, 나머지를 버리는 함수. (해당 위치에서 반올림)
-- ROUND (값, 자리수)


<5번> VIEW_EMP2에서 업무(job)가 ‘품’이들어간 사원을 모두 조회하시오.

SELECT *
    FROM VIEW_EMP2
    WHERE JOB LIKE '%품%'; 
        -- 특정문자열의 포함 여부를 확인할 때 LIKE 연산자와 INSTR 함수 사용
        -- LIKE 연산자는 조건절 (WHERE) 에서 특정 문자열이 포함된 데이터를 찾을 때
        -- INSTR 함수는 특정 문자열이 포함된 위치를 반환하므로 특정 문자열을 자를때 사용 (이건 아직 잘 모르겠음 !)

-------- 이름이 김씨인 사람을 조회하시오.---------

SELECT *
    FROM VIEW_EMP2
    WHERE NAME LIKE '김%'; 
                    --'%김%' 이라고 써도 됨. 
------------------------------------------------   

<6번> VIEW_EMP3에서 1984~1989년 사이에 태어난 사원수와 총예산을 표시하시오.(1인당 100만원)

SELECT  COUNT (*) 사원수, (COUNT(*)*1000000) 총예산 -- 인원수 쓸 때는 COUNT 씀
    FROM VIEW_EMP3
    WHERE (SUBSTR(BIRTHDAY,1,4)>='1984' AND SUBSTR(BIRTHDAY,1,4)<='1989');
    -- WHERE (BIRTHDAY>='1984.01.01' AND BIRTHDAY>='1989.12.31');