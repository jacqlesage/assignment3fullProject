/* to reset auot keys otherwise data cannot get inserted*/
drop sequence auto_wkRole_sequence;

/* this creates a auto increamnet key */
    create sequence auto_wkRole_sequence
    start with 1
    increment by 1;


/*trigger created*/
create or replace trigger wkRole_type_trigger
before insert
on worker_role
referencing new as NEW
for each row
begin
select auto_wkRole_sequence.nextval into :NEW.role_id From dual;
end;
/
