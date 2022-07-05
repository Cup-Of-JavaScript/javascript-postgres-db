/**
 * Ex. 1
 */
SELECT first_name, last_name FROM person ORDER BY last_name DESC
/**
 * Ex. 2
 */
Select * from book where title = 'Everything I Never Told You';
/**
 * Ex. 3
 */
Select  person_id, first_name, last_name, dob from person where dob > '1980-01-01';
/**
 * Ex. 4
 */
Select person_id, first_name, last_name, dob from person where dob between '1970-01-01' and '1979-12-31';
/**
 * Ex. 5
 */
Update person set first_name = 'John' where person_id = 9;
/**
 * Ex. 6
 */
 Insert into person (person_type_id, book_store_id, first_name, last_name, dob) values (2, 2, 'Sally', 'Mustang', '01/02/1965');
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
