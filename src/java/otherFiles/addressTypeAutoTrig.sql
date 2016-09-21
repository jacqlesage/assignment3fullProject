/* to reset auot keys otherwise data cannot get inserted*/
drop sequence auto_business_type_sequence;

/* this creates a auto increamnet key */
    create sequence auto_business_type_sequence
    start with 1
    increment by 1;


/*trigger created*/
create or replace trigger business_type_trigger
before insert
on business_type
referencing new as NEW
for each row
begin
select auto_business_type_sequence.nextval into :NEW.type_ID From dual;
end;
/
