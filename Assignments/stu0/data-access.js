//
// File: data-access.js
// Date: 6/25/2022
//

const { Pool } = require("pg");

const SELECT_PERSON = "select * from person where person_id = $1"
const SELECT_BOOKS_FOR_BOOKSTORE = `select 
    bs.book_store_id, b.book_id, bs.book_store_name, b.title, b.isbn
    from book_store bs
    join book_store_book bsb on bs.book_store_id = bsb.book_store_id
    join book b on bsb.book_id = b.book_id
    where 
    bs.book_store_id = $1`


const pool = new Pool({
  user: "postgres",
  password: "Ihgdp51505150!",
  database: "express",
  host: "localhost",
  port: 5432,
});

const ex13 = async () => {
    let personId = 1
    console.log(await getPerson(personId))
}

const ex14 = async () => {
    let bookstoreId = 1
    console.log(await getBooks(bookstoreId))
}

const ex15 = async () => {
    console.log('TODO...')
}

const ex16 = async () => {
    console.log('TODO...')
}

const ex17 = async () => {
    console.log('TODO...')
}

const main = async () => {
    await ex14()
    process.exit()
}

//
// Your functions here...
//

const getPerson = async (personId) => {
    let retval = null;
    try {
        let r = await pool.query(SELECT_PERSON, [personId]);
        retval = r.rows[0];
    } catch (err) {
        console.error(err);
    }
    return retval;
}

const getBooks = async (bookStoreId) => {
    let retval = null;
    try {
        let r = await pool.query(SELECT_BOOKS_FOR_BOOKSTORE, [bookStoreId]);
        retval = r.rows;
    } catch (err) {
        console.error(err);
    }
    return retval;
}




main()
