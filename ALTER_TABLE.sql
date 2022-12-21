
----CREATED TABLE ---
CREATE OR REPLACE TABLE NK_sales 
(
  customer_id VARCHAR(1) PRIMARY KEY ,
  order_date DATE NOT NULL,
  product_id INT not null
);
  
  DESCRIBE TABLE  NK_sales ;
 
 
 ---INSERTED VALUES---- 
INSERT INTO NK_sales
VALUES
('A', '2021-01-01', '1'),
('A', '2021-01-01', '2'),
('A', '2021-01-07', '2'),
('A', '2021-01-10', '3'),
('A', '2021-01-11', '3'),
('A', '2021-01-11', '3'),
('B', '2021-01-01', '2'),
('B', '2021-01-02', '2'),
('B', '2021-01-04', '1'),
('B', '2021-01-11', '1'),
('B', '2021-01-16', '3'),
('C','2021-01-07', '3'),
('d','2021-01-23', 4); 

SELECT * FROM  NK_sales ;


---CREATED THE COPY OF THE TABLE ||  BUT HERE ONLY STRUCTURE IS GETTING COPIED NOT THE DATA---
CREATE OR REPLACE TABLE  NK_sales_COPY LIKE  NK_sales;

DESCRIBE TABLE NK_sales_COPY;

SELECT * FROM NK_sales_COPY;


---CREATED THE COPY OF THE TABLE ||  HERE STRUCTURE AS WELL AS DATA BOTH ARE GETTING COPIED---
CREATE OR REPLACE TABLE NK_sales_COPY_DATA AS
SELECT * FROM NK_sales;

DROP TABLE NK_sales_COPY_DATA;

DESCRIBE TABLE NK_sales_COPY_DATA;

SELECT * FROM NK_sales_COPY_DATA;


---CREATED THE COPY OF THE TABLE ||  bUT WHEN WE JUST REQUIRE FEW COLOUMN NOT ALL---
CREATE OR REPLACE TABLE NK_sales_COPY_DATA1 AS
SELECT CUSTOMER_ID,PRODUCT_ID FROM NK_sales;

DESCRIBE TABLE NK_sales_COPY_DATA1;

SELECT * FROM NK_sales_COPY_DATA1;

--------------------------------------------------------------------------------------------------------------------

---USING DEFAULT CONTRAINT----

CREATE OR REPLACE TABLE NK_sales_CONSTRAINT 
(
  customer_id VARCHAR(1) PRIMARY KEY ,
  order_date DATE DEFAULT TO_DATE('2022-12-21'),
  product_id INT not null
);

INSERT INTO NK_sales(customer_id,product_id)
VALUES
('E','5'),
('F','6');

INSERT INTO NK_sales_CONSTRAINT 

VALUES
('A', '2021-01-01', '1'),
('A', '2021-01-01', '2'),
('A', '2021-01-07', '2'),
('A', '2021-01-10', '3'),
('A', '2021-01-11', '3'),
('A', '2021-01-11', '3'),
('B', '2021-01-01', '2'),
('B', '2021-01-02', '2'),
('B', '2021-01-04', '1'),
('B', '2021-01-11', '1'),
('B', '2021-01-16', '3'),
('C','2021-01-07', '3'),
('d','2021-01-23', 4); 

SELECT * FROM NK_sales_CONSTRAINT;


INSERT INTO NK_sales_CONSTRAINT(customer_id,product_id)
VALUES
('E','5'),
('F','6');


-----------ALTERING TABLE : -------------


/*
Q. ADD A EXTRA COULUMN AGE TO NK_sales_CONSTRAINT TABLE.
*/


ALTER TABLE NK_sales_CONSTRAINT
ADD AGE NUMBER;

/*
Q. ADD A EXTRA COULUMN COUNTRY TO NK_sales_CONSTRAINT TABLE.
ALSO WHEN NO VALUE IS THERE BY DEFAULT IT SHOULD COME INDA
*/

ALTER TABLE NK_sales_CONSTRAINT
ADD COUNTRY VARCHAR(20) DEFAULT 'INDIA';



----- USED PRIMARY KEY CONSTRAINT :---->

/*
Q. ADD A COLOUNM NAME PAN_NO TO THE EXISTING NK_sales_CONSTRAINT TABLE.
ALSO CHECK IF ANY PRIMARY KEY EXIST. IF EXIST DROP PRIMARY KEY.
CREATE PRIMARY KEY FOR NEWLY ADDED COLOUMN PAN_NO.
*/

SELECT * FROM NK_sales_CONSTRAINT;

ALTER TABLE NK_sales_CONSTRAINT
ADD PAN_NO VARCHAR(20);

DESCRIBE TABLE NK_sales_CONSTRAINT;

ALTER TABLE NK_sales_CONSTRAINT
DROP  PRIMARY KEY;

ALTER TABLE NK_sales_CONSTRAINT
ADD PRIMARY KEY(PAN_NO);


-------------UPDATE AND SET COMMAND---------

/*
Q.USING UPDATE COMMAND UPDATE THE COLOUMN AGE.
GIVE AGE AS 35 WHEREEVER AGE IS NULL.
*/


UPDATE NK_sales_CONSTRAINT
SET
AGE = 35
WHERE AGE IS NULL;

SELECT * FROM NK_sales_CONSTRAINT;


/*
Q. USING UPDATE COMMAND UPDATE THE COLOUMN PAN_NO.
NEED PAN_NO AS 'XXX-XXX-XXX' WHEREVER PAN_NO IS 'NULL'
*/

UPDATE NK_sales_CONSTRAINT
SET 
PAN_NO = 'XXX-XXX-XXX'
WHERE PAN_NO IS NULL;

SELECT * FROM NK_sales_CONSTRAINT;