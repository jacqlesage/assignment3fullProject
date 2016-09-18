DROP TABLE included_in;
DROP TABLE model_manufacturer;
DROP TABLE docs_attached;
DROP TABLE service_log;
DROP TABLE asset;
DROP TABLE worker;
DROP TABLE worker_role;
DROP TABLE category;
DROP TABLE industry;
DROP TABLE address;
DROP TABLE business;
DROP TABLE business_type;
DROP TABLE postcode_city;

/* postcode_city */


CREATE TABLE postcode_city
(
postcode varchar2(10) NOT NULL,
city varchar(255) NOT NULL,
PRIMARY KEY(postcode)
);

INSERT INTO postcode_city VALUES
(
'9010',
'Dunedin'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9011',
'Pine hill'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9012',
'NEV'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9013',
'CBD'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9014',
'The Bay'
);

COMMIT;

/* business_type */



CREATE TABLE business_type(
       type_id int PRIMARY KEY NOT NULL,
       type_description varchar2(255)
);

INSERT INTO business_type VALUES(
'0',
'Asset Holder'
);
INSERT INTO business_type VALUES(
'1',
'Asset Holder 1'
);
INSERT INTO business_type VALUES(
'2',const REFERENCES business_type(type_id)
'Asset Holder 2'
);
INSERT INTO business_type VALUES(
'3',
'Asset Holder 3'
);
INSERT INTO business_type VALUES(
'4',
'Asset Holder 4'
);

COMMIT;

/* business */  stmt.setInt(9, indID);



CREATE TABLE business(
business_ID int PRIMARY KEY NOT NULL,
name varchar2(255) NOT NULL,
contact_number varchar2(255) NOT NULL,
num_workers int,
type_id int
CONSTRAINT type_id_const REFERENCES business_type(type_id)
);

INSERT INTO business VALUES(
0,
'Peace LTD',
'03 345 678',
100,
0
);
INSERT INTO business VALUES(
1,
'War LTD',
'03 345 679',
100,
1
);
INSERT INTO business VALUES(
2,
'Love LTD',
'03 345 680',
100,
2
);
INSERT INTO business VALUES(  stmt.setInt(9, indID);
3,
'Hate LTD',
'03 345 681',
100,
3
);
INSERT INTO business VALUES(
4,
'Space LTD',
'03 345 682',
100,
4
);

COMMIT;

/* address  */



CREATE TABLE address(
street_No varchar2(255) NOT NULL,
street_Name varchar2(255) NOT NULL,
suburb varchar2(255) NOT NULL,
postcode varchar2(255) NOT NULL,
business_ID int NOT NULL
CONSTRAINT bus_ID_cnst REFERENCES business(business_ID) DISABLE,
PRIMARY KEY(street_No, street_Name, suburb, postcode)
);

INSERT INTO address VALUES(
'1',
'Hello Street',
'World Suburb',
'111',
'0'
);
INSERT INTO address VALUES(
'1',
'Hello Ave',
'World Suburb',
'111',
'1'
);
INSERT INTO address VALUES(
'1',
'Hello Place',
'World Suburb',
'111',
'2'
);
INSERT INTO address VALUES(
'1',
'Hell Street',
'World Suburb',
'111',
'3'
);
INSERT INTO address VALUES(
'1',
'Hell Ave',
'World Suburb',
'111',
'4'
);

COMMIT;

/* industry */



CREATE TABLE industry
(
industry_id int NOT NULL,
industry_title varchar2(255) NOT NULL,
PRIMARY KEY(industry_id)
);

INSERT INTO industry VALUES
('0', 'Engineering');
INSERT INTO industry VALUES
('1', 'Medical');
INSERT INTO industry VALUES
('2', 'Construction');
INSERT INTO industry VALUES
('3', 'Energy');
INSERT INTO industry VALUES
('4', 'Bioscience');


/* category */



CREATE TABLE category(
category_id int PRIMARY KEY NOT NULL,
category_description varchar2(255) NOT NULL
);

INSERT INTO category VALUES(
0,
'Electrical'
);
INSERT INTO category VALUES(
1,
'Manual'
);
INSERT INTO category VALUES(
2,
'Off Grid power'
);
INSERT INTO category VALUES(
3,
'Electrical'
);
INSERT INTO category VALUES(
4,
'Electrical'
);

COMMIT;

/* worker_role  */



CREATE TABLE worker_role
(
role_id int NOT NULL,
PRIMARY KEY(role_id),
role_description varchar(255) NOT NULL
);

INSERT INTO worker_role VALUES(
0,
'boss'
);
INSERT INTO worker_role VALUES(
1,
'Slave'
);
INSERT INTO worker_role VALUES(
2,
'CEO'
);
INSERT INTO worker_role VALUES(
3,
'Supervisor'
);
INSERT INTO worker_role VALUES(
4,
'Minion'
);

COMMIT;

/* worker  */



CREATE TABLE worker
(
worker_id int NOT NULL,
PRIMARY KEY(worker_id),
f_name varchar2(255) NOT NULL,
m_name varchar2(255),
l_name varchar2(255) NOT NULL,
gender char(1)
CONSTRAINT gender_check_const check(REGEXP_LIKE(gender, '[MFOmfo]')) NOT NULL, 
d_o_b date NOT NULL,
start_date date NOT NULL,
is_Active char(1),
role_id int NOT NULL
Constraint role_id_cnst REFERENCES worker_role(role_id)const REFERENCES business_type(type_id),
business_id int NOT NULL
Constraint business_id_cnst REFERENCES business(business_id)
);


INSERT INTO worker VALUES
(worker_sequence.nextval, 'jam', 'not', 'god', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2016', 'DD/MM/YYYY'), 'a', 0, 0);
INSERT INTO worker VALUES
(worker_sequence.nextval, 'jame', 'noth', 'good', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2016', 'DD/MM/YYYY'), 'a', 0, 0);
INSERT INTO worker VALUES
(worker_sequence.nextval, 'james', 'nothi', 'goodm', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2016', 'DD/MM/YYYY'), 'a', 0, 0);
INSERT INTO worker VALUES
(worker_sequence.nextval, 'james', 'nothing', 'goodma', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2016', 'DD/MM/YYYY'), 'a', 0, 0);
INSERT INTO worker VALUES
(worker_sequence.nextval, 'james', 'nothing', 'goodman', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2016', 'DD/MM/YYYY'), 'a', 0, 0);

COMMIT;

/* asset  */



CREATE TABLE asset(
asset_ID int PRIMARY KEY NOT NULL,
install_date date,
purchase_date date,
model varchar2(255) NOT NULL,
serial_number varchar2(255) ,
number_services int NOT NULL,
cur_condition int NOT NULL,
photo varchar2(255), /*Need to do regex checking to ensure correct format: <filename>.<filetype>*/
business_ID int NOT NULL
CONSTRAINT b_ID_cnst REFERENCES business(business_id),
industry_ID int 
CONSTRAINT in_ID_const REFERENCES industry(industry_id)
);

INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'ABCD',
'123',
0,
10,
'image.png',
'0',
'0'
);
INSERT INTO asset VALUES(
1, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'ABCDE',
'123',
0,
10,
'image.png',
'0',
'0'
);
INSERT INTO asset VALUES(
2, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'ABCDEF',
'123',
0,
10,
'image.png',
'0',
'0'
);
INSERT INTO asset VALUES(
3, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'ABCDEFG',
'123',
0,
10,
'image.png',
'0',
'0'
);
INSERT INTO asset VALUES(
4, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'ABCDEFGH',
'123',
0,
10,
'image.png',
'0',
'0'
);

COMMIT;

/* service_log  */



CREATE TABLE service_log
(
date_serviced date NOT NULL,
electrical_test_done char(1)
CONSTRAINT electrical_test_const check(REGEXP_LIKE(electrical_test_done, '[YNyn]')) NOT NULL,
calibration_done  char(1)
CONSTRAINT calibration_const check(REGEXP_LIKE(calibration_done, '[YNyn]')) NOT NULL,
condition int,
calibration_due date,
comments varchar2(255),
elec_test_due date,
asset_id int
CONSTRAINT a_id_const REFERENCES asset(asset_id),
service_id int
CONSTRAINT service_id_const REFERENCES worker(worker_id),
update_id int
CONSTRAINT up_id_const REFERENCES worker(worker_id),
PRIMARY KEY(asset_id, date_serviced)
);

CREATE OR REPLACE TRIGGER elec_test_due
    AFTER INSERT ON service_log
		FOR EACH ROW
		BEGIN
			UPDATE service_log
				SET elec_test_due = To_date('21/08/2220', 'DD/MM/YYYY');
		

END;
/

INSERT INTO service_log VALUES(
To_date('21/04/1990', 'DD/MM/YYYY'),
'y',
'y',
5,
To_date('21/08/1990', 'DD/MM/YYYY'),
'very good!',
To_date('21/08/1990', 'DD/MM/YYYY'),
0,
0,
0
);
INSERT INTO service_log VALUES(
To_date('21/04/1990', 'DD/MM/YYYY'),
'y',
'y',
5,
To_date('21/08/1990', 'DD/MM/YYYY'),
'very good!',
To_date('21/08/1990', 'DD/MM/YYYY'),
1,
1,
1
);
INSERT INTO service_log VALUES(
To_date('21/04/1990', 'DD/MM/YYYY'),
'y',
'y',
5,
To_date('21/08/1990', 'DD/MM/YYYY'),
'very good!',
To_date('21/08/1990', 'DD/MM/YYYY'),
2,
2,
2
);
INSERT INTO service_log VALUES(
To_date('21/04/1990', 'DD/MM/YYYY'),
'y',
'y',
5,
To_date('21/08/1990', 'DD/MM/YYYY'),
'very good!',
To_date('21/08/1990', 'DD/MM/YYYY'),
3,
3,
3
);
INSERT INTO service_log VALUES(
To_date('21/04/1990', 'DD/MM/YYYY'),
'y',
'y',
5,
To_date('21/08/1990', 'DD/MM/YYYY'),
'very good!',
To_date('21/08/1990', 'DD/MM/YYYY'),
4,
4,
4
);

COMMIT;

/* docs_attached  */



CREATE TABLE docs_attached(
doc_id int PRIMARY KEY NOT NULL,
file_name varchar2(255) NOT NULL,
asset_id int NOT NULL
CONSTRAINT as_id_const REFERENCES asset(asset_id) DISABLE
);


INSERT INTO docs_attached VALUES(
0,
'filename.filetype',
0
);
INSERT INTO docs_attached VALUES(
1,
'filename.filetype',
1
);
INSERT INTO docs_attached VALUES(
2,
'filename.filetype',
2
);
INSERT INTO docs_attached VALUES(
3,
'filename.filetype',
3
);
INSERT INTO docs_attached VALUES(
4,
'filename.filetype',
4
);

COMMIT;

/* model_manufacturer  */



/* Create Models table*/

CREATE TABLE model_manufacturer(
model varchar2(255) PRIMARY KEY NOT NULL,
manufacturer varchar2(255) NOT NULL
);

/* Insert a Row into the Docs_Attached table*/

INSERT INTO model_manufacturer VALUES(
'Galaxy S0',
'Samsung'
);
INSERT INTO model_manufacturer VALUES(
'Galaxy S1',
'Samsung'
);
INSERT INTO model_manufacturer VALUES(
'Galaxy S2',
'Samsung'
);
INSERT INTO model_manufacturer VALUES(
'Galaxy S3',
'Samsung'
);
INSERT INTO model_manufacturer VALUES(
'Galaxy S4',
'Samsung'
);





COMMIT;

/* included_in  */



CREATE TABLE included_in(
asset_id int NOT NULL
CONSTRAINT asset_id_const REFERENCES asset(asset_id) DISABLE,
category_id int NOT NULL
CONSTRAINT cat_id_const REFERENCES category(category_id) DISABLE,
PRIMARY KEY(asset_id, category_id)
);

INSERT INTO included_in VALUES(
0,
0
);
INSERT INTO included_in VALUES(
1,
1
);
INSERT INTO included_in VALUES(
2,
2
);
INSERT INTO included_in VALUES(
3,
3
);
INSERT INTO included_in VALUES(
4,
4
);

COMMIT;


