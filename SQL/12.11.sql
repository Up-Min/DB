-- 8. EMPLOYEES 테이블에서 left join하여 관리자(매니저)를 출력하고 매니저 아이디가 없는 사람은 배제하고 하향식으로 하며, 급여는 역순으로 출력하여라.

SELECT a.manager_id, a.employee_id, a.first_name|| ' ' ||a.last_name AS NAME, a.salary
FROM EMPLOYEES A JOIN EMPLOYEES B
ON A.MANAGER_ID = B.EMPLOYEE_ID
WHERE A.MANAGER_ID IS NOT NULL
order by a.salary desc;

-- 사원의 이름 및 사원번호를 관리자의 이름과 관리자 번호와 함께 표시하고 각각의 열 레이블은
--employee, emp#, manager, mgr#로 지정하는데 King을 포함하여 관리자가 없는 모든 사원을 표시하도록 하고
--결과를 사원번호를 기준으로 정렬

select a. empno as employee, a. ename as emp#, b.ename as manager, b.empno as mgr#
from emp a , emp b
where a.mgr = b.empno
order by a.empno;

-- ■ 18. 지정한 부서번호, 사원이름 및 지정한 사원과 동일한 부서에서 근무하는 모든 사원을 표시하도록
--질의를 작성하고 부서번호는 department, 사원이름은 employee, 동일한 부서에서 근무하는 사원은
--colleague로 표시하시오.(부서번호, 사원이름,동료 순으로 오름차순 정렬) ■

select a. deptno as department, a. ename as employee, b.ename as colleague
from emp a, emp b
where a.deptno = b.deptno
order by a.deptno, a.ename, b.ename;

-- ■ 19. 10번부서에서 근무하는 사원들의 부서번호, 부서이름, 사원이름,월급,급여등급을 출력하시오. (emp,dept,salgrade) 
select a.deptno, b.dname, a.ename, a.sal, c.grade
from emp a join dept b
on a.deptno = b. deptno
join salgrade c
on a.sal >= c.losal and c.hisal >= a.sal
order by a.sal desc;

-- ■ 10. EMPLOYEES 테이블에서 (50번 부서의 최소 급여)를 받는 사원보다 많은 급여를 받는 사원의 정보를
--사원번호,이름,업무,입사일자,급여,부서번호를 출력하라. 단 50번은 제외 ■
select employee_id, first_name|| ' ' || last_name, job_id, hire_date, salary, department_id
from employees
where salary > (select min(salary) from employees where department_id = 50) and department_id != 50;

-- ■ 23. (SMITH의 관리자(mgr))의 이름과 부서명, 근무지역을 출력하시오. ■
select a. ename, b.ename as mgr, c.dname, c.loc
from emp a  
join emp b
on a.mgr = b.empno and a.ename = 'SMITH'
join dept c
on a.deptno = c.deptno;

-- ■ 2. EMPLOYEES 테이블에서 30번 부서만 EMPLOYEE_ID 를 emp_no로 LAST_NAME을 name으로
-- SALARY를 sal로 바꾸어 EMP_30 VIEW 를 생성하라 ■

create or replace view EMP_30 as 
select employee_id as emp_no, last_name as name, salary as sal
from employees where department_id = 30;

drop view EMP_30;

-- ■ 3. 부서별로 부서명, 최소 급여, 최대 급여, 부서의 평균 급여를 포함하는 DEPT_SUM VIEW을 생성하여라. 
create or replace view DEPT_SUM (department_name, minsal, maxsal, avgsal) as
select b.department_name, min(a.salary), max(a.salary), avg(a.salary) 
from employees a join departments b 
on a.department_id = b.department_id group by b.department_name;




