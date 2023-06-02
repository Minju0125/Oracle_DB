--PL/SQL
-- CASE �� : �� ������ �Ǵ� ������ ���� ���������϶�

SET SERVEROUTPUT ON;

DECLARE 
    V_NUM NUMBER := 77;
BEGIN 
    V_NUM := TRUNC(V_NUM/10);
    
    CASE V_NUM
        WHEN 10 THEN
        DBMS_OUTPUT.PUT_LINE('�� (' || V_NUM || ')');
        WHEN 9 THEN
        DBMS_OUTPUT.PUT_LINE('�� (' ||V_NUM || ')');
        WHEN 8 THEN
        DBMS_OUTPUT.PUT_LINE('�� ('|| V_NUM || ')');
        WHEN 7 THEN
        DBMS_OUTPUT.PUT_LINE('�� ('|| V_NUM || ')');
    ELSE
        DBMS_OUTPUT.PUT_LINE('�й��սô�.');
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
    DBMS_OUTPUT.PUT_LINE('1���� 10������ ��=' || V_SUM);
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
            DBMS_OUTPUT.PUT_LINE('�ű��ڵ�' || V_CODE || '�� �߰��Ǿ���');
        END IF;
    END LOOP;
END;
/

SELECT * FROM LPROD;

--WHILE���� ����Ͽ�  ��� INSERT�� �����͸� �����Ͻÿ�
--(������ �Ǿ����� Ȯ�� �޽��� ���)
DECLARE
V_ADD NUMBER(5) := 1007;
V_CODE CHAR(4) := '';
V_ID NUMBER(5);

BEGIN
  SELECT MAX(LPROD_ID) INTO V_ID FROM LPROD;
   WHILE V_ADD>=1002 LOOP
    DELETE FROM LPROD WHERE LPROD_ID=V_ID;  --V_ID : 16, 15, 14, 13, 12, 11
    
    V_ADD  := V_ADD - 1;   --1006, 1005, 1004, 1003, 1002, 1001���� 1�� ����(6ȸ �ݺ�)
    V_ID   := V_ID  - 1;   --LPROD_ID �ִ밪 ��, 16, 15, 14, 13, 12, 11
    V_CODE := 'TT'||SUBSTR(TO_CHAR(V_ADD),-2);  --ȭ�鿡 ����� ����ϱ� ����

  IF SQL%FOUND THEN
    --TT06, TT05, ...
    DBMS_OUTPUT.PUT_LINE('�����ڵ�' || V_CODE || '�� �����Ǿ����ϴ�');
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
    DBMS_OUTPUT.PUT_LINE('1���� 10������ ��=' || V_SUM);
END;
/

BEGIN
FOR I IN 1..10 LOOP
DBMS_OUTPUT.PUT_LINE('i=' || I);
END LOOP;
END;
/

DECLARE
  TYPE starcraft IS VARRAY(20) OF VARCHAR2(10); -- Type ����
  v_star starcraft;
BEGIN
  v_star := starcraft('Terran','Protos');
  v_star.EXTEND; 
  v_star(3) := 'Zerg'; 
  DBMS_OUTPUT.PUT_LINE('��Ÿũ����Ʈ ���� : '||  v_star.COUNT);
  FOR i IN v_star.FIRST..v_star.LAST LOOP
      DBMS_OUTPUT.PUT_LINE ( i || '��° ���� : ' || v_star(i));
  END LOOP;
END;
/
