/**
 * Ex. 11
 */
BEGIN;

select * from lemonade;
select * from size;

insert into size (lemonade_size, lemonade_price) values ('Small', '$1.00');
insert into size (lemonade_size, lemonade_price) values ('Medium', '$2.00');
insert into size (lemonade_size, lemonade_price) values ('Large', '$3.00');

insert into lemonade (lemonade_flavor) values ('Lemon');
insert into lemonade (lemonade_flavor) values ('Strawberry');

select * from lemonade
     where date > now() - interval '1 day';
     
     insert into lemonade(lemonade_size_id, lemonade_flavor, date, sales) 
     values(6, 'Strawberry','2020-07-07',200)

CREATE TABLE IF NOT EXISTS public.lemonade
(
    lemonade_id serial NOT NULL,
    lemonade_size_id integer,
    lemonade_flavors "char" DEFAULT 50,
    lemonade_total integer,
    date timestamp without time zone,
    PRIMARY KEY (lemonade_id)
);

CREATE TABLE IF NOT EXISTS public.size
(
    size_id serial NOT NULL,
    lemonade_size "char" DEFAULT 50,
    lemonade_price money,
    PRIMARY KEY (size_id)
);

ALTER TABLE IF EXISTS public.lemonade
    ADD FOREIGN KEY (lemonade_size_id)
    REFERENCES public.size (size_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
/**
 * Ex. 12
 */
