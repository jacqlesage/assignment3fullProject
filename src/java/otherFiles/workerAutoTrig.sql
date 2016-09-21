/* to reset auot keys otherwise data cannot get inserted*/
drop sequence worker_sequence;

/* this creates a auto increamnet key */
    create sequence worker_sequence
    start with 1
    increment by 1;


/*trigger created*/
create or replace trigger worker_trigger
before insert
on worker
referencing new as NEW
for each row
begin
select worker_sequence.nextval into :NEW.worker_ID From dual;
end;
/
