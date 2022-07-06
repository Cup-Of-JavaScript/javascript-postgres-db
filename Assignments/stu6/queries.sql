/**
 * Ex. 1
 */

/**
 Select * from book where book_id = (4);
 */

/**
 select * from person where dob between '1981-01-01' and '1990-01-01';
 */

/**
 select * from person where dob between '1970-01-01' and '1979-12-31';
 */

/**
update person set first_name = 'John' where person_id = 9;
 */

/**
 insert into person (person_type_id, book_store_id, first_name, last_name, dob) values (2, 2, 'Sally', 'Mustang', '1965-01-02');
 */

/**
 select count(*) from person where person_type_id = (2);
 */

/**
 select first_name, last_name, person_type from person
join person_type 
on person.person_type_id = person_type.person_type_id; 
 */

/**
 select first_name, last_name, person_type from person
join person_type 
on person.person_type_id = person_type.person_type_id
where person_type = 'Manager'; 
 */

/**
 * Ex. 10
 */
