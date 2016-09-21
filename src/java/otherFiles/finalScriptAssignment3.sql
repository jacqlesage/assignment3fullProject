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
'Auckland'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9012',
'Wellington'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9013',
'Christchurch'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9014',
'Dunedin'
);
INSERT INTO postcode_city VALUES
(
'9015',
'Dunedin'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9016',
'Dunedin'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9017',
'Christchurch'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9018',
'Auckland'
);
INSERT INTO postcode_city (postcode,city) VALUES
(
'9019',
'Wellington'
);

COMMIT;

/* business_type */



CREATE TABLE business_type(
       type_id int PRIMARY KEY NOT NULL,
       type_description varchar2(255)
);

@busTypeAutoTrig.sql

INSERT INTO business_type VALUES(
'0',
'Asset Holder'
);
INSERT INTO business_type VALUES(
'0',
'Asset Holder 1'
);
INSERT INTO business_type VALUES(
'0',
'Asset Holder 2'
);
INSERT INTO business_type VALUES(
'0',
'Asset Holder 3'
);
INSERT INTO business_type VALUES(
'0',
'Asset Holder 4'
);

COMMIT;

/* business */ 



CREATE TABLE business(
business_ID int PRIMARY KEY NOT NULL,
name varchar2(255) NOT NULL,
contact_number varchar2(255) NOT NULL,
num_workers int,
type_id int
CONSTRAINT type_id_const REFERENCES business_type(type_id)
);

@busAutoTrig.sql

INSERT INTO business VALUES(
0,
'Peace LTD',
'03 345 678',
100,
1
);
INSERT INTO business VALUES(
0,
'War LTD',
'03 345 679',
100,
1
);
INSERT INTO business VALUES(
0,
'Love LTD',
'03 345 680',
100,
2
);
INSERT INTO business VALUES(
0,
'Hate LTD',
'03 345 681',
100,
3
);
INSERT INTO business VALUES(
0,
'Space LTD',
'03 345 682',
100,
4
);

COMMIT;

/*address*/

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
'0',
'Hello Street',
'World Suburb',
'9010',
'0'
);
INSERT INTO address VALUES(
'1',
'Hello Ave',
'World Suburb',
'9011',
'1'
);
INSERT INTO address VALUES(
'2',
'Hello Place',
'World Suburb',
'9012',
'2'
);
INSERT INTO address VALUES(
'3',
'Hell Street',
'World Suburb',
'9013',
'3'
);
INSERT INTO address VALUES(
'4',
'Hell Ave',
'World Suburb',
'9014',
'4'
);

INSERT INTO address VALUES(
'5',
'Hello Street',
'World Suburb',
'9015',
'5'
);
INSERT INTO address VALUES(
'6',
'Hello Ave',
'World Suburb',
'9016',
'6'
);
INSERT INTO address VALUES(
'7',
'Hello Place',
'World Suburb',
'9017',
'7'
);
INSERT INTO address VALUES(
'8',
'Hell Street',
'World Suburb',
'9018',
'8'
);
INSERT INTO address VALUES(
'9',
'Hell Ave',
'World Suburb',
'9019',
'9'
);

COMMIT;

/*industry*/

CREATE TABLE industry
(
industry_id int NOT NULL,
industry_title varchar2(255) NOT NULL UNIQUE, --title should be unique and not null, otherwise redundant to have the same value twice
PRIMARY KEY(industry_id)
);

@industryTypeAutoTrig.sql

INSERT INTO industry VALUES
('0', 'engineering');
INSERT INTO industry VALUES
('0', 'Medical');
INSERT INTO industry VALUES
('0', 'Electrical');
INSERT INTO industry VALUES
('0', 'Produce');
INSERT INTO industry VALUES
('0', 'IT');
INSERT INTO industry VALUES
('0', 'Dentistry');
INSERT INTO industry VALUES
('0', 'Construction');
INSERT INTO industry VALUES
('0', 'Finance');
INSERT INTO industry VALUES
('0', 'Mining');
INSERT INTO industry VALUES
('0', 'Farming');

COMMIT;

/*category*/

CREATE TABLE category(
category_id int PRIMARY KEY NOT NULL,
category_description varchar2(255) NOT NULL UNIQUE --Each description should be unique and not null otherwise redundant
);

@catTypeAutoTrig.sql

INSERT INTO category VALUES(
0,
'Electrical'
);
INSERT INTO category VALUES(
0,
'Manual'
);
INSERT INTO category VALUES(
0,
'Off Grid power'
);
INSERT INTO category VALUES(
0,
'Mobility'
);
INSERT INTO category VALUES(
0,
'Safety'
);
INSERT INTO category VALUES(
0,
'Computer'
);
INSERT INTO category VALUES(
0,
'Smartphone'
);
INSERT INTO category VALUES(
0,
'Coffee Machine'
);
INSERT INTO category VALUES(
0,
'Food prep'
);
INSERT INTO category VALUES(
0,
'Hygiene'
);
COMMIT;


/*worker_role*/

CREATE TABLE worker_role
(
role_id int NOT NULL,
PRIMARY KEY(role_id),
role_description varchar(255) NOT NULL UNIQUE ----Each description should be unique and not null otherwise redundant
);

@wkRoleTypeAutoTrig.sql

INSERT INTO worker_role VALUES(
0,
'electrician'
);
INSERT INTO worker_role VALUES(
0,
'Labourer'
);
INSERT INTO worker_role VALUES(
0,
'CEO'
);
INSERT INTO worker_role VALUES(
0,
'Supervisor'
);
INSERT INTO worker_role VALUES(
0,
'Slave'
);
INSERT INTO worker_role VALUES(
0,
'IT technician'
);
INSERT INTO worker_role VALUES(
0,
'CIO'
);
INSERT INTO worker_role VALUES(
0,
'Data Analyst'
);
INSERT INTO worker_role VALUES(
0,
'Software Developer'
);
INSERT INTO worker_role VALUES(
0,
'Chef'
);

COMMIT;

/*asset*/

CREATE TABLE asset(
asset_ID int PRIMARY KEY NOT NULL,
install_date date,
purchase_date date,
model varchar2(255) NOT NULL,
serial_number varchar2(255) ,
number_services int NOT NULL, -- will be derived from service_log
cur_condition int NOT NULL, --need regex checking to make sure between 1 and 10 (1 is the worst condtion an asset can be in, 10 is the best); will be derived from service_log
photo varchar2(255), --Need to do regex checking to ensure correct format: <filename>.<filetype>
business_ID int NOT NULL
CONSTRAINT b_ID_cnst REFERENCES business(business_id),
industry_ID int 
CONSTRAINT in_ID_const REFERENCES industry(industry_id)
);

@assetAutoTrigger.sql

INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'Galaxy S2',
'123',
0,
1,
'image.png',
2,
1
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'Galaxy S1',
'123',
0,
5,
'image.png',
2,
1
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'Galaxy S3',
'123',
0,
10,
'image.png',
2,
2
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'Foxtrot',
'123',
0,
2,
'image.png',
2,
3
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'Galaxy S1',
'123',
0,
2,
'image.png',
4,
4
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'iPhone 1',
'123',
0,
1,
'image.png',
4,
5
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'iPhone 2',
'123',
0,
5,
'image.png',
2,
6
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'iPhone 3',
'123',
0,
10,
'image.png',
2,
7
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'iPhone 4',
'123',
0,
2,
'image.png',
2,
8
);
INSERT INTO asset VALUES(
0, 
to_date('1111-11-11','YYYY-MM-DD'), 
to_date('1111-11-11','YYYY-MM-DD'),
'iPhone 5',
'123',
0,
2,
'image.png',
4,
9
);

COMMIT;

/*worker*/

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
end_date date, --the end_date will not be set until the worker stops being active, so may be null.
is_Active char(1), --will actually be derived from end_date
role_id int NOT NULL
Constraint role_id_cnst REFERENCES worker_role(role_id),
business_id int NOT NULL
Constraint business_id_cnst REFERENCES business(business_id)
);

/*service log*/

CREATE TABLE service_log
(
date_serviced date NOT NULL,
electrical_test_done char(1)
CONSTRAINT electrical_test_const check(REGEXP_LIKE(electrical_test_done, '[YNyn]')) NOT NULL,
calibration_done  char(1)
CONSTRAINT calibration_const check(REGEXP_LIKE(calibration_done, '[YNyn]')) NOT NULL,
condition int, --in implementation, need checking to make sure between 1 and 10
calibration_due date, --will be derived from calibration_done
comments varchar2(255),
elec_test_due date, --will be derived from electrical_test_done
asset_id int
CONSTRAINT a_id_const REFERENCES asset(asset_id),
service_id int
CONSTRAINT service_id_const REFERENCES worker(worker_id),
update_id int
CONSTRAINT up_id_const REFERENCES worker(worker_id),
PRIMARY KEY(asset_id, date_serviced)
);

@trig.sql
@workerAutoTrig.sql

INSERT INTO worker VALUES
(0, 'jam', 'not', 'god', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2000', 'DD/MM/YYYY'), To_date('21/04/2010', 'DD/MM/YYYY'), 'a', 2, 2);
INSERT INTO worker VALUES
(0, 'jame', 'noth', 'good', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2001', 'DD/MM/YYYY'), NULL, '', 1, 2);
INSERT INTO worker VALUES
(0, 'james', 'nothi', 'goodm', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2012', 'DD/MM/YYYY'), To_date('21/04/2024', 'DD/MM/YYYY'), 'a', 2, 2);
INSERT INTO worker VALUES
(0, 'james', 'nothing', 'goodma', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2002', 'DD/MM/YYYY'), To_date('21/04/2012', 'DD/MM/YYYY'),'a', 3, 4);
INSERT INTO worker VALUES
(0, 'james', 'nothing', 'goodman', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2008', 'DD/MM/YYYY'), To_date('21/04/2018', 'DD/MM/YYYY'),'a', 4, 4);
INSERT INTO worker VALUES
(0, 'jammmy', 'not', 'god', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2006', 'DD/MM/YYYY'), To_date('21/04/2016', 'DD/MM/YYYY'),'a', 5, 1);
INSERT INTO worker VALUES
(0, 'jamey', 'noth', 'good', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2015', 'DD/MM/YYYY'), To_date('21/04/2025', 'DD/MM/YYYY'),'a', 6, 1);
INSERT INTO worker VALUES
(0, 'jamesy', 'nothi', 'goodm', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2011', 'DD/MM/YYYY'), To_date('21/04/2022', 'DD/MM/YYYY'),'a', 7, 4);
INSERT INTO worker VALUES
(0, 'jammmeys', 'nothing', 'goodma', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2016', 'DD/MM/YYYY'), To_date('21/04/2026', 'DD/MM/YYYY'),'a', 8, 4);
INSERT INTO worker VALUES
(0, 'jamesss', 'nothing', 'goodman', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2009', 'DD/MM/YYYY'), To_date('21/04/2019', 'DD/MM/YYYY'),'a', 9, 5);
INSERT INTO worker VALUES
(0, 'jameststs', 'nothing', 'goodman', 'M',To_date('21/04/1990', 'DD/MM/YYYY'),To_date('21/04/2009', 'DD/MM/YYYY'), To_date('21/04/2019', 'DD/MM/YYYY'),'a', 9,5);

/*insert service log values next*/

INSERT INTO service_log VALUES(
To_date('27/04/1990', 'DD/MM/YYYY'),
'y',
'y',
5,
To_date('09/05/2000', 'DD/MM/YYYY'),
'very bad!',
To_date('24/04/1996', 'DD/MM/YYYY'),
1,
4,
4
);
INSERT INTO service_log VALUES(
To_date('02/11/1999', 'DD/MM/YYYY'),
'y',
'y',
5,
To_date('08/08/2005', 'DD/MM/YYYY'),
'okay!',
To_date('25/01/1991', 'DD/MM/YYYY'),
2,
4,
4
);
INSERT INTO service_log VALUES(
To_date('21/04/1995', 'DD/MM/YYYY'),
'y',
'y',
2,
To_date('22/07/1997', 'DD/MM/YYYY'),
'very dirty!',
To_date('21/08/1991', 'DD/MM/YYYY'),
3,
3,
3
);
INSERT INTO service_log VALUES(
To_date('22/12/1992', 'DD/MM/YYYY'),
'y',
'y',
2,
To_date('02/08/1990', 'DD/MM/YYYY'),
'very good!',
To_date('16/08/1990', 'DD/MM/YYYY'),
4,
4,
4
);
INSERT INTO service_log VALUES(
To_date('12/03/1891', 'DD/MM/YYYY'),
'y',
'y',
3,
To_date('14/02/1984', 'DD/MM/YYYY'),
'very good!',
To_date('26/01/1976', 'DD/MM/YYYY'),
5,
5,
5
);
INSERT INTO service_log VALUES(
To_date('21/04/1990', 'DD/MM/YYYY'),
'n',
'n',
5,
To_date('09/05/2000', 'DD/MM/YYYY'),
'very bad!',
To_date('24/04/1996', 'DD/MM/YYYY'),
1,
1,
1
);
INSERT INTO service_log VALUES(
To_date('20/11/1999', 'DD/MM/YYYY'),
'n',
'n',
5,
To_date('08/08/2005', 'DD/MM/YYYY'),
'okay!',
To_date('25/01/1991', 'DD/MM/YYYY'),
1,
1,
1
);
INSERT INTO service_log VALUES(
To_date('21/06/1995', 'DD/MM/YYYY'),
'n',
'n',
2,
To_date('22/07/1997', 'DD/MM/YYYY'),
'very dirty!',
To_date('21/08/1991', 'DD/MM/YYYY'),
2,
2,
2
);
INSERT INTO service_log VALUES(
To_date('22/12/1992', 'DD/MM/YYYY'),
'n',
'n',
2,
To_date('02/08/1990', 'DD/MM/YYYY'),
'very good!',
To_date('16/08/1990', 'DD/MM/YYYY'),
3,
3,
3
);
INSERT INTO service_log VALUES(
To_date('09/03/1891', 'DD/MM/YYYY'),
'n',
'n',
3,
To_date('14/02/1984', 'DD/MM/YYYY'),
'very good!',
To_date('26/01/1976', 'DD/MM/YYYY'),
4,
4,
4
);

COMMIT;


CREATE TABLE docs_attached(
doc_id int PRIMARY KEY NOT NULL,
file_name varchar2(255) NOT NULL,
asset_id int NOT NULL
CONSTRAINT as_id_const REFERENCES asset(asset_id) DISABLE
);


INSERT INTO docs_attached VALUES(
0,
'filename0.filetype',
0
);
INSERT INTO docs_attached VALUES(
1,
'filename1.filetype',
1
);
INSERT INTO docs_attached VALUES(
2,
'filename2.filetype',
2
);
INSERT INTO docs_attached VALUES(
3,
'filename3.filetype',
3
);
INSERT INTO docs_attached VALUES(
4,
'filename4.filetype',
4
);
INSERT INTO docs_attached VALUES(
5,
'filename5.filetype',
5
);
INSERT INTO docs_attached VALUES(
6,
'filename6.filetype',
6
);
INSERT INTO docs_attached VALUES(
7,
'filename7.filetype',
7
);
INSERT INTO docs_attached VALUES(
8,
'filename8.filetype',
8
);
INSERT INTO docs_attached VALUES(
9,
'filename9.filetype',
9
);

COMMIT;


CREATE TABLE model_manufacturer(
model varchar2(255) PRIMARY KEY NOT NULL,
manufacturer varchar2(255) NOT NULL
);

INSERT INTO model_manufacturer VALUES(
'Foxtrot',
'Apple'
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
INSERT INTO model_manufacturer VALUES(
'iPhone 1',
'Apple'
);
INSERT INTO model_manufacturer VALUES(
'iPhone 2',
'Apple'
);
INSERT INTO model_manufacturer VALUES(
'iPhone 3',
'Apple'
);
INSERT INTO model_manufacturer VALUES(
'iPhone 4',
'Apple'
);
INSERT INTO model_manufacturer VALUES(
'iPhone 5',
'Apple'
);

COMMIT;

/* Should be included in???????
CREATE TABLE asset_category(
asset_id int NOT NULL
CONSTRAINT asset_id_const REFERENCES asset(asset_id),
category_id int NOT NULL
CONSTRAINT cat_id_const REFERENCES category(category_id),
PRIMARY KEY(asset_id, category_id)
);

INSERT INTO asset_category VALUES(
2,
0
);
INSERT INTO asset_category VALUES(
2,
1
);
INSERT INTO asset_category VALUES(
2,
2
);
INSERT INTO asset_category VALUES(
2,
3
);
INSERT INTO asset_category VALUES(
2,
4
);
INSERT INTO asset_category VALUES(
2,
5
);
INSERT INTO asset_category VALUES(
2,
6
);
INSERT INTO asset_category VALUES(
2,
7
);
INSERT INTO asset_category VALUES(
2,
8
);
INSERT INTO asset_category VALUES(
4,
9
);

COMMIT;
*/

CREATE TABLE included_in(
asset_id int NOT NULL
CONSTRAINT asset_id_const REFERENCES asset(asset_id) DISABLE,
category_id int NOT NULL
CONSTRAINT cat_id_const REFERENCES category(category_id) DISABLE,
PRIMARY KEY(asset_id, category_id)
);

INSERT INTO included_in VALUES(
2,
0
);
INSERT INTO included_in VALUES(
4,
1
);
INSERT INTO included_in VALUES(
6,
2
);
INSERT INTO included_in VALUES(
8,
3
);
INSERT INTO included_in VALUES(
10,
4
);

COMMIT;





