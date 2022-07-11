//
// File: data-access.js
// Date: 6/25/2022
//

const { Pool } = require("pg");
const get_person = 'SELECT * FROM person WHERE person_id = ($1);'

const pool = new Pool({
  user: "postgres",
  password: "Veggie97!",
  database: "postgres",
  host: "localhost",
  port: 5432,
});

exports.ex13 = async () => {
    let personId = 1
    console.log(await This.getPerson(personId))
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

// const main = async () => {
//     await ex13()
//     process.exit()
// }

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

const getBooks = async (bookStoreId) => {
    let retval = null;
    // TODO...
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

