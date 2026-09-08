-- PLSQL --> Procedural Language
-- procedual sql where we combined sql feature with programing lanaguage fetures
-- it Help in high performace beacuse it can take multiple statements and it can share it over the internet in form of block(set of logics)
-- Pl SQL supports error handling in python
-- SO in sql every statement is execute one ny one (independtly) but in PL block of code run together




-- 1.Declarative Section (optional)
-- Define Varibale, constants, cursors and subprogram here

-- Begin
		-- 2.Exceutable Section(madatory)
          -- write Your Sql and PL/SQL logic 
          -- end;

-- 3.Exception
-- Exception handling Section(optional)
-- intercept and handle errors/exceptions here

/* 
Declare Block
        DECLARE --> Variable, cursor, function


Executable
         begin
             
             logic

        end

Exception Block
          except
                 error handling

*/


/*
 begin 
    
    dbms_output.put_line('hi ajay');

end;

*/

/*
declare
        age number:=23;
begin 
    
    dbms_output.put_line('hi my name is ajay');
    dbms_output.put_line(age);
    age:=19;
    dbms_output.put_line(age);
    if(age=19) then
     dbms_output.put_line('we got 19');
    else
     dbms_output.put_line('not 19');

    end if;

end;
*/

/*
Declare
       age number :=19;
       x number:=1;
Begin 
      while x<=age LOOP
      dbms_output.put_line(X);
      x:=x+1;
end loop;
*/