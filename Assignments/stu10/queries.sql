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
Select count(*) from person where person_type_id = 2;
/**
 * Ex. 8
 */
Select first_name, last_name, person_type from person p
  join person_type pt on p.person_type_id=pt.person_type_id
/**
 * Ex. 9
 */
  select first_name, last_name, person_type from person
join person_type 
on person.person_type_id = person_type.person_type_id
where person_type = 'Manager'
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