-- 8. EMPLOYEES ���̺��� left join�Ͽ� ������(�Ŵ���)�� ����ϰ� �Ŵ��� ���̵� ���� ����� �����ϰ� ��������� �ϸ�, �޿��� �������� ����Ͽ���.

SELECT a.manager_id, a.employee_id, a.first_name|| ' ' ||a.last_name AS NAME, a.salary
FROM EMPLOYEES A JOIN EMPLOYEES B
ON A.MANAGER_ID = B.EMPLOYEE_ID
WHERE A.MANAGER_ID IS NOT NULL
order by a.salary desc;

-- ����� �̸� �� �����ȣ�� �������� �̸��� ������ ��ȣ�� �Բ� ǥ���ϰ� ������ �� ���̺���
--employee, emp#, manager, mgr#�� �����ϴµ� King�� �����Ͽ� �����ڰ� ���� ��� ����� ǥ���ϵ��� �ϰ�
--����� �����ȣ�� �������� ����

select a. empno as employee, a. ename as emp#, b.ename as manager, b.empno as mgr#
from emp a , emp b
where a.mgr = b.empno
order by a.empno;

-- �� 18. ������ �μ���ȣ, ����̸� �� ������ ����� ������ �μ����� �ٹ��ϴ� ��� ����� ǥ���ϵ���
--���Ǹ� �ۼ��ϰ� �μ���ȣ�� department, ����̸��� employee, ������ �μ����� �ٹ��ϴ� �����
--colleague�� ǥ���Ͻÿ�.(�μ���ȣ, ����̸�,���� ������ �������� ����) ��

select a. deptno as department, a. ename as employee, b.ename as colleague
from emp a, emp b
where a.deptno = b.deptno
order by a.deptno, a.ename, b.ename;

-- �� 19. 10���μ����� �ٹ��ϴ� ������� �μ���ȣ, �μ��̸�, ����̸�,����,�޿������ ����Ͻÿ�. (emp,dept,salgrade) 
select a.deptno, b.dname, a.ename, a.sal, c.grade
from emp a join dept b
on a.deptno = b. deptno
join salgrade c
on a.sal >= c.losal and c.hisal >= a.sal
order by a.sal desc;

-- �� 10. EMPLOYEES ���̺��� (50�� �μ��� �ּ� �޿�)�� �޴� ������� ���� �޿��� �޴� ����� ������
--�����ȣ,�̸�,����,�Ի�����,�޿�,�μ���ȣ�� ����϶�. �� 50���� ���� ��
select employee_id, first_name|| ' ' || last_name, job_id, hire_date, salary, department_id
from employees
where salary > (select min(salary) from employees where department_id = 50) and department_id != 50;

-- �� 23. (SMITH�� ������(mgr))�� �̸��� �μ���, �ٹ������� ����Ͻÿ�. ��
select a. ename, b.ename as mgr, c.dname, c.loc
from emp a  
join emp b
on a.mgr = b.empno and a.ename = 'SMITH'
join dept c
on a.deptno = c.deptno;

-- �� 2. EMPLOYEES ���̺��� 30�� �μ��� EMPLOYEE_ID �� emp_no�� LAST_NAME�� name����
-- SALARY�� sal�� �ٲپ� EMP_30 VIEW �� �����϶� ��

create or replace view EMP_30 as 
select employee_id as emp_no, last_name as name, salary as sal
from employees where department_id = 30;

drop view EMP_30;

-- �� 3. �μ����� �μ���, �ּ� �޿�, �ִ� �޿�, �μ��� ��� �޿��� �����ϴ� DEPT_SUM VIEW�� �����Ͽ���. 
create or replace view DEPT_SUM (department_name, minsal, maxsal, avgsal) as
select b.department_name, min(a.salary), max(a.salary), avg(a.salary) 
from employees a join departments b 
on a.department_id = b.department_id group by b.department_name;




