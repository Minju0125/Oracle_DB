select * from dual; -- SQL 주석 (--)

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
        VALUES('100', '김기훈', '영업부', '010-8422-8117', 300, '대전광역시 서구 둔산로31번길 31');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('101', '홍성범', '기획부', '010-7562-3217', 350, '대전광역시 서구 계룡로29번길 50');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('102', '이만수', '기획부', '010-5562-6677', 500, '대전광역시 중구 대사로30번길 10');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('103', '강나미', '영업부', '010-4442-5614', 350, '대전광역시 중구 선화로10번길 30');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('109', '민병철', '총무부', '010-2542-8211', 250, '대전광역시 동구 산내로1205번길 24');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('108', '박민주', '총무부', '010-4032-2635', 250, '대전광역시 중구 동서대로1347번길 24');
        
SELECT * FROM EMPOLYER;
                        -- 데이터 조회
                        -- * 가 붙으면 모두 ! 테이블에 있는 모든 필드를 조회
DROP TABLE EMPOLYER; -- 테이블 삭제
                        
 1. 사원번호가 109인 사원을 조회하시오.
 SELECT EMPNO,ENAME,TEL,SALARY,ADDRESS 
  FROM EMPOLYER
  WHERE EMPNO = '109';
 
 2. 급여가 500만원인 사원을 조회하시오.
 
 SELECT EMPNO, ENAME, TEL, SALARY, ADDRESS
  FROM EMPOLYER
  WHERE SALARY = 500;

 3. 현재 사원수를 조회하시오.
 SELECT COUNT(*)사원수
  FROM EMPOLYER ; 
 
 4. 급여가 300만원 이상인 사원을 조회하시오.
 SELECT EMPNO, ENAME, TEL, SALARY, ADDRESS
  FROM EMPOLYER 
  WHERE SALARY >=300 ; 
  
 5. (조건2개) 사원 번호가 102번 이상이고, 급여가 400만원 이상인 사원을 조회하시오.
 SELECT EMPNO, ENAME, TEL, SALARY, ADDRESS
  FROM EMPOLYER
  WHERE EMPNO>=102 AND SALARY >=400 ; 
  -- 조건 2개일 때는 AND 사용
  
 6. (과제) 사원테이블을 삭제 후 다시 생성하고 데이터를 삽입하시오.
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
        VALUES('100', '김기훈', '영업부', '010-8422-8117', 300, '대전광역시 서구 둔산로31번길 31');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('101', '홍성범', '기획부', '010-7562-3217', 350, '대전광역시 서구 계룡로29번길 50');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('102', '이만수', '기획부', '010-5562-6677', 500, '대전광역시 중구 대사로30번길 10');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('103', '강나미', '영업부', '010-4442-5614', 350, '대전광역시 중구 선화로10번길 30');
    INSERT INTO EMPOLYER (EMPNO, ENAME, DEPT, TEL, SALARY, ADDRESS)
        VALUES('109', '민병철', '총무부', '010-2542-8211', 250, '대전광역시 동구 산내로1205번길 24');
   
  
 ----------------------------------
 
  
  
        