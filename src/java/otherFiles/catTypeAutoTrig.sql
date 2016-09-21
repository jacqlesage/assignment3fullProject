/* to reset auot keys otherwise data cannot get inserted*/
drop sequence auto_cat_sequence;

/* this creates a auto increamnet key */
    create sequence auto_cat_sequence
    start with 1
    increment by 1;


/*trigger created*/
create or replace trigger cat_type_trigger
before insert
on category
referencing new as NEW
for each row
begin
select auto_cat_sequence.nextval into :NEW.category_id From dual;
end;
/
