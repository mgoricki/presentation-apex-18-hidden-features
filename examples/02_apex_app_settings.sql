-- set workspace - not enough
exec apex_util.set_workspace('SIOUG2018');

-- create session - needed if used outside APEX session
begin 
  apex_util.set_workspace('SIOUG2018');
  apex_session.create_session(114,1,'DEMO');
end;
/


----------------------------
-- GET_VALUE
-- %usage: gets the application setting value in the current application
select name, apex_app_setting.get_value(p_name => name)
  from apex_application_settings 
 where application_id = 114;
 
 

----------------------------
-- SET_VALUE
-- %usage: changes the application setting value in the current application
begin
  apex_util.set_workspace('SIOUG2018');
  apex_session.create_session (114, 1, 'DEMO');  
  apex_app_setting.set_value (
    p_name  => 'REPORT_SERVER'
   ,p_value => 'localhost/jasperserver'); 
  commit;  
end;
/
