/**
 * Ex. 1
 */
select first_name,last_name from person order by last_name Desc
/**
 * Ex. 2
 */
Select * from book where title = 'Everything I Never Told You';
/**
 * Ex. 3
 */
select * from person where dob between '1981-01-01' and '1990-01-01';
/**
 * Ex. 4
 */
select * from person where dob between '1970-01-01' and '1979-12-31';
/**
 * Ex. 5
 */update person set first_name = 'John' where person_id = 9;

/**
 * Ex. 6
 */
insert into person (person_type_id, book_store_id, first_name, last_name, dob) values (2, 2, 'Sally', 'Mustang', '01/02/1965');
/**
 * Ex. 7
 */
select count(*) from person where person_type_id = 2;
/**
 * Ex. 8
 */

/**
 * Ex. 9
 */

/**
 * Ex. 10
 */
