-- 09/09/2026 Wednesday


create table employee_2 as 
select employee_id,first_name from hr.employees
FETCH NEXT 2 ROWS ONLY;

select * from employee_2;

declare 
     v_name employee_2.first_name%type;

begin
    select first_name into v_name from employee_2 where employee_id=101;
    dbms_output.put_line('value of sql query:');
        dbms_output.put_line(v_name);
end;        


declare 
    

     v_rec employee_2%rowtype;    -- (employee_id   int,first_name   varchar(20))

begin
    select * into v_rec from employee_2 where employee_id=101;
    dbms_output.put_line(v_rec.employee_id || '' || v_rec.first_name);
        
end;