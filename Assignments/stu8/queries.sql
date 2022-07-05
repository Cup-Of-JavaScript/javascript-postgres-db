/**
 * Ex. 1
 */

select first_name, last_name from person order by last_name desc;

/**
 * Ex. 2
 */

select * from book where title = 'Everything I Never Told You';

/**
 * Ex. 3
 */

select person_id, first_name, last_name, dob from person where dob > '1980-01-01';

/**
 * Ex. 4
 */

select person_id, first_name, last_name, dob from person where dob between '1970-01-01' and '1979-12-31';

/**
 * Ex. 5
 */

update person set first_name = 'John' where person_id = 9;

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
