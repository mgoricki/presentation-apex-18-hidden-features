class: center, middle
# APEX 18.1 "hidden" features

**Marko Gorički**

<i class="fab fa-twitter"></i>  [@mgoricki](https://twitter.com/mgoricki)

<i class="fas fa-at"></i> mgoricki8@gmail.com

<i class="fab fa-github"></i>  [https://github.com/mgoricki/](https://github.com/mgoricki/)

<i class="fab fa-blogger"></i> APEX related blog - [apexbyg.blogspot.com](http://apexbyg.blogspot.com)


---

class: center, middle
count: false
# APEX <span class="red">~~18.1~~</span> "hidden" features

**Marko Gorički**

<i class="fab fa-twitter"></i>  [@mgoricki](https://twitter.com/mgoricki)

<i class="fas fa-at"></i> mgoricki8@gmail.com

<i class="fab fa-github"></i>  [https://github.com/mgoricki/](https://github.com/mgoricki/)

<i class="fab fa-blogger"></i> APEX related blog - [apexbyg.blogspot.com](http://apexbyg.blogspot.com)

---

class: center, middle
count: false
# APEX <span class="red">~~18.1~~</span> <span class="red">~~"hidden"~~</span> features

**Marko Gorički**

<i class="fab fa-twitter"></i>  [@mgoricki](https://twitter.com/mgoricki)

<i class="fas fa-at"></i> mgoricki8@gmail.com

<i class="fab fa-github"></i>  [https://github.com/mgoricki/](https://github.com/mgoricki/)

<i class="fab fa-blogger"></i> APEX related blog - [apexbyg.blogspot.com](http://apexbyg.blogspot.com)

---

class: center, middle
count: false
# APEX <span class="red">~~18.1~~</span> <span class="red">~~"hidden"~~</span> <span class="red">~~features~~</span>

**Marko Gorički**

<i class="fab fa-twitter"></i>  [@mgoricki](https://twitter.com/mgoricki)

<i class="fas fa-at"></i> mgoricki8@gmail.com

<i class="fab fa-github"></i>  [https://github.com/mgoricki/](https://github.com/mgoricki/)

<i class="fab fa-blogger"></i> APEX related blog - [apexbyg.blogspot.com](http://apexbyg.blogspot.com)

---

class: center, middle
count: false
# APEX APIs

**Marko Gorički**

<i class="fab fa-twitter"></i>  [@mgoricki](https://twitter.com/mgoricki)

<i class="fas fa-at"></i> mgoricki8@gmail.com

<i class="fab fa-github"></i>  [https://github.com/mgoricki/](https://github.com/mgoricki/)

<i class="fab fa-blogger"></i> APEX related blog - [apexbyg.blogspot.com](http://apexbyg.blogspot.com)

---

class: center, middle
count: false
# APEX PL/SQL APIs

**Marko Gorički**

<i class="fab fa-twitter"></i>  [@mgoricki](https://twitter.com/mgoricki)

<i class="fas fa-at"></i> mgoricki8@gmail.com

<i class="fab fa-github"></i>  [https://github.com/mgoricki/](https://github.com/mgoricki/)

<i class="fab fa-blogger"></i> APEX related blog - [apexbyg.blogspot.com](http://apexbyg.blogspot.com)


---

# About Me

- Software Consultant @ BiLog (Croatia)
- More than 10 years of experience with APEX
- Presenter at HROUG, SIOUG, APEX World, KSCOPE, APEX Alpe Adria ([https://www.aaapeks.info](https://www.aaapeks.info)), <br>APEX Connect
- [apex.world](http://apex.world) Member of the year 2017 (and month November 2017)
- <i class="fab fa-blogger"></i> APEX related blog - [apexbyg.blogspot.com](http://apexbyg.blogspot.com)
- <i class="fab fa-github"></i>  [https://github.com/mgoricki/](https://github.com/mgoricki/)
- <i class="fab fa-twitter"></i>  [@mgoricki](https://twitter.com/mgoricki)
- <i class="fas fa-at"></i> mgoricki8@gmail.com

.myPhoto[![Marko Gorički](./img/slika.jpg)]
---

# BiLog

- Software development company focused on consulting and business solution development
- Technology focus Oracle (APEX)
- Forms > APEX migrations, APEX educations, consulting, plugin development 
- Our APEX solutions:
  - HR management software
  - Regulatory reporting for insurance
  - Reinsurance
  - GDPR

.bilogWeb[![BiLog Web](./img/bilogWeb.png)]  

---

# Agenda

- New APEX 18.* PL/SQL APIs and features:
  - Session
  - Application Settings
  - ACL
  - Export
  - Mail templates
  - Dynamically Set Parsing Schema
- APEX 5.* APIs and features 
  - Session Cloning
  - APEX URL
  - APEX String
- Other APIs  


---

class: center, middle

#  Why to use APIs?

---
exclude: true

#  Why to use APIs?

- Example 1:

```javascript
/* not OK: */
$('#P11_ITEM1,label[for=P11_ITEM1]').hide();

/* OK: */
apex.item('P11_ITEM1').hide();
```

- Example 2:

```javascript
/* not OK: */
/* not OK: */
$('#P11_ITEM2').val();

/* OK: */
apex.item('P11_ITEM2').getValue();
```
- [Demo](http://localhost:8080/ords/f?p=114:11)

???

- example with select list > popup LOV

---

# Where to start?

- APEX documentation
  - [apex.oracle.com/doc182](https://apex.oracle.com/doc182)
  - [Release Notes](https://docs.oracle.com/database/apex-18.1/HTMRN/toc.htm#HTMRN-GUID-540B73CB-08A7-4422-B6BF-CC785EC47694) / New Features
  - [Changes in this release](https://docs.oracle.com/database/apex-18.2/AEAPI/changes-in-this-release.htm#AEAPI29121)  
  - Sample Applications
- <i class="fab fa-twitter"></i> [#orclapex](https://twitter.com/hashtag/orclapex?src=tren)
- <i class="fab fa-blogger"></i> Blogs
- [https://github.com/Dani3lSun/awesome-orclapex](https://github.com/Dani3lSun/awesome-orclapex)
- [apex.oracle.com/shortcuts](https://apex.oracle.com/shortcuts)



---

# APEX_SESSION package

- **set_debug** and **set_trace** available from 5.1
- New in 18.1:
  - **create_session**
  - **attach**
  - **delete_session**
  - **detach**

## SET_DEBUG

- sets debug level for all future requests in a session.
- 7 levels ([constants](https://docs.oracle.com/database/apex-18.1/AEAPI/Constants-2.htm#AEAPI29184)):
  - 1 - error
  - 2 - warning
  - 4 - info (default) - same as YES
  - 5 - app_enter
  - 6 - app_trace
  - 8 - engine_enter 
  - 9 - engine_trace

```sql
begin
  apex_session.set_debug (
       p_session_id => :APP_SESSION,
       p_level      => apex_debug.c_log_level_info);
  commit; -- DON'T FORGET TO COMMIT!!!!       
end;
/   
```

## SET_TRACE

- sets trace mode in all future requests of a session

```sql
begin
  apex_session.set_trace (
       p_session_id => :APP_SESSION,
       p_level      => 'SQL');
  commit; -- DON'T FORGET TO COMMIT!!!!       
end;
/   
```

```sql
-- active sessions view
select *
  from apex_workspace_sessions 
 where workspace_name = :WORKSPACE 
   and user_name = nvl(:USER, user_name);

-- activity log view
select * 
  from apex_activity_log 
 where session_id = :APP_SESSION 
 order by time_stamp desc;   

-- debug messages view
select * 
  from apex_debug_messages 
 where application_id = 114 
   and session_id = :APP_SESSION;
```

## Create Session

- creates a new session for the given application, sets environment and runs **the Initialization PL/SQL Code**.

```sql
begin
  apex_util.set_workspace(:WORKSPACE_NAME);
  apex_session.create_session (p_app_id   => 114
                             , p_page_id  => 1
                             , p_username => 'DEMO');
end;
/

-- test variables
select v('APP_ID') as app_id
     , v('APP_SESSION') as app_session
     , v('APP_USER') as app_user 
     , apex_page.get_url as get_url
  from dual;    
```

## Attach Session

- sets environment and runs the **Initialization PL/SQL Code**

```sql
begin
  apex_session.attach(p_app_id     => 114
                    , p_page_id    => 3
                    , p_session_id => :APP_SESSION);
end;
/
```

## Delete/Detach Session
- calls application's **Cleanup PL/SQL Code** and reset the environment
- apex_session.detach - same as delete session but no parameter

```sql
begin
  -- p_session_id is optional paarmeter - with null same as detach  
  apex_session.delete_session (p_session_id => :APP_SESSION);
end;
/
```

## Links
- [Documentation 18.2](https://docs.oracle.com/database/apex-18.2/AEAPI/APEX_SESSION.htm)
- before APEX 18.1 you could use OraOpenSource's [OOS Utils](https://oos-utils.readthedocs.io/en/latest/oos_util_apex/)

---

# Application Settings

- No more need for simple key-value configuration tables
- Key feature: **On Upgrade Keep Value**
- **API package**: apex_app_settings (get_value/set_value)
- **dictionary view**: apex_application_settings

## GET_VALUE

-  gets the application setting value

```sql
-- before use, not enough to just set workspace (security_group_id)
exec apex_util.set_workspace(:WORKSPACE);

-- you need to create or attach to session if used outside APEX session
begin 
  apex_session.create_session (p_app_id   => 114
                             , p_page_id  => 1
                             , p_username => :USER);  
end;
/         

-- get_value example
select name
     , apex_app_setting.get_value(p_name => name) as val
     , on_upgrade_keep_value
  from apex_application_settings 
 where application_id = 114;
```

## SET_VALUE

- changes the application setting value
- also needs APEX session

```sql
begin
  apex_app_setting.set_value (
    p_name  => 'REPORT_SERVER'
   ,p_value => '10.11.12.13:9080/jasperserver/');
  commit; -- DON'T FORGET TO COMMIT   
end;
/
```

## Links
- [Documentation 18.2](https://docs.oracle.com/database/apex-18.1/AEAPI/APEX_APP_SETTING.htm)

---

# Application Access Control (ACL)

- Developers define roles and assign users to roles
- Control access to pages and components with Authorization Schemes
- **dictionary views**:
  - apex_appl_acl_roles
  - apex_appl_acl_users
  - apex_appl_acl_user_roles
- **API package**: apex_acl  
  - add_user_role 
  - add_user_roles
  - remove_user_role
  - remove_all_user_roles
  - replace_user_roles
  - has_user_role
  - has_user_any_roles
- can create administration page through features (also new feature)
- procedures are overloaded - you can use role_id or role_static_id

## ADD_USER_ROLE

- adds role to the user

```sql 
begin
  apex_util.set_workspace(:WORKSPACE);
  apex_acl.add_user_role (
	-- assigns a role to a user
     p_application_id => 114 -- default wwv_flow_security.g_flow_id
    ,p_user_name      => :USER
    ,p_role_static_id => 'READER' -- other proc with p_role_id
  );
  commit;   
end;
/
```

## REMOVE_USER_ROLE

- removes an assigned role from a user

```sql
begin
  apex_util.set_workspace(:WORKSPACE);
  apex_acl.remove_user_role (
    p_application_id => 114, -- default wwv_flow_security.g_flow_id,
    p_user_name      => :USER,
    p_role_static_id => 'READER'
    );
    commit;  
end;
/
```

## ADD_USER_ROLES 

- adds multiple roles to the user

```sql
begin
  apex_util.set_workspace(:WORKSPACE);
  apex_acl.add_user_roles(
	-- assigns an array of roles to a user
    p_application_id  => 114,
    p_user_name       => :USER,
    p_role_static_ids => apex_t_varchar2('READER', 'ADMINISTRATOR')
  );
  commit;
end;
/
```


## REPLACE_USER_ROLES

- replaces any existing assigned roles to new array of roles

```sql
begin
  apex_util.set_workspace(:WORKSPACE);
  apex_acl.replace_user_roles (
    p_application_id  => 114, -- default wwv_flow_security.g_flow_id,
    p_user_name       => :USER,
    p_role_static_ids => apex_string.split('ADMINISTRATOR:CONTRIBUTOR', ':'));
end;
/
```

## REMOVE_ALL_USER_ROLES

- removes all assigned roles from a user

```sql
begin
  apex_util.set_workspace(:WORKSPACE);
  apex_acl.remove_all_user_roles(
    p_application_id => '114', --default wwv_flow_security.g_flow_id,
    p_user_name      => :USER);
  commit;  
end;
/
```

## USER_HAS_ROLE

- checks if user has specific role

```sql
begin
  apex_util.set_workspace(:WORKSPACE);
  if apex_acl.has_user_role(p_application_id => :APP_ID
                          , p_user_name      => :USER
                          , p_role_static_id => 'READER') then
    dbms_output.put_line('OK');
  else
    dbms_output.put_line('NOT OK');  
  end if;
end;
/
```

## HAS_USER_ANY_ROLES

- checks if user has any role

```sql
begin
  apex_util.set_workspace('SIOUG2018');
  if apex_acl.has_user_any_roles (p_application_id => :APP_ID
                                , p_user_name      => :USER) then
    dbms_output.put_line('OK');
  else
    dbms_output.put_line('NOT OK');  
  end if;  
end;
/
```

## Links
- [Documentation 18.2](https://docs.oracle.com/database/apex-18.2/AEAPI/APEX_ACL.htm)

---

# APEX Export

- can be done in APEX Builder, with Java Utility or SQLcl
- can export the app definitions, files, feedback, and workspaces to text files as CLOBs
- available from APEX 5.1 (but not documented)
- uses utility types APEX_T_EXPORT_FILE and APEX_T_EXPORT_FILES

```sql
-- APEX_T_EXPORT_FILE
create or replace type wwv_flow_t_export_file force is object (
    name     varchar2(255),
    contents clob
)

-- APEX_T_EXPORT_FILES
create or replace type wwv_flow_t_export_files is table of wwv_flow_t_export_file
```

## GET_APPLICATION

- Definition:

```sql
function get_application (
    p_application_id          in number,
    p_split                   in boolean  default false,
    p_with_date               in boolean  default false,
    p_with_ir_public_reports  in boolean  default false,
    p_with_ir_private_reports in boolean  default false,
    p_with_ir_notifications   in boolean  default false,
    p_with_translations       in boolean  default false,
    p_with_pkg_app_mapping    in boolean  default false,
    p_with_original_ids       in boolean  default false,
    p_with_no_subscriptions   in boolean  default false,
    p_with_comments           in boolean  default false,
    p_with_supporting_objects in varchar2 default null,
    p_with_acl_assignments    in boolean  default false -- you can export ACL assignments
    )
    return wwv_flow_t_export_files;
```

- Example:

```sql
-- get application
declare
  v_apex_export_files apex_t_export_files;
begin  
  v_apex_export_files := apex_export.get_application(:APP_ID
                                                   -- , p_with_acl_assignments => true  
                                                    );
  dbms_output.put_line(v_apex_export_files(1).name);
  dbms_output.put_line(length(v_apex_export_files(1).contents)); 
end;
/
```


## Split Application
```sql
declare
  v_apex_export_files apex_t_export_files; -- table of apex_t_export_file
  v_app_exp_file      blob;
begin
  v_apex_export_files := apex_export.get_application(:APP_ID
                                                   , p_split => true
                                                   );
  for i in v_apex_export_files.first..v_apex_export_files.last
  loop
    dbms_output.put_line(v_apex_export_files(i).name);
  end loop;
end;
/
```

## Other Functions
- **get_feedback** -  exports user feedback 

```sql
function get_feedback (
    p_workspace_id      in number,
    p_with_date         in boolean  default false,
    p_since             in date     default null,
    p_deployment_system in varchar2 default null )
    return wwv_flow_t_export_files;
```

- **get_workspace** - exports the given workspace's definition and users

```sql
function get_workspace (
    p_workspace_id          in number,
    p_with_date             in boolean default false,
    p_with_team_development in boolean default false,
    p_with_misc             in boolean default false -- include data from SQL Workshop, mail logs, etc. in the export.
    )
    return wwv_flow_t_export_files;
```

- **get_workspace_files** - exports the given workspace's static files

```sql
function get_workspace_files (
    p_workspace_id in number,
    p_with_date    in boolean default false )
    return wwv_flow_t_export_files;
```

## Links

- [Demo](http://localhost:8080/ords/f?p=114:16)
- [Documentation](https://docs.oracle.com/database/apex-18.2/AEAPI/APEX_EXPORT.htm)




---

# APEX Mail Templates

- new feature in APEX 18.1 (Shared Components > Email Templates)
- API package: apex_mail - (2 new procedures and one function):
  - send (procedure and function)
  - prepare_template procedure

- **dictionary views**
  - apex_mail_log
  - apex_mail_queue
  - apex_mail_attachments

## SEND procedure

- new template_static_id parameter

```sql
declare
  v_placeholders clob;
begin
  apex_util.set_workspace('SIOUG2018');
  apex_json.initialize_clob_output;
  apex_json.open_object;

  apex_json.write('EVENT_NAME'     , 'MakeIT 2018');
  apex_json.write('EVENT_DATE'     , '15.10.2018.');
  apex_json.write('EVENT_LINK'     , 'www.makeIT.si');
  apex_json.write('DURATION'       , '2 days');
  apex_json.write('INVITEE'        , 'Marko Gorički');
  apex_json.write('ORGANIZER'      , 'SIOUG');
  apex_json.write('LOCATION'       , 'Portorož');
  apex_json.write('MY_APPLICATION_LINK', 'www.makeIT.si');
  apex_json.write('NOTES'         , 'n/a');
  apex_json.write('URL_LINK'      , 'n/a');
  apex_json.write('URL_NAME'      , 'n/a');
  apex_json.write('START_TIME'    , '15.10.2018.');
  
  apex_json.close_object;
  v_placeholders := apex_json.get_clob_output;
  apex_json.free_output;  
  
  apex_mail.send (
      p_template_static_id => 'EVENT'
    , p_placeholders       => v_placeholders
    , p_to                 => 'marko.goricki@bilog.hr'
    );
  apex_mail.push_queue;
end;
/
```

- [Demo on apex.oracle.com](https://apex.oracle.com/pls/apex/f?p=93889:2)


## SEND function

- same as send functions but returns mail_id (used for adding atachements)

## PREPARE_TEMPLATE procedure

- returns a formatted mail based on an e-mail template where the placeholders specified as json string are substituted

```sql
procedure prepare_template (
    p_static_id       in  varchar2,
    p_placeholders    in  clob,
    p_application_id  in  number default wwv_flow_security.g_flow_id,
    p_subject         out varchar2,
    p_html            out clob,
    p_text            out clob);
```

## Links

- [Documentation](https://docs.oracle.com/database/apex-18.2/AEAPI/APEX_MAIL.htm)


---


# Dynamically Set Parsing Schema
- change the parsing user for the current page view to another workspace schema
- can only call it from Initialization PL/SQL Code

```sql
begin
  apex_util.set_parsing_schema_for_request (
    p_schema => :SCHEMA
  );
end;
/  
```

## Example

```sql
if :APP_PAGE_ID between 1 and 100 then
    apex_util.set_parsing_schema_for_request (
       p_schema => :G_PARSING_SCHEMA );
end if;
```

## Links

- [Demo](http://localhost:8080/ords/f?p=114:14)
- [Documentation](https://docs.oracle.com/database/apex-18.1/AEAPI/SET_PARSING_SCHEMA_FOR_REQUEST-Procedure.htm)

???

Multi-tenancy is an architecture in which a single instance of a software application serves multiple customers. Each customer is called a tenant. Tenants may be given the ability to customize some parts of the application, such as color of the user interface (UI) or business rules, but they cannot customize the application's code.  

---

# Session Cloning

- before using it, you have to enable it with **sys** user or **apex_administrator_role** user:

```sql
grant apex_administrator_role to sioug2018;
```

```sql
begin
  apex_instance_admin.set_parameter(
    p_parameter => 'CLONE_SESSION_ENABLED',
    p_value     => 'Y');
end;
/
```
- to use it add request to the link APEX_CLONE_SESSION:
    - .../f?p=114:10:15609087012832:**APEX_CLONE_SESSION**:::

## Links

- [Demo](http://localhost:8080/ords/f?p=114:14:0)

---

# APEX URL

- bad way - DB needs to hard parse query for each SQL statement

```sql
  select 'f?p=&APP_ID.:17:&APP_SESSION.:::P17_ITEM:1' as my_url
       , apex_util.prepare_url('f?p=&APP_ID.:17:&APP_SESSION.:::P17_ITEM:1') as my_url_with_cs
    from some_table;
```

- better - not so readable and developer can easily make errors
```sql
  select 'f?p=&APP_ID.:17:'||:APP_SESSION||':::P17_ITEM:1' as my_url
        , apex_util.prepare_url('f?p=&APP_ID.:17:'||:APP_SESSION||':::P17_ITEM:1') as my_url_with_cs
    from some_table;
```

- good way - readable, creates checksum if needed

```sql
  select apex_page.get_url(p_page => '17'
                         , p_items => 'P17_ITEM'
                         , p_values => '1') as my_url
    from some_table;
```

 - other parameters

```sql
-- PARAMETERS
-- * p_application        application id or alias. defaults to the current application.
-- * p_page               page id or alias. defaults to the current page.
-- * p_session            session id. defaults to the current session id.
-- * p_request            URL request parameter.
-- * p_debug              URL debug parameter. defaults to the current debug mode.
-- * p_clear_cache        URL clear cache parameter.
-- * p_items              comma delimited list of item names to set session state.
-- * p_values             comma separated list of item values to set session state.
-- * p_printer_friendly   URL printer friendly parameter. defaults tot he current request's printer friendly mode.
-- * p_trace              SQL trace parameter.
```

---

# Strings (APEX_STRING)

- new in 5.1
- utilities for varchar2, clob, apex_t_varchar2, and apex_t_number types

## JOIN and SPLIT
 - apex_util.string_to_table and apex_util.table_to_string are [DEPRECATED](https://docs.oracle.com/database/apex-18.2/AEAPI/STRING_TO_TABLE-Function.htm)
 - **SPLIT**:

```sql
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
```

```sql
-- apex_string
select * from apex_string.split('One:Two:Three', ':');
-- doesn't work: select * from APEX_UTIL.STRING_TO_TABLE('One:Two:Three');
```

 - **JOIN**:

```sql
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
```

```sql
declare
  v_arr apex_t_varchar2;
begin
  select ename
    bulk collect into v_arr
    from emp;
  
  dbms_output.put_line(apex_string.join(v_arr, ':'));
end;
/
```
## Key value tables - PUT/GET/DELETE

```sql
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
```

## FORMAT
- returns a formatted string, with substitutions applied.

```sql
select apex_string.format('Hi %s! Hope to see you at the party. It starts at %s.'
     , 'Marko'
     , '18:30') m
  from dual;
```

```sql
-- with %0 %1 - starts with zero
select apex_string.format('Hi %1! Hope to see you at the party. It starts at %0.'
    , '18:30'
    , 'Marko'
    , p_max_length => 10) m
  from dual; 
```
## SHUFFLE
- Returns the input table values, re-ordered..

```sql
select * 
  from apex_string.shuffle(apex_t_varchar2('One','Two','Three'));
```

## Parsing CSV data
- output CSV from a table (in SQL Developer or SQLcl):

```sql
select /*csv*/ * from emp;
```
- parse CSV:

```sql
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
  from apex_string.split(:CSVDATA, chr(10)); -- chr(10) or chr(10)||chr(13)  
```

## APEX_UTIL.GET_HASH
- computes a hash value for all given values
- can be used to implement lost update detection for data records
- p_salted - if true (the default), salt hash with internal session info

```sql
select apex_util.get_hash(
          p_values => apex_t_varchar2 (empno, sal, comm),
          p_salted => true
        ) x
  from emp;
```

## Links

- [Documentation](https://docs.oracle.com/database/apex-18.2/AEAPI/APEX_STRING.htm)


---

# Other APIs
  - New in 18.1
    - **APEX_PKG_APP_INSTALL** - utilities you can use to manage Packaged Applications.
    - **APEX_JWT** - utilities for JSON Web Tokens (JWT)
    - **APEX_EXEC** - contains procedures and functions to execute queries or procedural calls on local and remote data sources as well as web source modules
    - **APEX_CREDENTIAL** (new in 18.2) - package to change stored credentials either persistently or for the current APEX session only

  - Useful from previous versions:
    - **APEX_ZIP** - compress and to uncompress files and store them in a ZIP file
    - **APEX_JSON** - utilities to parse and generate JSON
    - **APEX_WEB_SERVICE** - utilities to invoke WS

  - Non APEX APIs
    - https://github.com/mortenbra/alexandria-plsql-utils
    - OraOpenSource https://oos-utils.readthedocs.io/en/latest/README/      

---
class: center, middle

# Questions?

---
class: center, middle

# http://bit.do/apex-hidden-features
.qrcode[![qrcode](./img/qrcode.png)]

---
class: center, middle

# Thank You!



???