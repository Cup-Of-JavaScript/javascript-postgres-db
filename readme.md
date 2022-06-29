# JavaScript Postgres Database

Assignments are located [here](./assignments.md).

# Getting Started
- Clone this repo
- Install dependencies: `npm install`
- Run `bookstore-create.sql` in your student database

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

# SQL Reference
## CRUD
- Select
- Update
- Insert
- Delete

## Joins
- Inner: Join
  - `A join B` reads: Return ONLY the rows that match.
- Outer: Left vs Right
  - Protip: Always prefer one or the other (I prefer left)
    - `B right join A` is the same as `A left join B`
  - `A left join B` reads: Return EVERYTHING from the left table and return nulls from the right table if no match

## Relationships
- One to Many

![](./docs/onetomany-1.png)

![](./docs/onetomany-2.png)

- Many to Many

![](./docs/manytomany.png)

# Create Customer Table
```
create sequence cus_seq as integer;

create table customer (
  customer_id integer not null default nextval('cus_seq'),
  customer_name varchar(50)
);
				
alter sequence cus_seq owned by customer.customer_id;

```


# Links
- [Postgres Queries with pg Library](https://onestepcode.com/postgres-nodejs-tutorial/)
- [Sequence Counter YouTube](https://youtu.be/hpL9C5FWIRk)

# Connect to AWS Postgres
- Host: database-1.cosgu9wr5iwp.us-east-1.rds.amazonaws.com
- Port: 5432
- Maintaince database: stu{YOUR STUDENT ID}
- username: postgres
- password: ***

