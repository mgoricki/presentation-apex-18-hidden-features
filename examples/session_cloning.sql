-- before using it, you have to enable it with sys user or apex_administrator_roe user

-- grant apex_administrator_role to sioug2018;
begin
  apex_instance_admin.set_parameter(
    p_parameter => 'CLONE_SESSION_ENABLED',
    p_value     => 'Y');
end;
/

-- add request to the link APEX_CLONE_SESSION