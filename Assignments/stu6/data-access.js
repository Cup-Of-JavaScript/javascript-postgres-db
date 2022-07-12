
const { Pool } = require("pg");
const add_Bookstore = `insert into
book_store (book_store_name)
values
($1) returning book_store_name`

const pool = new Pool({
  user: "postgres",
  password: "1141821Gagoka!",
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

//
// Your functions here...
//

const getPerson = async (personId) => {
    let retval = null;
    // TODO...
    return retval;
}

exports.getBooks = async (bookStoreId) => {
    let retval = null;
   try {
    let r = await pool.query(Get_Books, [bookStoreId]);
    retval = r.rows;
   } catch (err){
    console.error(err)
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
        let r = await pool.query(add_Bookstore, [bookstoreName]);
        retval = r.rows;
    } catch (err) {
        console.error(err);
    }
    return retval;
}

const addBook = async (title, isbn, bookstoreId) => {
    let retval = null;
    // TODO...
    return retval;
}

//main()
