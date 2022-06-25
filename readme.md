# JavaScript Postgres Database

Assignments are located [here](./assignments.md)

# Topics
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

# Creating a Table
```
create sequence cus_seq as integer;

create table customer (
  customer_id integer not null default nextval('cus_seq'),
  customer_name varchar(50)
)
				
alter sequence cus_seq owned by customer.customer_id

insert into customer (customer_name) values ('marty')

select * from customer
```
- Use UI to add additional columns
- Use UI to add foreign keys

# Connect to AWS Postgres
- Host: database-1.cosgu9wr5iwp.us-east-1.rds.amazonaws.com
- Port: 5432
- un: postgres
- pd: ***

# Package.json
"type": "module",
