--COMMIT; -- commit�� �ϱ� �������� ��ǻ�� �޸𸮿��� ������ �Ǿ��־�����, Ŀ��(insert, update, delete)�� ���� ���� db�� ������ �ϰ� ��
--
--INSERT INTO EMP VALUES(4, '������', 10);
--INSERT INTO EMP VALUES(5, '����', 10);
--
--select * from sample;
--select * from EMP;
--
--ROLLBACK; -- 3���࿡�� insert�� �ص� rollback�� �ϸ� Ŀ�� ������ �������� ���ư��� �ȴ�.
--
---- CHECK
--ALTER TABLE EMP MODIFY AGE NUMBER CHECK(AGE IN(10,11));
---- AGE�÷��� 10, 11�� �ְڴٴ� �ǹ�. CHECK��� �������� �߰�.
--INSERT INTO EMP VALUES(5, '����', 12);
----> ���������� 10,11�� �ƴ� ���� ���� ������ ������ ���.
--
----INDEX
--CREATE INDEX EMP_IX01 ON EMP(NAME); -- NAME �÷��� �ε����� �Ǵ�.
--CREATE INDEX EMP_IX02 ON EMP (NO, NAME); -- NO, NAME �÷��� �ε����� �Ǵ�.
---- �������� �÷��� �ε����� �Ѳ����� ��, �ε����� �̸��� ������ �ȵ�!
--
---- ����� �ε��� Ȱ���Ͽ� ��������
--SELECT * FROM EMP WHERE NAME = '����';
--
--CREATE UNIQUE INDEX EMP_1X03 ON EMP(AGE); 
---- �����߻�. AGE�ȿ� ���� ���ڰ� �ߺ����� �ʾƾ��ϴµ�(������ ���̾���ϴµ�),
---- ���� EMP���̺�Ŵ� �� ����!
--CREATE UNIQUE INDEX EMP_1X03 ON EMP(NO); -- ��� ���� �� �ٸ��⶧���� ����. 
--
----�ε��� ����
--DROP INDEX EMP_IX01;
--
--
--SELECT * FROM USER_TABLES;
--SELECT * FROM USER_INDEXES;
--SELECT * FROM USER_VIEWS;

-- ���ν���
--SELECT* FROM GIFT;
--
--CREATE OR REPLACE PROCEDURE ���ν����̸� (�Ķ����1, �Ķ����2....)
--IS
--����
--BEGIN
--������
--END ���ν��� �̸�;


-- ���ν��� ����
--CREATE OR REPLACE PROCEDURE EX_PROC (IN_TYPE IN VARCHAR2, IN_NAME IN VARCHAR2)
--IS
--PRICE NUMBER := 10000; 
--
--BEGIN 
--INSERT INTO GIFT
--VALUES(11, IN_NAME, PRICE, IN_TYPE);
--COMMIT;
--END EX_PROC;

--CREATE OR REPLACE PROCEDURE EX_PROC (IN_TYPE IN VARCHAR2, IN_NAME IN VARCHAR2) -- �Ű�����
--IS -- (IS�� BEGIN ���� ���� �ֱ�)
--PRICE NUMBER := 10000; --���� ����
--
--BEGIN -- ���������� �����ϰ� ���� ������
--INSERT INTO GIFT
--VALUES(11,IN_NAME, PRICE, IN_TYPE);
--COMMIT;
--END EX_PROC;

-- ���ν��� ����
EXEC EX_PROC ('������ǰ', 'TV');



