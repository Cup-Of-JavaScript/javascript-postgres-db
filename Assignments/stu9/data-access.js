//
// File: data-access.js
// Date: 6/25/2022
//

const { Pool } = require("pg");
//ex13
const GET_PERSON = "select * from person where person_id =($1);"
//ex14
const GET_BOOKS= "select b.titlefrom book_store bsjoin book_store_book bsb on bsb.book_store_id = bs.book_store_idjoin book b on b.book_id=bsb.book_idwhere bs. book_store_id = ($1);"
//ex15
const updatePerson= "update person set first_name = $2 where person_id = $1 returning person_id;"
//ex16
const addBookstore = "insert into book_store (book_store_name) values ($1) returning book_store_name;"
//ex17
const addBook = "insert into book (title, isbn) values ($1, $2) returning book_id ;"
const add_Book_Store_Book ="insert into book_store_book (book_id, book_store_id) values ($1, $2) returning book_store_book_id;"


const pool = new Pool({
  user: "postgres",
  password: "Lamarjackson8",
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
    console.log(await this.getBooks(bookstoreId))
}

exports.ex15 = async () => {
    let personId = 1
    let newName = "Johnny"
    console.log(await this.updatePerson(personId, newName))
}

exports.ex16= async () => {
    let bookstoreName = "Book World"
    console.log(await this.addBookstore(bookstoreName))
}

exports.ex17 = async () => {
    let newBookTitle = "It Begins Here"
    let newBookIsbn = "123-12-12344-22-111"
    let bookStoreId = 1
    console.log(await this.addBook(newBookTitle, newBookIsbn, bookStoreId))
}

const main = async () => {
    await ex17()
    process.exit()
}

//
// Your functions here...
//

exports.getPerson = async (personId) => {
    let retval = null;
    try{
     let r = await pool.query(GET_PERSON, [personId]);
     retval = r.rows;
    } catch(err){
        console.error(err)
    }
    return retval;
}

exports.getBooks = async (bookStoreId) => {
    let retval = null;
    try{
        let r = await pool.query(GET_BOOKS, [bookStoreId]);
        retval = r.rows;
       } catch(err){
           console.error(err)
       }
    return retval;
}

exports.updatePerson = async (personId, newName) => {
    let retval = null;
    try{
        let r = await pool.query(updatePerson, [personId,newName]);
        retval = r.rows;
       } catch(err){
           console.error(err)
       }
    return retval;
}

exports.addBookstore = async (bookstoreName) => {
    let retval = null;
    try{
        let r = await pool.query(addBookstore, [bookstoreName]);
        retval = r.rows;
       } catch(err){
           console.error(err)
       }
    return retval;
}

exports.addBook = async (title, isbn, bookstoreId) => {
    let retval = null;
    try {
        let r = await pool.query(addBook, [title, isbn]);
        let bookId = r.rows[0].book_id;
        r = await pool.query(add_Book_Store_Book, [bookId, bookstoreId]);
        retval = r.rows[0];
      } catch (err) {
        console.error(err);
      }
    return retval;
}

//main()
