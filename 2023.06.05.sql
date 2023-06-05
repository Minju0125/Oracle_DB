DECLARE
    TYPE starcraft IS VARRAY(20) OF VARCHAR2(10);
    V_STAR STARCRAFT;

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
SET SERVEROUTPUT ON;

--
DECLARE
  TYPE lprod_nm_table IS TABLE OF VARCHAR2(40)
      INDEX BY PLS_INTEGER;

  t_lprod_nm lprod_nm_table;
BEGIN  
  FOR  l_list IN (SELECT lprod_id, lprod_nm FROM lprod) LOOP
      t_lprod_nm(l_list.lprod_id) := l_list.lprod_nm;
      DBMS_OUTPUT.PUT_LINE (l_list.lprod_id || ' = ' || l_list.lprod_nm  );
  END LOOP;

  DBMS_OUTPUT.PUT_LINE ('���� = ' || t_lprod_nm.COUNT); 
  FOR i IN t_lprod_nm.FIRST..t_lprod_nm.LAST LOOP
	IF t_lprod_nm.EXISTS(i) THEN
  	   DBMS_OUTPUT.PUT_LINE ( i || ' ' || t_lprod_nm(i));
	END IF;
   END LOOP;
END;
/
-- EXCEPTION ó��
DECLARE
    v_name varchar2(20);
BEGIN
    SELECT lprod_nm INTO v_name FROM lprod WHERE lprod_gu = 'P201';
    DBMS_OUTPUT.PUT_LINE ('�з��� =' || v_name);
EXCEPTION
    WHEN  NO_DATA_FOUND  THEN 
            DBMS_OUTPUT.PUT_LINE ( '�ش� ������ �����ϴ�.');
        WHEN  TOO_MANY_ROWS  THEN 
            DBMS_OUTPUT.PUT_LINE (' �Ѱ� �̻��� ���� ���Խ��ϴ�. ');
        WHEN  OTHERS  THEN  
            DBMS_OUTPUT.PUT_LINE ( '��Ÿ ���� :' || SQLERRM  ); 
END;
/

DECLARE
    exp_reference EXCEPTION;
    PRAGMA EXCEPTION_INIT(exp_reference, -2292);
BEGIN
    DELETE FROM lprod WHERE lprod_gu = 'P101';
    DBMS_OUTPUT.PUT_LINE('�з� ����');
--EXCEPTION 
--    WHEN exp_reference THEN
--         DBMS_OUTPUT.PUT_LINE('���� �Ұ� :' ||SQLERRM);
--    WHEN OTHERS THEN
--         DBMS_OUTPUT.PUT_LINE( SQLCODE  ||  ' ' || SQLERRM);
END;
/

ACCEPT p_lgu PROMPT '����Ϸ��� �з��ڵ� �Է� : ' --�̰� ��¡
DECLARE 
    exp_lprod_gu EXCEPTION;
    v_lgu VARCHAR2(10) := UPPER('&p_lgu');
BEGIN
    If v_lgu IN('P101','P102','P201','P202') THEN
    RAISE exp_lprod_gu;
    END IF;
    DBMS_OUTPUT.PUT_LINE(v_lgu || '�� ��ϰ���');
EXCEPTION
    WHEN exp_lprod_gu THEN
        DBMS_OUTPUT.PUT_LINE (v_lgu || '�� �̹� ��ϵ� �ڵ��Դϴ�.') ;
END;
/

DECLARE 
   v_prod VARCHAR2(30);
   v_qty  NUMBER(10,0);

   CURSOR UpRemain_cur IS
       SELECT buy_prod, SUM(buy_qty)  FROM buyprod
       WHERE  EXTRACT(YEAR FROM  buy_date) = 2020
       GROUP BY buy_prod ORDER BY buy_prod ASC;
BEGIN  
  OPEN UpRemain_cur;
  FETCH UpRemain_cur INTO v_prod, v_qty;
  WHILE (UpRemain_cur%FOUND)  LOOP
       DBMS_OUTPUT.PUT_LINE( UpRemain_cur%ROWCOUNT || '��° ��ǰ=' 
                                                         || v_prod || ' �԰����=' || v_qty ||  '�Դϴ�.');
        FETCH UpRemain_cur INTO v_prod, v_qty;
  END LOOP;
  CLOSE UpRemain_cur;
END;
/
DECLARE 
   v_prod VARCHAR2(30);
   v_qty  NUMBER(10,0);

   CURSOR UpRemain_cur IS
       SELECT buy_prod, SUM(buy_qty)  FROM buyprod
       WHERE  EXTRACT(YEAR FROM  buy_date) = 2020
       GROUP BY buy_prod ORDER BY buy_prod ASC;
BEGIN  
  OPEN UpRemain_cur;
  FETCH UpRemain_cur INTO v_prod, v_qty;
  WHILE (UpRemain_cur%FOUND)  LOOP
       DBMS_OUTPUT.PUT_LINE( UpRemain_cur%ROWCOUNT || '��° ��ǰ=' 
                                                         || v_prod || ' �԰����=' || v_qty ||  '�Դϴ�.');
        FETCH UpRemain_cur INTO v_prod, v_qty;
  END LOOP;
  CLOSE UpRemain_cur;
END;
/
-- ������ ������ �޾� �̸� ȸ����� ���ϸ��� ��� Ŀ��

ACCEPT p_job PROMPT '������ �Է��ϼ��� : '

DECLARE 
    v_name VARCHAR2(30);
    v_mileage NUMBER(10);
    CURSOR MEMBER_CUR IS
      SELECT mem_name, mem_mileage
        FROM member
    WHERE mem_job = '&p_job'
    ORDER BY mem_name ASC;
BEGIN
    FOR mem_rec IN member_cur LOOP
     DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT || '��°' // mem_rec.mem_name || ',' || mem_rec.mem_mileage);
     EMD LOOP;
    END;
/

DECLARE 
   v_name VARCHAR2(30);
   v_mileage  NUMBER(10);

  CURSOR member_cur ( v_job VARCHAR2)  IS
     SELECT mem_name, mem_mileage  FROM member
     WHERE mem_job = v_job 
     ORDER BY mem_name ASC;
BEGIN  
  OPEN member_cur('�ֺ�');  
  LOOP
     FETCH member_cur INTO v_name,  v_mileage; --FETCH�� SELECT��� �����ϸ� ��
     EXIT WHEN member_cur%NOTFOUND;
     DBMS_OUTPUT.PUT_LINE( member_cur%ROWCOUNT || '��° ' 
                           || v_name || ', ' || v_mileage );
  END LOOP;
  CLOSE member_cur;
END;
/

--������ �Է¹޾Ƽ� FOR LOOP�� �̿��ϴ� CURSOR 
ACCEPT p_job PROMT '������ �Է��ϼ���: ';
DECLARE
    v_name VARCHAR2(30);
    v_mileage Number (10);
    CURSOR member_cur IS
      SELECT mem_name, mem_mileage
        FROM member
    WHERE mem_job = '&p_job'
    ORDER BY mem_name ASC;
BEGIN
  FOR mem_rec IN member_cur LOOP
        DBMS_OUTPUT.PUT_LINE(member_cur%ROWCOUNT || '��°' || mem_rec.mem_name || ',' ||mem_rec.mem_mileage);
        END LOOP;
    END;
    --for �������� Ŀ�� open, close �Ƚ��൵�� (������)
/

BEGIN   
  FOR mem_rec IN (SELECT mem_name, mem_mileage
                                  FROM member ORDER BY mem_name ASC)  LOOP    
      DBMS_OUTPUT.PUT_LINE( mem_rec.mem_id || ', '  ||mem_rec.mem_name || ', ' || mem_rec.mem_mileage );  
  END LOOP;
END;
/
