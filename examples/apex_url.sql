--alter system flush shared_pool;
select fetches, executions, sql_text From v$sqlarea where sql_Text like '%apex_url%' and sql_text not like '%v$sqlarea%';
select count(1) From v$sqlarea where sql_Text like '%apex_url_good%' and sql_text not like '%v$sqlarea%';
select count(1) From v$sqlarea where sql_Text like '%apex_url_bad%' and sql_text not like '%v$sqlarea%';

