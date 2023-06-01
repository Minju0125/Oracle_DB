----------------------------------------------------
SET SERVEROUTPUT ON 

DECLARE
    v_i     NUMBER(9,2) := 0;
    v_name  VARCHAR2(20);
    c_pi    CONSTRAINT NUMBER(8,6) :
    v_flag  BOOLEAN NOT NULL : = true;
    v_date  VARCHAR2(10) := TO_CHAR(SYSDATE, 'YYYY-MM-DD');
BEGIN
    v_name := '홍길동';
    DBMS_OUTPUT.ENABLE;
    DBMS_OUTPUT.PUT_LINE( 'v_i : ' || v_i );           
    DBMS_OUTPUT.PUT_LINE( 'v_name : ' || v_name);    
    DBMS_OUTPUT.PUT_LINE( 'c_pi : ' || c_pi );
    DBMS_OUTPUT.PUT_LINE( 'v_date : ' || v_date);
  END;
 /
 
 DECLARE
    V_NUM NUMBER := 37;
BEGIN
    DBMS_OUTPUT.ENABLE;
IF MOD(V_NUM,2) = 0 THEN
    DBMS_OUTPUT.PUT.LINE(V_NUM || '는 짝수');
ELSE
    DBMS_OUTPUT.PUT_LINE(V_NUM || '는 홀수');
END IF;
END;
/

DECLARE 
   v_num   NUMBER := 67;
BEGIN
   DBMS_OUTPUT.ENABLE; 
   IF v_num > 90 THEN
      DBMS_OUTPUT.PUT_LINE('수');
   ELSIF  v_num > 80 THEN
      DBMS_OUTPUT.PUT_LINE('우');
   ELSIF  v_num > 70 THEN
      DBMS_OUTPUT.PUT_LINE('미');     
   ELSE
      DBMS_OUTPUT.PUT_LINE('분발합시다.');
   END IF; 
END;
/

DECLARE
    v_avg_sale PROD.PROD_SALE%TYPE; -- 이 타입의 모두를 변수에 할당함.
    v_sale NUMBER := 500000;
BEGIN
    DBMS_OUTPUT.ENABLE;
    SELECT AVG(PROD_SALE) INTO v_avg_sale   FROM PROD;
    IF v_sale <v_avg_sale   THEN
        DBMS_OUTPUT.PUT_LINE('평균 단가가 500000 초과입니다.');
    ELSE 
        DBMS_OUTPUT.PUT_LINE('평균 단가가 500000 이하입니다.');
    END IF;
END;
/

DECLARE
    V_MEM_ID      VARCHAR2(10) := '1001';
    V_MEM_MILEAGE MEMBER.MEM_MILEAGE%TYPE;
    V_MEM_NAME    MEMBER.MEM_NAME%TYPE;
    V_MILE        NUMBER  := 5000;
BEGIN
    DBMS_OUTPUT.ENABLE;
    
    SELECT MEM_MILEAGE, MEM_NAME
    INTO   V_MEM_MILEAGE, V_MEM_NAME
    FROM   MEMBER
    WHERE  MEM_ID = V_MEM_ID;
    
    IF V_MILE < V_MEM_MILEAGE THEN
        DBMS_OUTPUT.PUT_LINE('VIP 회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
    ELSE
        DBMS_OUTPUT.PUT_LINE('일반회원(' || V_MEM_NAME || ', ' || V_MEM_MILEAGE || ')');
    END IF;
END;
/

