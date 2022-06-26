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
const UPDATE_PERSON = "update person set first_name = $1 where person_id = $2"
const INSERT_BOOK = "insert into book (title, isbn) values ($1, $2) returning book_id"
const INSERT_BOOK_STORE = "insert into book_store (book_store_name) values ($1) returning book_store_id"
const INSERT_BOOK_STORE_BOOK = "insert into book_store_book (book_id, book_store_id) values ($1, $2)"

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
    let personId = 1
    let newName = "Johnny"
    console.log(await updatePerson(personId, newName))
}

const ex16 = async () => {
    let bookstoreName = "Book World"
    console.log(await addBookstore(bookstoreName))
}

const ex17 = async () => {
    let newBookTitle = "It Begins Here"
    let newBookIsbn = "123-12-12344-22-111"
    let bookStoreId = 1
    console.log(await addBook(newBookTitle, newBookIsbn, bookStoreId))
}

const main = async () => {
    await ex17()
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

const updatePerson = async (personId, newName) => {
    let retval = null;
    try {
        await pool.query(UPDATE_PERSON, [newName, personId]);
        let r = await pool.query(SELECT_PERSON, [personId]);
        retval = r.rows[0]
    } catch (err) {
        console.error(err);
    }
    return retval;
}

const addBookstore = async (bookstoreName) => {
    let retval = null;
    try {
        let r = await pool.query(INSERT_BOOK_STORE, [bookstoreName]);
        retval = r.rows[0]
    } catch (err) {
        console.error(err);
    }
    return retval;
}

const addBook = async (title, isbn, bookstoreId) => {
    let retval = null;
    try {
        let r = await pool.query(INSERT_BOOK, [title, isbn]); // book_store
        let newBookId = r.rows[0].book_id
        r = await pool.query(INSERT_BOOK_STORE_BOOK, [newBookId, bookstoreId]); // book_store_book
        retval = newBookId;
    } catch (err) {
        console.error(err);
    }
    return retval;
}

main()
