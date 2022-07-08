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
    date timestamp without time zone,
    sales integer,
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
-- This script was generated by a beta version of the ERD tool in pgAdmin 4.
-- Please log an issue at https://redmine.postgresql.org/projects/pgadmin4/issues/new if you find any bugs, including reproduction steps.
BEGIN;


CREATE TABLE IF NOT EXISTS public.bank_account
(
    account_id integer NOT NULL DEFAULT nextval('bank_account_account_id_seq'::regclass),
    banking_savings_id bigint,
    checking_first_n text COLLATE pg_catalog."default",
    checking_last_n text COLLATE pg_catalog."default",
    checking_balance money,
    is_active_c boolean,
    CONSTRAINT bank_account_pkey PRIMARY KEY (account_id)
);

CREATE TABLE IF NOT EXISTS public.retirement
(
    retirement_id bigint NOT NULL DEFAULT nextval('retirement_retirement_id_seq'::regclass),
    retirement_first_n text COLLATE pg_catalog."default",
    retirement_last_n text COLLATE pg_catalog."default",
    retirement_balance money,
    is_active_r boolean,
    CONSTRAINT retirement_pkey PRIMARY KEY (retirement_id)
);

CREATE TABLE IF NOT EXISTS public.savings
(
    savings_id integer NOT NULL DEFAULT nextval('savings_savings_id_seq'::regclass),
    banking_retirement_id bigint,
    savings_first_n text COLLATE pg_catalog."default",
    savings_last_n text COLLATE pg_catalog."default",
    savings_balance money,
    is_active_s boolean,
    CONSTRAINT savings_pkey PRIMARY KEY (savings_id)
);

ALTER TABLE IF EXISTS public.bank_account
    ADD CONSTRAINT bank_account_banking_savings_id_fkey FOREIGN KEY (banking_savings_id)
    REFERENCES public.savings (savings_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.savings
    ADD CONSTRAINT savings_banking_retirement_id_fkey FOREIGN KEY (banking_retirement_id)
    REFERENCES public.retirement (retirement_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;