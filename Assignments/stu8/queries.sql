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

insert into person (person_type_id, book_store_id, first_name, last_name, dob) values (2, 2, 'Sally', 'Mustang', '01/02/1965');

/**
 * Ex. 7
 */

select count(*) from person where person_type_id = 2;

/**
 * Ex. 8
 */

select first_name, last_name, person_type from person p
    join person_type pt on p.person_type_id=pt.person_type_id

/**
 * Ex. 9
 */
select first_name, last_name, person_type from person p
    join person_type pt on p.person_type_id=pt.person_type_id
    where pt.person_type = 'Manager'
/**
 * Ex. 10
 */
select 
    bs.book_store_id,
    b.book_id,
    bs.book_store_name,
    b.title,
    b.isbn

from book b
    join book_store_book bsb on b.book_id=bsb.book_id 
    join book_store bs on bsb.book_store_id=bs.book_store_id where bs.book_Store_id = 3
    
