-- Business Table

CREATE OR REPLACE TRIGGER bus1
AFTER INSERT OR DELETE ON Worker
FOR EACH ROW
    BEGIN
        IF INSERTING THEN
            UPDATE Business
            SET num_workers = num_workers + 1
            WHERE business_ID = :NEW.business_ID;
        ELSE -- deleting
            UPDATE Business
            SET num_workers = num_workers - 1
            WHERE business_ID = :OLD.business_ID;
        END IF;
    END;
/

-- Worker Table

CREATE OR REPLACE TRIGGER worker1
BEFORE INSERT OR UPDATE OF end_date ON worker
FOR EACH ROW
    DECLARE
    BEGIN
        IF :NEW.end_date is NULL THEN
			:NEW.is_active := 'y';
        ELSE
            :NEW.is_active := 'n';
        END IF;
    END;
/

-- asset Table


CREATE OR REPLACE TRIGGER asset1
AFTER INSERT ON Service_Log
FOR EACH ROW
    BEGIN   
        UPDATE asset
        SET number_services = number_services + 1
        WHERE asset_ID = :NEW.asset_ID;
    END;
/

-- asset Table


CREATE OR REPLACE TRIGGER asset2
BEFORE INSERT ON Service_Log
FOR EACH ROW
    BEGIN   
        UPDATE asset
        SET cur_condition = :NEW.condition + 1
        WHERE asset_ID = :NEW.asset_ID;
    END;
/

-- Service Log Table


CREATE OR REPLACE TRIGGER service_log1
BEFORE INSERT ON Service_Log
FOR EACH ROW
    BEGIN
        IF (:NEW.electrical_test_done = 'Y' OR :NEW.electrical_test_done = 'y') THEN
            :NEW.elec_test_due := ADD_MONTHS(:NEW.date_serviced, 3);
        END IF;
        
        IF (:NEW.calibration_done = 'Y' OR :NEW.calibration_done = 'y') THEN
            :NEW.calibration_due := ADD_MONTHS(:NEW.date_serviced, 3);
        END IF;
            
    END;
/

