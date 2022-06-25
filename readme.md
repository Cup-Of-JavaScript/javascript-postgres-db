- Topics
- DDL
  - Tables
    - Creating
	- Data Types
  - Indexes
  - Sequences
- DML
  - Queries
    - CRUD
	- Joins

//////////////////////////////////////////////////
// Creating table
//////////////////////////////////////////////////

create sequence cus_seq as integer;

create table customer (
  customer_id integer not null default nextval('cus_seq'),
  customer_name varchar(50)
)
				
alter sequence cus_seq owned by customer.customer_id

insert into customer (customer_name) values ('marty')

select * from customer

// Use UI to add additional columns
// Use UI to add foreign keys


database-1.cosgu9wr5iwp.us-east-1.rds.amazonaws.com

5432
un: postgres
pd: Ihgdp51505150!

# Package.json
"type": "module",