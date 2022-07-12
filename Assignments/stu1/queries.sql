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
/**
 * Ex. 11
 */
BEGIN;

select * from shirt_inventory;
select * from hat_inventory;
select * from jacket_inventory;
select * from pant_inventory;
select * from clothing_store;

insert into clothing_store (shirt_count, jacket_count, pant_count, hat_count) values (250, 110, 704, 30);
insert into shirt_inventory (shirt_type, shirt_color, shirt_price) values ('Tube Top', 'Orange', '$5.99');
insert into hat_inventory (hat_type, hat_color, hat_price) values ('Baseball Cap', 'Bleach Splatter', '$24.99');
insert into jacket_inventory (jacket_type, jacket_color, jacket_price) values ('Bubble Coat', 'Red', '$109.99');
insert into pant_inventory (pant_type, pant_color, pant_price) values ('Slacks', 'Light Gray', '$32.99');





CREATE TABLE IF NOT EXISTS public.clothing_store
(
    clothing_store_id serial NOT NULL,
    shirt_id bigint,
    shirt_count integer,
    jacket_count integer,
    pant_count integer,
    hat_count integer,
    PRIMARY KEY (clothing_store_id)
);

CREATE TABLE IF NOT EXISTS public.shirt_inventory
(
    shirt_id serial NOT NULL,
    jacket_id bigint,
    size_id integer,
    shirt_type text,
    shirt_color text,
    shirt_price money,
    PRIMARY KEY (shirt_id)
);

CREATE TABLE IF NOT EXISTS public.jacket_inventory
(
    jacket_id serial NOT NULL,
    pant_id bigint,
    size_id integer,
    jacket_type text,
    jacket_color text,
    jacket_price money,
    PRIMARY KEY (jacket_id)
);

CREATE TABLE IF NOT EXISTS public.pant_inventory
(
    pant_id serial NOT NULL,
    hat_id bigint,
    size_id integer,
    pant_type text,
    pant_color text,
    pant_price money,
    PRIMARY KEY (pant_id)
);

CREATE TABLE IF NOT EXISTS public.hat_inventory
(
    hat_id serial NOT NULL,
    size_id text,
    hat_type text,
    hat_color text,
    hat_price money,
    PRIMARY KEY (hat_id)
);

ALTER TABLE IF EXISTS public.clothing_store
    ADD FOREIGN KEY (shirt_id)
    REFERENCES public.shirt_inventory (shirt_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.shirt_inventory
    ADD FOREIGN KEY (jacket_id)
    REFERENCES public.jacket_inventory (jacket_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.jacket_inventory
    ADD FOREIGN KEY (pant_id)
    REFERENCES public.pant_inventory (pant_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.pant_inventory
    ADD FOREIGN KEY (hat_id)
    REFERENCES public.hat_inventory (hat_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;