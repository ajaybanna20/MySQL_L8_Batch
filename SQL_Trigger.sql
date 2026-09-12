-- DML Trigger 
-- trigger are block of code that automatically are executed when a event happens

/*
Create or replace trigger Trigger_1
AFTER
update on employee_2 

begin 

    dbms_output.PUT_LINE('hey trigger after update');

end;
*/

-- Execution level 

-- Statemnet Level Trigger - Fires exactly once per SQL statement, regardless of how many rows are affected.

-- Row level Trigger - Fires once for every individual row modified by the SQL statement.

-- DDL Trigger

/*
Create table project_task (
  task_id   int, 
  task_name  Varchar2(100) not null
  status     varchar2(20) default 'pending'
-- Audit fields
created_by varchar2(50)
created_by timestamp
*/

/*

create table that name is task_audit
first column is primary key and genereate alwats new value

and next column is username 
and next coumn is operation column that show update value
and next columm is old value that show vlaue before update
and next column is new value that show after update

/*

Create a table that have operation and time column
if i insert vlaue that give me insert and time
and if i upadate that give me update and time
and last if i delete that give me delete and time

*/



