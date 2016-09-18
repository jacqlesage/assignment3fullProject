trigger code stuff

<-- this creates a auto increamnet key -->
SQL> create sequence auto_business_sequence
  2  start with 1
  3  increment by 1;


<--trigger created-->
SQL> create or replace trigger business_trigger
  2  BEFORE INSERT
  3  ON business
  4  referencing new as NEW
  5  FOR EACH ROW
  6  BEGIN
  7  SELECT auto_business_sequence.nextval  INTO :NEW.business_ID FROM DUAL;
  8  end;
  9  /

<-- issue 1: Business TYPE_ID constraint should be not null also - ie like BUsiness-->


<--create a sequence for the asset table-->
SQL> create sequence auto_asset_sequence
  2  start with 1
  3  increment by 1;

<--Sequence created.-->
<--write trigger-->
SQL> create or replace trigger asset_trigger
  2  before insert
  3  on asset
  4  referencing new as NEW
  5  for each row
  6  begin
  7  SELECT auto_asset_sequence.nextval
  8  INTO :NEW.asset_ID FROM DUAL;
  9  end;
 10  /

<--Trigger created.-->



