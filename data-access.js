//
// File: data-access.js
// Auth: Martin Burolla
// Date: 6/25/2022
// Desc: Simple data access for Postgres.
//       Create the customer table as specified in the readme before running this code.
//

const { Pool } = require("pg");

const SELECT_CUSTOMER = "select * from customer"
const INSERT_CUSTOMER = "insert into customer (customer_name) values ($1) returning customer_id"
const UPDATE_CUSTOMER = "update customer set customer_name = $1 where customer_id = $2"
const DELETE_CUSTOMER = "delete from customer where customer_id = $1"

const pool = new Pool({
  user: "postgres",
  password: "Ihgdp51505150!",
  database: "express",
  host: "localhost",
  port: 5432,
});

exports.select = async () => {
  let retval = null;
  try {
    let r = await pool.query(SELECT_CUSTOMER);
    retval = r.rows;
  } catch (err) {
    console.error(err);
  }
  return retval;
};

exports.insert = async (customerName) => {
  let retval = null;
  try {
    let r = await pool.query(INSERT_CUSTOMER, [customerName]
    );
    retval = r.rows;
  } catch (err) {
    console.error(err);
  }
  return retval;
};

exports.update = async (customer) => {
  let retval = null;
  try {
    let r = await pool.query(UPDATE_CUSTOMER, [customer.customerName, customer.customerId]);
    retval = r.rows;
  } catch (err) {
    console.error(err);
  }
  return retval;
};

exports.deleteCustomer = async (customerId) => {
  let retval = null;
  try {
    let r = await pool.query(DELETE_CUSTOMER, [customerId]);
    retval = "OK"
  } catch (err) {
    console.error(err);
  }
  return retval;
};
