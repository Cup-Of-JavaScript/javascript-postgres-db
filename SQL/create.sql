/** 
 * book_store
 */
 
create sequence book_store_seq as integer;

CREATE TABLE IF NOT EXISTS public.book_store
(
    book_store_id integer NOT NULL DEFAULT nextval('book_store_seq'::regclass),
    book_store_name character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT book_store_pkey PRIMARY KEY (book_store_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.book_store
    OWNER to postgres;
	
alter sequence book_store_seq owned by book_store.book_store_id;

/**
 * person_type
 */
create sequence person_type_seq as integer;

CREATE TABLE IF NOT EXISTS public.person_type
(
    person_type_id integer NOT NULL DEFAULT nextval('person_type_seq'::regclass),
    person_type character varying(50) COLLATE pg_catalog."default",
    CONSTRAINT person_type_pkey PRIMARY KEY (person_type_id)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person_type
    OWNER to postgres;
	
alter sequence person_type_seq owned by person_type.person_type_id;

/**
 * person
 */
create sequence person_seq as integer;

CREATE TABLE IF NOT EXISTS public.person
(
    person_id integer NOT NULL DEFAULT nextval('person_seq'::regclass),
    person_type_id integer,
	book_store_id integer,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    dob date,
    CONSTRAINT person_pkey PRIMARY KEY (person_id),
    CONSTRAINT "bs-fk" FOREIGN KEY (book_store_id)
        REFERENCES public.book_store (book_store_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID,
    CONSTRAINT "pt-fk" FOREIGN KEY (person_type_id)
        REFERENCES public.person_type (person_type_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person
    OWNER to postgres;
	
alter sequence person_seq owned by person.person_id;

/*----------------------------------------------------------------------------*/

INSERT INTO public.person_type(person_type) VALUES ('Manager');
INSERT INTO public.person_type(person_type) VALUES ('Cashier');
INSERT INTO public.person_type(person_type) VALUES ('Stock Person');

INSERT INTO public.book_store(book_store_name) VALUES ('Barnes & Nobles');
INSERT INTO public.book_store(book_store_name) VALUES ('Books are Us');
INSERT INTO public.book_store(book_store_name) VALUES ('Best Books in Town');

INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (1, 1, 'Alice', 'Jones', '8/29/1970');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (1, 2, 'Bob', 'Marley', '2/15/1975');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (1, 3, 'Charlie', 'Thomas', '9/12/1976');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (2, 1, 'Dave', 'Campbell', '7/10/1979');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (2, 1, 'Earl', 'Jendkins', '9/8/1980');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (2, 2, 'Frank', 'Zappa', '1/8/1981');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (2, 2, 'George', 'Smith', '3/8/1986');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (3, 3, 'Harry', 'Chapmin', '6/9/1980');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (3, 3, 'Jack', 'Grow', '10/8/1988');
INSERT INTO person(person_type_id, book_store_id, first_name, last_name, dob) values (3, 3, 'Kim', 'Weldon', '11/8/1970');

create view view_person as
select 
	p.person_id, 
	p.person_type_id,
	p.book_store_id,
	p.first_name, 
	p.last_name,
	p.dob, 
	pt.person_type,
	bs.book_store_name
from person p
 join person_type pt on p.person_type_id = pt.person_type_id
 join book_store bs on p.book_store_id = bs.book_store_id
 

/* 
  drop table person_type cascade;
  drop table person cascade;
  drop table book_store cascade;
  
  select * from view_person;
*/


