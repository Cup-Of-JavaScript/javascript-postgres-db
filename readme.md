# JavaScript Postgres Database

Assignments are located [here](./assignments.md).

# Getting Started
- Clone this repo
- Install dependencies: `npm install`
- Copy & paste the contents of `bookstore-create.sql` and execute in your database

# SQL
SQL has two main parts:
- DDL (Data Definition Language)
- DML (Data Manipulation Language)

- DDL
  - Create & Update 
    - Tables
    - Indexes
    - Sequences
    - Contraints
- DML
  - CRUD (Create Recall Update Delete)
	- Joins

# SQL Reference
## CRUD
- Select
  - `select * from cat`
  - `select * from cat where age > 5`
- Update
  - `update cat set name = 'Freddy' where cat_id = 1`
- Insert
  - `insert into cat (name) values ('Jonesy')`
- Delete
  - `delete from cat where cat > 4;`

## Joins

#### Inner
- `Table A join Table B` reads: Return ONLY the rows that match.
- No reason to specify "inner"

Example:

![](./docs/inner-join.png)

#### Outer
- Left vs Right
  - `Table B right join Table A` is the same as `Table A left join Table B`
    - PROTIP: Prefer one or the other, but not both.  I prefer left join.
  - `Table A left join Table B` reads: Return EVERYTHING from the left table and return nulls from the right table if no match
  - No reason to specify "outer" 

Example: 

![](./docs/outer-join.png)

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

