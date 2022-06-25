
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

/*---------------------------------------------------------------------------*/

/**
 * person
 */
create sequence person_seq as integer;

CREATE TABLE IF NOT EXISTS public.person
(
    person_id integer NOT NULL DEFAULT nextval('person_seq'::regclass),
    person_type_id integer,
    first_name character varying(50) COLLATE pg_catalog."default",
    last_name character varying(50) COLLATE pg_catalog."default",
    dob date,
    CONSTRAINT person_pkey PRIMARY KEY (person_id),
    CONSTRAINT "pt-fk" FOREIGN KEY (person_type_id)
        REFERENCES public.person_type (person_type_id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE NO ACTION
        NOT VALID
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.person
    OWNER to postgres;
	
alter sequence person_seq owned by person.person_id;

/*----------------------------------------------------------------------------*/

INSERT INTO public.person_type(person_type) VALUES ('Manager');
INSERT INTO public.person_type(person_type) VALUES ('Employee');
INSERT INTO public.person_type(person_type) VALUES ('CEO');

INSERT INTO person(person_type_id, first_name, last_name, dob) values (1,'Alice', 'Jones', '8/29/1970');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'Bob', 'Marley', '2/15/1975');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'Charlie', 'Thomas', '9/12/1976');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'Dave', 'Campbell', '7/10/1979');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'Earl', 'Jendkins', '9/8/1980');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'Frank', 'Zappa', '1/8/1981');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'George', 'Smith', '3/8/1986');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'Harry', 'Chapmin', '6/9/1980');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (2,'Jack', 'Grow', '10/8/1988');
INSERT INTO person(person_type_id, first_name, last_name, dob) values (3,'Kim', 'Weldon', '11/8/1970');

create view view_person as
select p.person_id, p.person_type_id, p.first_name, p.last_name,p.dob, pt.person_type from person p
 join person_type pt on p.person_type_id = pt.person_type_id;
 
/*---------------------------------------------------------------------*/ 
 
drop table person_type cascade;
drop table person cascade;

/*----------------------------------------------------------------------*/

select * from view_person;
 