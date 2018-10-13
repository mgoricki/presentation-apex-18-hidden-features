-- dictionary
select * from apex_mail_log order by mail_id desc;
select * from apex_mail_queue;
select * from apex_mail_attachments;

apex_mail

-- send procedure
declare
  v_placeholders clob;
begin
  
  apex_json.initialize_clob_output;
  apex_json.open_object;
  apex_json.write('EVENT_DATE', '15.10.2018');
  apex_json.write('EVENT_NAME', 'MakeIT 2018 New');
  apex_json.write('INVITEE', 'Marko Gorički');
  apex_json.write('ORGANIZER', 'SIOUG');
  apex_json.write('LOCATION', 'Portorož');
  apex_json.close_object;
  
  v_placeholders := apex_json.get_clob_output;
  apex_json.free_output;  

  apex_mail.send (
      p_template_static_id => 'TEST'
    , p_placeholders       => v_placeholders
    , p_to                 => 'marko.goricki@bilog.hr'
    , p_cc                 => null
    , p_bcc                => null
    , p_from               => 'mgoricki8@gmail.com'
    , p_replyto            => null
    , p_application_id     => 114--   default wwv_flow_security.g_flow_id 
    );
  apex_mail.push_queue;
end;
/

-- prepare_template
declare
  v_subject varchar2(200);
  v_html    clob;
  v_text    clob;
  v_placeholders clob;
begin
  
  apex_json.initialize_clob_output;
  apex_json.open_object;
  apex_json.write('EVENT_DATE', '15.10.2018');
  apex_json.write('EVENT_NAME', 'MakeIT 2018');
  apex_json.write('INVITEE', 'Marko Gorički');
  apex_json.write('ORGANIZER', 'SIOUG');
  apex_json.write('LOCATION', 'Portorož');
  apex_json.close_object;
  
  v_placeholders := apex_json.get_clob_output;
  apex_json.free_output;
  
  apex_mail.prepare_template (
      p_static_id          => 'TEST'
    , p_placeholders       => v_placeholders--'{"DATUM":"","IME":"Marko", "PREZIME":"Gorički"}'
    , p_application_id     => 114
    , p_subject            => v_subject
    , p_html               => v_html
    , p_text               => v_text);
  
  dbms_output.put_line('Subject: '||v_subject);  
  dbms_output.put_line('HTML: '||v_html);
  dbms_output.put_line('Text: '||v_text);  
end;
/