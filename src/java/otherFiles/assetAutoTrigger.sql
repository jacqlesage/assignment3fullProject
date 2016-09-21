/* to reset auot keys otherwise data cannot get inserted*/
drop sequence asset_sequence;

/* this creates a asset increamnet key */
    create sequence asset_sequence
    start with 1
    increment by 1;


/*trigger created*/
create or replace trigger asset_trigger
before insert
on asset
referencing new as NEW
for each row
begin
select asset_sequence.nextval into :NEW.asset_ID From dual;
end;
/
