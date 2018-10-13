--------------------------------
-- 1) CREATE SESSION
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
     , apex_page.get_url as get_url
  from dual;

-- Example 2: create collections
select * From apex_collections;
exec apex_collection.create_collection_from_query ('EMP', 'select * from emp', p_truncate_if_exists => 'YES');
select * From apex_collections;

exec apex_collection.update_member_attribute('EMP', p_seq => 1, p_attr_number => 1, p_attr_VALUE => 'KING THE GREATEST'); 

-- Example 3: use v function 
select v('P1_DEPTNO') from dual;

create or replace view v_emp as
  select * 
    from emp
   where deptno = v('P1_DEPTNO'); 
   
select * from v_emp;
call apex_util.set_session_state('P1_DEPTNO', '10'); -- you don't even need to create item

-- Example 4: Create protected URL outside APEX session
select apex_page.get_url(p_items => 'P1_DEPTNO', p_values => '10') url from dual;
-- use apex_page.get_url and don't use apex_util.prepare_url
select apex_util.prepare_url('f?p='||v('APP_ID')||':1:'||v('APP_SESSION')||'::::P10_DEPTNO:10') url from dual;

-- Example 5: Attach
begin
  apex_session.attach(p_app_id     => 114
                    , p_page_id    => 3
                    , p_session_id => :APP_SESSION);
end;
/

-- you need to reattach to view values after change because it's cached
select item_name, v(item_name) as val from apex_application_page_items where application_id = 114 and page_id = 3;

exec apex_util.set_session_state('P3_ITEM', 'Marko');

-- you can alse see collections
select * From apex_collections;

-- before APEX 18.1 you could do it with oos_utils

-- Example 6: Delete session
select * from apex_workspace_sessions where workspace_name = 'SIOUG2018' and apex_session_id = v('APP_SESSION');
select v('APP_SESSION') sess_id from dual;
begin
  -- p_session_id is optional paarmeter - with null same as detach    
  apex_util.set_workspace('SIOUG2018');
  apex_session.delete_session (p_session_id => v('APP_SESSION'));
  commit;
end;
/

select * from apex_workspace_sessions where workspace_name = 'SIOUG2018' and apex_session_id = 2982304402190;

-- Example 7: detach session
exec apex_session.detach;


--------------------------------
-- 2) Application Settings

-- set workspace and create session
-- exec apex_util.set_workspace('SIOUG2018'); not enough
call apex_session.create_session (p_app_id   => 114
                                , p_page_id  => 1
                                , p_username => 'DEMO'); 
                                


-- get value
select name, apex_app_setting.get_value(p_name => name)
  from apex_application_settings 
 where application_id = 114;

-- set value
begin
  apex_app_setting.set_value (
    p_name  => 'REPORT_SERVER'
   ,p_value => '10.11.12.13:9080/jasperserver/');
  commit; -- DON'T FORGET TO COMMIT   
end;
/


--------------------------------
-- APEX_ACL

-- dictionary views
select role_name, role_static_id, role_desc 
  from apex_appl_acl_roles;
select user_name, role_ids, role_names 
  from apex_appl_acl_users;
select *
  from apex_appl_acl_user_roles;
  
-- ADD_USER_ROLE 
begin
  apex_util.set_workspace('SIOUG2018');
  apex_acl.add_user_role (
	-- assigns a role to a user
     p_application_id => 114 -- default wwv_flow_security.g_flow_id
    ,p_user_name      => :USER
    ,p_role_static_id => 'NEW_ROLE'
  );
  commit;   
end;
/  

-- REMOVE_USER_ROLE
begin
  apex_util.set_workspace('SIOUG2018');
  apex_acl.remove_user_role (
	-- removes an assigned role from a user
    p_application_id => 114, -- default wwv_flow_security.g_flow_id,
    p_user_name      => i.user_name,
    p_role_static_id => 'NEW_ROLE');
    commit;  
end;
/

-- ADD_MULTIPLE_ROLES
begin
  apex_util.set_workspace('SIOUG2018');
  apex_acl.add_user_roles(
    -- assigns an array of roles to a user
    p_application_id  => 114,
    p_user_name       => :USER,
    p_role_static_ids => apex_string.split('READER:ADMINISTRATOR', ':')
  );
  commit;
end;
/
