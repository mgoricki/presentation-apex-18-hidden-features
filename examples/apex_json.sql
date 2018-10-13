declare
  v_json apex_json.t_values;
  v_tab  apex_t_varchar2;
begin
  apex_json.parse(v_json, '{ "foo": ["one", "two"], "bar": "three" }');
  v_tab := apex_json.get_t_varchar2(p_values => v_json
                                  , p_path => 'foo');
  for i in (select *
              from table(v_tab)
            )
  loop
    dbms_output.put_line(i.column_value);
  end loop;
end;
/