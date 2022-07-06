/**
 * Ex. 1
 */
select first_name, last_name from person order by last_name desc;
/**
 * Ex. 2
 */
select * from book where book_id = 4;
/**
 * Ex. 3
 */
select  person_id, first_name, last_name, dob from person where dob > '1980-09-08';
/**
 * Ex. 4
 */
select  person_id, first_name, last_name, dob from person where dob < '1980-06-09';
/**
 * Ex. 5
 */
update person set first_name = 'John' where person_id = 9;
/**
 * Ex. 6
 */
insert into person (person_id, person_type_id, book_store_id, first_name, last_name, dob) values (11, 2, 2,'Sally', 'Mustang', '1965-01-02'); 
/**
 * Ex. 7
 */
select * from person where person_type_id = 2;
/**
 * Ex. 8
 */
select 
p.first_name, 
p.last_name, 
pe.person_type 
from person p
join person_type pe on p.person_type_id = pe.person_type_id;
/**
 * Ex. 9
 */
select 
p.first_name, 
p.last_name, 
pe.person_type 
from person p
join person_type pe on p.person_type_id = pe.person_type_id
where 
pe.person_type_id = 1;
/**
 * Ex. 10
 */
select 
bsb.book_store_id,
bsb.book_id,
bs.book_store_name,
b.title,
b.isbn
from book_store_book bsb
join book_store bs on bsb.book_store_id = bs.book_store_id
join book b on bsb.book_id = b.book_id
where
bs.book_store_id = 3;
