/**
 * Ex. 1
 */
select (last_name, first_name) from person order by last_name desc;
/**
 * Ex. 2
 */
select * from book where book_id = (4);
/**
 * Ex. 3
 */
select * from person where dob between '1980-06-09' and '1988-10-08';
/**
 * Ex. 4
 */
select * from person where dob between '1970-08-29' and '1979-07-10';
/**
 * Ex. 5
 */
update person set first_name = 'John' where person_id = 9;
/**
 * Ex. 6
 */
insert into person (person_type_id, book_store_id, first_name, last_name, dob) values (2, 2, 'Sally', 'Mustang', '1965-01-02');
/**
 * Ex. 7
 */
select count(*) from person where person_type_id = (2);
/**
 * Ex. 8
 */
select 
  p.first_name, 
  p.last_name, 
  pt.person_type
from person p
   join person_type pt on p.person_type_id = pt.person_type_id
/**
 * Ex. 9
 */
select 
  p.first_name, 
  p.last_name, 
  pt.person_type
from person p
   join person_type pt on p.person_type_id = pt.person_type_id
where 
  p.person_type_id = 1;
/**
 * Ex. 10
 */
create view view_book as
select
  bs.book_store_id,
  b.book_id,
  bs.book_store_name,
  b.title,
  b.isbn
from book_store bs
join book_store_book bb on bb.book_store_id = bs.book_store_id
join book b on  b.book_id = bb.book_id
where 
  bs.book_store_id = 3;
  
select * from view_book;