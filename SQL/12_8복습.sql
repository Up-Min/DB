
-- ABS, SIGN, ROUND, TRUNC, CEIL, FLOOD, MOD
SELECT ABS(-1) FROM DUAL; -- ABS : ���밪�� �����´�
SELECT SIGN (-50) FROM DUAL; -- SIGN : ��ȣ�� �����´�.
-- �����ϰ�� -1, ����ϰ�� 1, 0�ϰ�� 0�� �����´�.
SELECT ROUND (165.432,1) FROM DUAL; -- ROUND : �ݿø� ���� (165.432, 1) - 1��° �ڸ����� ����
-- TRUNC (165.432,1) : 165.4 ������ ��Ÿ���� �������� �� ����
-- CEIL(165.432) : 166. �Ҽ����� �� ������ ������ �ø�
-- FLOOR (165.432) : 165. �Ҽ����� �� ������ ������ ����
-- MOD (165,7) : 165�� 7�� ���� ���� �������� ��ȯ��.
-- 2��° ���� 0�� ��� 1������ �״�� ���� ��.

-- ��¥ (EXTRACT, ADD_MONTHS)
-- SELECT EXTRACT (������ ���� FROM �÷���) FROM ������ ���̺� ��
SELECT EXTRACT (MONTH FROM SYSDATE) FROM DUAL;
-- SELECT ADD_MONTHS (��¥, +-�� ��¥) FROM ������ ���̺� ��
SELECT ADD_MONTHS(SYSDATE,+1) FROM DUAL;

-- ����� ����ȯ �Լ� (TO_NUMBER, TO_CHAR, TO_DATE)
SELECT TO_NUMBER ('1234') FROM DUAL;
SELECT TO_CHAR('AAAA') FROM DUAL;
SELECT TO_DATE('2022-12-08', 'YYYY-MM-DD') FROM DUAL;

-- NULL ���� �Լ� (NVL, NULLIF, COALESCE)

--DECODE, CASE (IF, ELSE IF�� �����ϴ�!)
SELECT ID, DECODE (ID, 1, 'BLUE') FROM CUSTOMER;
SELECT ID,
    CASE WHEN ID = 1 THEN 'BLUE'
    ELSE 'WHITE'
    END
    FROM CUSTOMER;
-- �⺻Ű /  �ܷ�Ű (PK, FK - �θ��ڽ�!)
 -- FK ����
--  CONSTRAINT FK_DEPT_NO FOREIGN KEY(DEPT_NO) REFERENCES DEPT(DEPT_NO); 
-- INNER, EQUI, FULL OUTER, LEFT OUTER, RIGHT OUTER JOIN
SELECT * FROM ACADEMY_A A1 JOIN ACADEMY_B B1 ON (A1.STUDENT_NO = B1.STUDENT_NO);
SELECT * FROM ACADEMY_A A1, ACADEMY_B B1 WHERE A1.STUDENT_NO = B1.STUDENT_NO;

--���տ����� UNION ALL, UNION, INTERSECT, MINUS

 -- ��Į�� �������� (SELECT�ȿ� �� SELECT)
SELECT T1.STUDENT_NO,
(SELECT T2.STUDENT_NAME FROM ACADEMY_B T2 WHERE T1.STUDENT_NO = T2.STUDENT_NO)
FROM ACADEMY_A T1;
-- ������ ����Ʈ�� �ΰ��� �÷��� �������µ�, �ڿ� ���� �÷���
-- SELECT�� �̿��Ͽ� �ѹ� �� �ɷ��شٴ� �������� �����! 

 --�ζ��� �� (FROM �ȿ� SELECT)
 SELECT T1.STUDENT_NO, T2.STUDENT_NAME
 FROM ACADEMY_A T1, 
 (SELECT STUDENT_NO, STUDENT_NAME FROM ACADEMY_B)T2
 WHERE T1.STUDENT_NO = T2.STUDENT_NO;