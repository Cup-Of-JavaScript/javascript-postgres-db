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

UPDATE person SET first_name = 'John' WHERE person_id=9;
/**
 * Ex. 6
 */
INSERT INTO person (first_name, last_name, dob, person_type_id, book_store_id) VALUES('sally', 'mustang', '1965-02-01', 2 , 2);

/**
 * Ex. 7
 */
 SELECT COUNT(*) FROM person WHERE person_type_id IN 2;

/**
 * Ex. 8
 */
SELECT p.first_name, p.last_name, t.person_type
FROM person p 
JOIN person_type t 
ON p.person_type_id = t.person_type_id;

/**
 * Ex. 9
 */
select p.first_name, p.last_name, t.person_type
FROM person p 
JOIN person_type t ON p.person_type_id = t.person_type_id
WHERE t.person_type = 'Manager';
/**
 * Ex. 10
 */
SELECT b.*, bs.*
FROM book b 
JOIN book_store_book bn ON bn.book_id = b.book_id
JOIN book_store bs ON bs.book_store_id = bn.book_store_id
WHERE bs.book_store_name = 'Best Books in Town';
