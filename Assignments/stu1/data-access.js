//
// File: data-access.js
// Date: 6/25/2022
//

const { Pool } = require("pg");
const GET_PERSON = "select * from person where person_id = $1"
const GET_BOOK = "select bs.book_store_id, bs.book_store_name, b.title from book_store bs join book_store_book bb on bb.book_store_id = bs.book_store_id join book b on  b.book_id = bb.book_id where bs.book_store_id = $1"
const UPDATE_PERSON = "update person set first_name = $2 where person_id = $1 returning person_id;"
const ADD_BOOK = "insert into book_store (book_store_name) values ($1)returning book_store;"

const pool = new Pool({
  user: "postgres",
  password: "2019No1994Ji!",
  database: "postgres",
  host: "localhost",
  port: 5432,
});

exports.ex13 = async () => {
    let personId = 1
    return await this.getPerson(personId); // <== don't forget this word.
}

exports.ex14 = async () => {
    let bookstoreId = 1
    return await this.getBooks(bookstoreId);
}

exports.ex15 = async () => {
    let personId = 1
    let newName = "Johnny"
    return await this.updatePerson(personId, newName);
}

exports.ex16 = async () => {
    let bookstoreName = "Book World"
    return await this.addBookstore(bookstoreName);
}

exports.ex17 = async () => {
    let newBookTitle = "It Begins Here"
    let newBookIsbn = "123-12-12344-22-111"
    let bookStoreId = 1
    return await this.addBook(newBookTitle, newBookIsbn, bookStoreId)
}

// const main = async () => {
//     await ex13()
//     process.exit()
// }

//
// Your functions here...
//
/*Create an arrow function called getPerson that accepts a person id and returns all the information for a person.*/
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
        let r = await pool.query(GET_BOOK, [bookStoreId]);
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
      let r = await pool.query(ADD_BOOK, [bookstoreName]);
      retval = r.rows;
    } catch (err) {
      console.error(err);
    }
    return retval;
}

exports.addBook = async (title, isbn, bookstoreId) => {
    let retval = null;
    // TODO...
    return retval;
}

//main()
