/* to reset auot keys otherwise data cannot get inserted*/
drop sequence auto_industry_sequence;

/* this creates a auto increamnet key */
    create sequence auto_industry_sequence
    start with 1
    increment by 1;


/*trigger created*/
create or replace trigger industry_type_trigger
before insert
on industry
referencing new as NEW
for each row
begin
select auto_industry_sequence.nextval into :NEW.industry_id From dual;
end;
/
