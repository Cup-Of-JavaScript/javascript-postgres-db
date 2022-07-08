//
// File: data-access.js
// Date: 6/25/2022
//

const GET_PERSON = "select * from person where person_id =($1);"
const GET_BOOKS= `select b.title
from book b
join book_store_book bsb on b.book_id=bsb.book_id 
join book_store bs on bsb.book_store_id=bs.book_store_id where bs.book_Store_id = ($1);`

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
    await ex14()
    process.exit()
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

const updatePerson = async (personId, newName) => {
    let retval = null;
    // TODO...
    return retval;
}

const addBookstore = async (bookstoreName) => {
    let retval = null;
    // TODO...
    return retval;
}

const addBook = async (title, isbn, bookstoreId) => {
    let retval = null;
    // TODO...
    return retval;
}

// main()
