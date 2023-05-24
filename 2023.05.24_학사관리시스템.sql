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





