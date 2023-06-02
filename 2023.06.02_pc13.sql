--PL/SQL
-- CASE 문 : 비교 기준이 되는 조건의 값이 여러가지일때

SET SERVEROUTPUT ON;

DECLARE 
    V_NUM NUMBER := 77;
BEGIN 
    V_NUM := TRUNC(V_NUM/10);
    
    CASE V_NUM
        WHEN 10 THEN
        DBMS_OUTPUT.PUT_LINE('수 (' || V_NUM || ')');
        WHEN 9 THEN
        DBMS_OUTPUT.PUT_LINE('수 (' ||V_NUM || ')');
        WHEN 8 THEN
        DBMS_OUTPUT.PUT_LINE('우 ('|| V_NUM || ')');
        WHEN 7 THEN
        DBMS_OUTPUT.PUT_LINE('미 ('|| V_NUM || ')');
    ELSE
        DBMS_OUTPUT.PUT_LINE('분발합시다.');
END CASE;
END;
/

DECLARE
    V_SUM   NUMBER := 0;
    V_VAR   NUMBER := 1;
BEGIN
    WHILE V_VAR <= 10 LOOP
        V_SUM := V_SUM + V_VAR;
        V_VAR := V_VAR + 1;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합=' || V_SUM);
END;
/

DECLARE
    V_ID    NUMBER := 1;
BEGIN
    WHILE V_ID < 20 LOOP
        DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID,'*'));
        V_ID := V_ID + 2;
    END LOOP;
END;
/

DECLARE 
  V_ID  NUMBER := 1;
  V_ID2 NUMBER := 10;
BEGIN
    DBMS_OUTPUT.PUT_LINE('');
    WHILE V_ID < 20 LOOP
     DBMS_OUTPUT.PUT(RPAD('a' , v_id2, ' '));
     DBMS_OUTPUT.PUT_LINE(RPAD('*',V_ID , '*'));    
     V_ID  := V_ID  + 2;  
     V_ID2 := V_ID2 - 1;  
  END LOOP;  
END;
/

DECLARE
    V_ADD   NUMBER(5) := 1000;
    V_CODE  CHAR(4)   := '';
    V_ID    NUMBER(5);
BEGIN
    SELECT MAX(LPROD_ID) INTO V_ID FROM LPROD;
    WHILE V_ADD <= 1005 LOOP
        V_ADD := V_ADD + 1;
        V_ID  := V_ID + 1;
        V_CODE := 'TT' || SUBSTR(TO_CHAR(V_ADD), -2);
        INSERT INTO LPROD(LPROD_ID, LPROD_GU, LPROD_NM) VALUES(V_ID, V_CODE, 'LOOP TEST');
        IF SQL%FOUND THEN
            DBMS_OUTPUT.PUT_LINE('신규코드' || V_CODE || '가 추가되었음');
        END IF;
    END LOOP;
END;
/

SELECT * FROM LPROD;

--WHILE문을 사용하여  상기 INSERT된 데이터를 삭제하시오
--(삭제가 되었는지 확인 메시지 출력)
DECLARE
V_ADD NUMBER(5) := 1007;
V_CODE CHAR(4) := '';
V_ID NUMBER(5);

BEGIN
  SELECT MAX(LPROD_ID) INTO V_ID FROM LPROD;
   WHILE V_ADD>=1002 LOOP
    DELETE FROM LPROD WHERE LPROD_ID=V_ID;  --V_ID : 16, 15, 14, 13, 12, 11
    
    V_ADD  := V_ADD - 1;   --1006, 1005, 1004, 1003, 1002, 1001까지 1씩 감소(6회 반복)
    V_ID   := V_ID  - 1;   --LPROD_ID 최대값 즉, 16, 15, 14, 13, 12, 11
    V_CODE := 'TT'||SUBSTR(TO_CHAR(V_ADD),-2);  --화면에 결과를 출력하기 위함

  IF SQL%FOUND THEN
    --TT06, TT05, ...
    DBMS_OUTPUT.PUT_LINE('기존코드' || V_CODE || '가 삭제되었습니다');
  END IF;
END LOOP;
END;
/

DECLARE 
  v_sum INT := 0;
  v_var INT := 1;
BEGIN
<<mylabel>>
  v_sum := v_sum + v_var;
  v_var := v_var + 1;
  IF v_var <= 10 THEN
    GOTO mylabel;
  END IF;
  DBMS_OUTPUT.PUT_LINE(v_sum);
  DBMS_OUTPUT.PUT_LINE(v_var);
END;
/

DECLARE
    V_SUM NUMBER := 0;
    V_VAR NUMBER := 1;
BEGIN   LOOP
    V_SUM := V_SUM + V_VAR;
    V_VAR := V_VAR + 1;
IF V_VAR > 10 THEN
    EXIT;
    END IF;
    END LOOP;
    DBMS_OUTPUT.PUT_LINE('1부터 10까지의 합=' || V_SUM);
END;
/

BEGIN
FOR I IN 1..10 LOOP
DBMS_OUTPUT.PUT_LINE('i=' || I);
END LOOP;
END;
/

DECLARE
  TYPE starcraft IS VARRAY(20) OF VARCHAR2(10); -- Type 선언
  v_star starcraft;
BEGIN
  v_star := starcraft('Terran','Protos');
  v_star.EXTEND; 
  v_star(3) := 'Zerg'; 
  DBMS_OUTPUT.PUT_LINE('스타크래프트 종족 : '||  v_star.COUNT);
  FOR i IN v_star.FIRST..v_star.LAST LOOP
      DBMS_OUTPUT.PUT_LINE ( i || '번째 종족 : ' || v_star(i));
  END LOOP;
END;
/
