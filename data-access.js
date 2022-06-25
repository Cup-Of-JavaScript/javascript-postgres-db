//
// File: data-access.js
// Auth: Martin Burolla
// Date: 6/25/2022
// Desc: Simple data access for Postgres.
//

const { Pool } = require("pg"); // "type": "module" not required.

const pool = new Pool({
  user: "postgres",
  password: "Ihgdp51505150!",
  database: "express",
  host: "localhost",
  port: 5432,
});

const select = async () => {
  try {
    let r = await pool.query("select * from customer");
    console.log(r.rows);
  } catch (err) {
    console.error(err);
  }
};

const insert = async () => {
  try {
    let customerName = "Billy";
    let r = await pool.query("insert into customer (customer_name) values ($1)", [customerName]
    );
    console.log(r.rows);
  } catch (err) {
    console.error(err);
  }
};

const update = async () => {
  try {
    let customerName = "Freddy";
    let customerId = 2;
    let r = await pool.query("update customer set customer_name = $1 where customer_id = $2", [customerName, customerId]);
    console.log(r.rows);
  } catch (err) {
    console.error(err);
  }
};

const deleteCustomer = async () => {
  try {
    let customerId = 2;
    let r = await pool.query("delete from customer where customer_id = $1", [customerId]);
    console.log(r.rows);
  } catch (err) {
    console.error(err);
  }
};

const main = async () => {
  await select();
  //await insert();
  //await update();
  //await deleteCustomer();
  process.exit();
};

main();
