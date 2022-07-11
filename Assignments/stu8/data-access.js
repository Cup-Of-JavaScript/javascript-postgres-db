//
// File: data-access.js
// Date: 6/25/2022
//

const GET_PERSON = "select * from person where person_id =($1);"
const GET_BOOKS= `select b.title
from book b
join book_store_book bsb on b.book_id=bsb.book_id 
join book_store bs on bsb.book_store_id=bs.book_store_id where bs.book_Store_id = ($1);`
const UPDATE_PERSON = "update person set first_name = $2 where person_id = $1 returning person_id, first_name"
const ADD_BOOKSTORE = `
  insert into 
    book_store (book_store_name) 
  values 
    ($1) returning book_store_name`
const ADD_BOOK = 
    `insert into 
        book (title, isbn) 
    values 
        ($1, $2) 
    returning book_id;`
const ADD_BOOK_TO_STORE = 
    `insert into 
        book_store_book (book_id, book_store_id) 
    values 
      ($1, $2) 
    returning book_store_book_id;`

const { Pool } = require("pg");

const pool = new Pool({
    user: "postgres",
    password: "C0cacola0",
    database: "postgres",
    host: "localhost",
    port: 5432,
});

exports.ex13 = async () => {
    let personId = 1
    console.log(await this.getPerson(personId))
}

exports.ex14 = async () => {
    let bookstoreId = 1
    return await this.getBooks(bookstoreId)
}

exports.ex15 = async () => {
    let personId = 1
    let newName = "Johnny"
    return await this.updatePerson(personId, newName)
}

exports.ex16 = async () => {
    let bookstoreName = "Book World"
    return await this.addBookstore(bookstoreName)
}

exports.ex17 = async () => {
    let newBookTitle = "To Sleep In A Sea of Stars"
    let newBookIsbn = "123-12-12344-22-222"
    let bookStoreId = 3
    return await this.addBook(newBookTitle, newBookIsbn, bookStoreId)
}


//
// Your functions here...
//

exports.getPerson = async (personId) => {
    let retval = null;
    try {
        let r = await pool.query(GET_PERSON, [personId]);
        retval = r.rows;
    } catch (err) {
        console.error(err);
    }
    return retval;
}

exports.getBooks = async (bookStoreId) => {
    let retval = null;
    try {
      let r = await pool.query(GET_BOOKS, [bookStoreId]);
      retval = r.rows;
    } catch (err) {
      console.error(err);
    }
    return retval;
    
}

exports.updatePerson = async (personId, newName) => {
    let retval = null;
    try {
        let r = await pool.query(UPDATE_PERSON, [personId, newName]);
        retval = r.rows;
      } catch (err) {
        console.error(err);
      }
    return retval;
}

exports.addBookstore = async (bookstoreName) => {
    let retval = null;
    try {
        let r = await pool.query(ADD_BOOKSTORE, [bookstoreName]);
        retval = r.rows;
      } catch (err) {
        console.error(err);
      }
    return retval;
}

exports.addBook = async (title, isbn, bookstoreId) => {
    let retval = null;
    try {
        let r = await pool.query(ADD_BOOK, [title, isbn]);
        retval = r.rows;
        let bookId = r.rows[0].book_id;
        w = await pool.query(ADD_BOOK_TO_STORE, [bookId, bookstoreId]);
        retval = w.rows[0];
      } catch (err) {
        console.error(err);
      }
    return retval;
}

// main()
