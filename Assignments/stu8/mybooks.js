//
// File: data-access.js
// Date: 6/25/2022
//

const ADD_LOCATION = `
  insert into 
    location (loc_name) 
  values 
    ($1) returning loc_name`

const GET_BOOKS_LOCATION = `select b.title, 
    l.loc_name 
    from books b 
      join book_location bl on b.book_id=bl.book_id 
      join location l on bl.book_loc_id=l.loc_id where l.loc_id = $1;`

const ADD_BOOK = 
    `insert into 
        books (title, author) 
    values 
        ($1, $2) 
    returning book_id;`
const ADD_BOOK_TO_LOC = 
    `insert into 
        book_location (book_id, book_loc_id) 
    values 
      ($1, $2) 
    returning book_loc_book_id;`

const BOOKS_READ_SINCE = `select b.title,
      b.author,
      br.read_date
    from books b
      join book_read br on b.book_id=br.book_id
      where br.read_date > $1`

const { Pool } = require("pg");

const pool = new Pool({
    user: "postgres",
    password: "C0cacola0",
    database: "Classwork",
    host: "localhost",
    port: 5432,
});



exports.newBook = async () => {
    let newBookTitle = "Fair Trade"
    let newBookAuthor = "Sharon Lee, Steve Miller"
    let locationId = 5
    return await this.addBook(newBookTitle, newBookAuthor, locationId)
}


exports.booksloc = async () => {
  let locationId = 4
  return await this.bookLoc(locationId)
}

exports.location  = async () => {
  let locationName = "Kindle"
  return await this.addLocation(locationName)
}

exports.read = async () => {
  let readSinceDate = "2021-12-31"
  return await this.readBook(readSinceDate)
}

// -------------

exports.readBook = async (readSinceDate) => {
  let retval = null;
  try {
    let r = await pool.query(BOOKS_READ_SINCE, [readSinceDate]);
    retval = r.rows;
  } catch (err) {
    console.error(err);
  }
  return retval;
}

exports.addBook = async (title, author, locationId) => {
  let retval = null;
  try {
      let r = await pool.query(ADD_BOOK, [title, author]);
      retval = r.rows;
      let bookId = r.rows[0].book_id;
      w = await pool.query(ADD_BOOK_TO_LOC, [bookId, locationId]);
      retval = w.rows[0];
    } catch (err) {
      console.error(err);
    }
  return retval;
}

exports.addLocation = async (locationName) => {
  let retval = null;
  try {
      let r = await pool.query(ADD_LOCATION, [locationName]);
      retval = r.rows;
    } catch (err) {
      console.error(err);
    }
  return retval;
}


exports.bookLoc = async (locationId) => {
  let retval = null;
  try {
    let r = await pool.query(GET_BOOKS_LOCATION, [locationId]);
    retval = r.rows;
  } catch (err) {
    console.error(err);
  }
  return retval;
  
}



// main()
