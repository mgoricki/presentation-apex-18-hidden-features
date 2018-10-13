set serveroutput on ;
--------------------------------------
-- apex_util.string_to_table DEPRECATED
declare
  v_arr    apex_application_global.vc_arr2;
begin
  v_arr := apex_util.string_to_table('One:Two:Three');
  for i in 1..v_arr.count 
  loop
    dbms_output.put_line(v_arr(i));
  end loop;
end;
/

-- apex_string
select * from apex_string.split('One:Two:Three', ':');
-- select * from APEX_UTIL.STRING_TO_TABLE('One:Two:Three');

--------------------------------------
-- apex_util.table_to_string DEPRECATED
declare
  v_arr apex_application_global.vc_arr2;
begin
  select ename
    bulk collect into v_arr
    from emp;
  
  dbms_output.put_line(apex_util.table_to_string(v_arr));  
end;
/

-- apex_string.join
declare
  v_arr apex_t_varchar2;
begin
  select ename
    bulk collect into v_arr
    from emp;
  
  dbms_output.put_line(apex_string.join(v_arr, ':'));  
end;
/


select apex_string.join(apex_t_varchar2('One','Two','Three'),':') x
  from dual;


--------------------------------------
-- PUT/GET table
declare
  v_table apex_t_varchar2;
begin
  -- populate table
  for i in (select ename, sal from emp)
  loop
    -- put element into table
    apex_string.plist_put(v_table, i.ename, i.sal);
  end loop;
  
  
  -- get element from table
  dbms_output.put_line(
    apex_string.plist_get(v_table, 'JONES')
  );  
end;  
/

--------------------------------------
-- APEX_STRING.MESSAGE
-- %usage Returns a formatted string, with substitutions applied.

select apex_string.format('Hi %s! Hope to see you at the party. It starts at %s.', 'Marko', '18:30') m
  from dual;
  
-- with %0 %1 - starts with zero
select apex_string.format('Hi %1! Hope to see you at the party. It starts at %0.', '18:30', 'Marko', p_max_length => 10) m
  from dual;  

--------------------------------------
-- APEX_STRING.SHUFFLE
-- %usage Returns the input table values, re-ordered..
select * 
  from apex_string.shuffle(apex_t_varchar2('One','Two','Three'));

--------------------------------------
-- PARSING CSV
select /*csv*/ * from emp; -- get CSV

-- parse CSV with apex_string
with 
  function get_column (p_row     varchar2
                     , p_col_num number)
    return varchar2
  is
    v_row apex_t_varchar2;
  begin
    v_row := apex_string.split(p_row, ',');
    if v_row.exists(p_col_num) then
      return v_row(p_col_num);  
    end if;  
    return null;
  end;    
select get_column(column_value, 1) as col1
     , get_column(column_value, 2) as col2
     , get_column(column_value, 3) as col3
     , get_column(column_value, 4) as col4
     , get_column(column_value, 5) as col5      
     , get_column(column_value, 6) as col6   
     , get_column(column_value, 7) as col7   
     , get_column(column_value, 8) as col8        
  from apex_string.split(:CSVDATA, chr(10));
  /
  
--------------------------------------
-- APEX_UTIL.GET_HASH
-- computes a hash value for all given values
-- can be used to implement lost update detection for data records
-- p_salted - if true (the default), salt hash with internal session info

select ename, apex_util.get_hash(apex_t_varchar2 (empno, sal, comm)) x
  from emp;
