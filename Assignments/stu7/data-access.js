//
// File: data-access.js
// Date: 6/25/2022
//

const { Pool } = require("pg");
//ex13:
const get_person = 'SELECT * FROM person WHERE person_id = ($1);'
//ex14:
const get_Books = 'SELECT b.* FROM book b JOIN book_store_book sb on b.book_id = sb.book_id JOIN book_store bs on sb.book_store_id=bs.book_store_id WHERE bs.book_Store_id = ($1);'

//ex15:
const update_Person =  'UPDATE person SET first_name = $2 WHERE person_id = $1 RETURNING person_id;'

const pool = new Pool({
  user: "postgres",
  password: "Veggie97!",
  database: "postgres",
  host: "localhost",
  port: 5432,
});

const ex13 = async () => {
    let personId = 1
    console.log(await This.getPerson(personId))
}

const ex14 = async () => {
    let bookstoreId = 1
    console.log(await this.getBooks(bookstoreId))
}

exports.ex15 = async () => {
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

exports.getPerson = async (personId) => {
    let retval = null;
    try {
        let r = await pool.query(get_person, [personId]);
        retval = r.rows;
      } catch (err) {
        console.error(err);
      }
      return retval;
    };

    exports.getBooks = async (bookStoreId) => {
    let retval = null;
    try {
        let r = await pool.query(get_Books ,[bookStoreId]);
        retval = r.rows;
      } catch (err) {
        console.error(err);
      }
      return retval;
    };

const updatePerson = async (personId, newName) => {
    let retval = null;
    try {
        let r = await pool.query(get_Books ,[bookStoreId]);
        retval = r.rows;
      } catch (err) {
        console.error(err);
      }
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

