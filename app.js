const { Pool } = require("pg");

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
    let r = await pool.query(
      "insert into customer (customer_name) values ($1)",
      [customerName]
    );
    console.log(r.rows);
  } catch (err) {
    console.error(err);
  }
};

const main = async () => {
  //await select();
  await insert();
  process.exit();
};

main();
