-- install:
declare
  v_new_app_id number;
begin  
  apex_util.set_workspace('SIOUG2018');
  
  v_new_app_id := apex_pkg_app_install.install( 
    p_app_name            => 'Sample Database Application',
    p_authentication_type => apex_authentication.c_type_apex_accounts,
    p_schema              => 'SIOUG2018');
  dbms_output.put_line(v_new_app_id);  
end;
/

-- deinstall:
begin  
  apex_util.set_workspace('SIOUG2018');
  apex_pkg_app_install.deinstall(p_app_id => 8950);
end;
/

-- upgrade