select * From apex_debug_messages;

-- view active sessions
select * 
  from apex_workspace_sessions 
 where workspace_name = 'SIOUG2018' 
   and trunc(session_created) = trunc(Sysdate)
   and user_name = 'DEMO'
order by session_created desc;
   
------------------------------------------------------------------------------------------------
-- 1) SET_DEBUG
begin
  apex_session.set_debug (
       p_session_id => :APP_SESSION,
       p_level      => apex_debug.c_log_level_info);
  commit; -- DON'T FORGET TO COMMIT!!!!       
end;
/

select * from apex_debug_messages where session_id = 4668249412165 order by id desc;

------------------------------------------------------------------------------------------------
-- 2) CREATE_SESSION
begin
  apex_util.set_workspace(:WORKSPACE_NAME);
  apex_session.create_session (p_app_id   => 114
                             , p_page_id  => 1
                             , p_username => :USER);
end;
/

-- Example 1: view variables
select v('APP_ID') as app_id
     , v('APP_SESSION') as app_session
     , v('APP_USER') as app_user 
     , apex_mail.get_instance_url||apex_page.get_url as get_url
  from dual;

-- Example 2: create collections
select * From apex_collections;
exec apex_collection.create_collection_from_query ('EMP', 'select * from emp', p_truncate_if_exists => 'YES');
select * From apex_collections;

exec apex_collection.update_member_attribute('EMP'
                                           , p_seq => 1
                                           , p_attr_number => 2
                                           , p_attr_VALUE => 'KING THE GREATEST'); 

-- Example 3: use v function 
select v('P1_DEPTNO') from dual;

create or replace view v_emp as
  select * 
    from emp
   where deptno = (select v('P1_DEPTNO') from dual); 
   
select * from v_emp;
call apex_util.set_session_state('P1_DEPTNO', '10'); -- you don't even need to create item

-- Example 4: Create protected URL outside APEX session
select apex_page.get_url(p_items => 'P1_DEPTNO', p_values => '10') url from dual;


------------------------------------------------------------------------------------------------
-- 3) ATTACH
begin
  -- no need to set workspace id
  apex_session.attach(p_app_id     => 114
                    , p_page_id    => 3
                    , p_session_id => :APP_SESSION);
end;
/

-- you need to reattach to view values after change because it's cached
select item_name
     , apex_util.get_session_state(item_name) as val
     , v(item_name) as val2
  from apex_application_page_items 
 where application_id = 114 and page_id = 3;

-- you can set APEX item
exec apex_util.set_session_state('P3_ITEM', 'Marko');

-- you can alse see collections
select * From apex_collections;

begin
  apex_collection.update_member_attribute('EMP', p_seq => 1, p_attr_number => 2, p_attr_VALUE => 'KING THE GREATEST'); 
  commit;
end;
/



------------------------------------------------------------------------------------------------
-- 4) DELETE
begin
  apex_util.set_workspace(:WORKSPACE_NAME);
  apex_session.create_session (p_app_id   => 114
                             , p_page_id  => 1
                             , p_username => :USER);
end;
/
select * from apex_workspace_sessions where workspace_name = 'SIOUG2018' and apex_session_id = v('APP_SESSION');
select v('APP_SESSION') sess_id from dual;
begin
  -- p_session_id is optional parameter - with null same as detach    
  apex_util.set_workspace('SIOUG2018');
  apex_session.delete_session (p_session_id => v('APP_SESSION'));
  commit;
end;
/

select v('APP_ID') as app_id
     , v('APP_SESSION') as app_session
     , v('APP_USER') as app_user 
  --   , apex_mail.get_instance_url||apex_page.get_url as get_url
  from dual;
  
select * from apex_workspace_sessions where workspace_name = 'SIOUG2018' and apex_session_id = :APP_SESSION;

------------------------------------------------------------------------------------------------
-- 5) DETACH
exec apex_session.detach;

