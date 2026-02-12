-- drop table if exists begin_inventory

-- create table for begin_inventory
create table begin_inventory(
	inventoryid TEXT,
	store INTEGER,
	city TEXT,
	brand INTEGER,
	description TEXT,
	size TEXT,
	onHand INTEGER,
	price NUMERIC(10,2),
	startDate TEXT
)
SELECT * FROM begin_inventory


-- create table for end_inventory

CREATE TABLE end_inventory(
	inventoryid TEXT,
	store INTEGER,
	city TEXT,
	brand INTEGER,
	description TEXT,
	size TEXT,
	onHand INTEGER,
	price NUMERIC(10,2),
	endDate TEXT
)
SELECT * FROM end_inventory


-- create table for purchase
CREATE TABLE purchases (
    inventoryid TEXT,
    store INTEGER,
    brand INTEGER,
    description TEXT,
    size TEXT,
    vendornumber INTEGER,
    vendorname TEXT,
    ponumber INTEGER,
    podate TEXT,
	receivingdate TEXT,
	invoicedate TEXT,
	paydate TEXT,
    purchaseprice NUMERIC(10,2),
    quantity INTEGER,
    dollars NUMERIC(12,2),
    classification INTEGER
);

select * from purchases
-- create table for purchase_prices
CREATE TABLE purchase_prices (
    brand INTEGER,
    description TEXT,
    price NUMERIC(10,2),
    size TEXT,
    volume TEXT,
    classification INTEGER,
    purchaseprice NUMERIC(10,2),
    vendornumber INTEGER,
    vendorname TEXT
);

select * from purchase_prices
-- create table for sales
CREATE TABLE sales (
    inventoryid TEXT,
    store INTEGER,
    brand INTEGER,
    description TEXT,
    size TEXT,
    salesquantity INTEGER,
    salesdollars NUMERIC(12,2),
    salesprice NUMERIC(10,2),
    salesdate TEXT,
    volume NUMERIC(10,2),
    classification INTEGER,
    excisetax NUMERIC(10,2),
    vendorno INTEGER,
    vendorname TEXT
);
-- ALTER TABLE sales
-- ALTER COLUMN salesdate TYPE TEXT;

select * from sales
-- create table for vendor_invoice
CREATE TABLE vendor_invoice (
    vendornumber INTEGER,
    vendorname TEXT,
    invoicedate TEXT,
    ponumber INTEGER,
    podate TEXT,
    paydate TEXT,
    quantity INTEGER,
    dollars NUMERIC(12,2),
    freight NUMERIC(10,2),
    approval TEXT
);

SELECT * FROM vendor_invoice
