/**
 * Ex. 1
 */
SELECT first_name, last_name FROM person ORDER BY last_name DESC 

/**
 * Ex. 2
 */
 SELECT * FROM book WHERE title = "Everything I Never Told You"; 
--  OR
 SELECT * FROM book WHERE BOOK_ID=4; 

/**
 * Ex. 3
 */

 SELECT person_id, first_name, last_name, dob FROM person WHERE dob > '1980-01-01';

/**
 * Ex. 4
 */
SELECT person_id, first_name, last_name, dob FROM person WHERE dob BETWEEN  '1970-08-29' AND '1979-07-10' ;

/**
 * Ex. 5
 */

UPDATE person SET first_name = 'John' WHERE person_id=9

/**
 * Ex. 6
 */

/**
 * Ex. 7
 */

/**
 * Ex. 8
 */

/**
 * Ex. 9
 */

/**
 * Ex. 10
 */
