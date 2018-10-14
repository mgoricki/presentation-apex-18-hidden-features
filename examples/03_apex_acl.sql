--dictionary views:
-- all roles
select role_name, role_static_id, role_desc 
  from apex_appl_acl_roles 
 where workspace = 'SIOUG2018' 
   and application_id = 114;

-- users
select user_name, role_ids, role_names
  from apex_appl_acl_users x
 where workspace = 'SIOUG2018' 
   and application_id = 114;
   
-- users and roles   
select user_name, role_id, role_name, role_static_id, role_desc 
  from apex_appl_acl_user_roles 
 where workspace = 'SIOUG2018'  
   and application_id = 114 
 order by 1;

-----------------------------
-- ADD_USER_ROLE 
-- adds user role to the user
begin
  apex_util.set_workspace('SIOUG2018');
  apex_acl.add_user_role (
     p_application_id => 114 -- default wwv_flow_security.g_flow_id
    ,p_user_name      => 'DEMO'
    ,p_role_static_id => 'CONTRIBUTOR'
  );
  commit;   
end;
/

-----------------------------
-- REMOVE_USER_ROLE
-- removes user role from the user
begin 
  apex_util.set_workspace('SIOUG2018');
  apex_acl.remove_user_role (
	-- removes an assigned role from a user
    p_application_id => 114, -- default wwv_flow_security.g_flow_id,
    p_user_name      => 'DEMO',
    p_role_static_id => 'CONTRIBUTOR');
    commit;  
end;
/

-----------------------------
-- ADD_USER_ROLES
-- assigns an array of roles to a user
begin
  apex_util.set_workspace('SIOUG2018');
  apex_acl.add_user_roles(
    p_application_id  => 114,
    p_user_name       => 'DEMO',
    p_role_static_ids => apex_t_varchar2('READER', 'ADMINISTRATOR')
  );
  commit;
end;
/

-----------------------------
-- REPLACE_USER_ROLES
-- replaces any existing assigned roles to new array of roles
begin
  apex_util.set_workspace('SIOUG2018');
  apex_acl.replace_user_roles (
    p_application_id  => 114, -- default wwv_flow_security.g_flow_id,
    p_user_name       => 'DEMO',
    p_role_static_ids => apex_string.split('ADMINISTRATOR:CONTRIBUTOR', ':')
    );
end;
/


-----------------------------
-- REMOVE_ALL_USER_ROLES 
-- add_user_roles (array of roles), replace_user_roles (remove and add array of roles)
begin
  -- NOTE: no error if workspace is not set
  apex_util.set_workspace('SIOUG2018');
  apex_acl.remove_all_user_roles(
    -- removes all assigned roles from a user
    p_application_id => '114', --default wwv_flow_security.g_flow_id,
    p_user_name      => 'DEMO');
  commit;  
end;
/


-----------------------------
-- USER_HAS_ROLE
-- %usage: checks if user has role
begin
  apex_util.set_workspace('SIOUG2018');
  if apex_acl.has_user_role(p_application_id => 114
                          , p_user_name      => 'DEMO'
                          , p_role_static_id =>  'READER') then
    dbms_output.put_line('OK');
  else
    dbms_output.put_line('NOT OK');  
  end if;
end;
/

-----------------------------
-- HAS_USER_ANY_ROLES
-- %usage:  checks if user has any role
begin
  apex_util.set_workspace('SIOUG2018');
  if apex_acl.has_user_any_roles (p_application_id => 114
                                , p_user_name      => 'TEST2') then
    dbms_output.put_line('OK');
  else
    dbms_output.put_line('NOT OK');  
  end if;  
end;
/