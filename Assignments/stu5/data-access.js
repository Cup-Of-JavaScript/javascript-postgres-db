//
// File: data-access.js
// Date: 6/25/2022
//
const GET_PERSON = "select * from person where person_id =($1);"
const GET_BOOK_STORE_ID = `
select 
b.title
from book_store bs
join book_store_book bsb on bsb.book_store_id = bs.book_store_id
join book b on b.book_id=bsb.book_id
where bs. book_store_id = ($1);`
const UPDATE_PERSON = "update person set first_name = $2 where person_id = $1 returning person_id;"
const INSERT_BOOK_STORE = 
`insert into 
   book_store (book_store_name) 
values 
($1) returning book_store_name;`

const { Pool } = require("pg");

const pool = new Pool({
  user: "postgres",
  password:"Diane1991@" ,
  database: "postgres",
  host: "localhost",
  port: 5432,
});

exports.ex13 = async () => {
    let personId = 1
    console.log(await this.getPerson(personId))
}

exports. ex14 = async () => {
    let bookstoreId = 1
    console.log(await this.getBooks(bookstoreId))
}

exports. ex15 = async () => {
    let personId = 1
    let newName = "Johnny"
    return await this.updatePerson(personId, newName)
}

exports.ex16 = async () => {
    let bookstoreName = "Book World"
    return await addBookstore(bookstoreName)
}

const ex17 = async () => {
    let newBookTitle = "It Begins Here"
    let newBookIsbn = "123-12-12344-22-111"
    let bookStoreId = 1
    console.log(await addBook(newBookTitle, newBookIsbn, bookStoreId))
}

//
// Your functions here...
//

exports.getPerson = async (personId) => {
    let retval = null;
    try{
        let r = await pool.query(GET_PERSON, [personId]);
        retval = r.rows;
    }catch (err){
        console.error(err);
    }
    return retval;
}

exports. getBooks = async (bookStoreId) => {
    let retval = null;
    try{
        let r = await pool.query(GET_BOOK_STORE_ID, [bookStoreId]);
        retval = r.rows;
    }catch (err){
        console.error(err);
    }
    return retval;
}

exports.updatePerson = async (personId, newName) => {
    let retval = null;
    try {
      let r = await pool.query(UPDATE_PERSON, [personId, newName]);
      retval = r.rows[0];
    } catch (err) {
      console.error(err);
    }
    return retval;
}

const addBookstore = async (bookstoreName) => {
    let retval = null;
    try {
        let r = await pool.query(INSERT_BOOK_STORE, [bookstoreName]);
        retval = r.rows[0];
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

// main()
