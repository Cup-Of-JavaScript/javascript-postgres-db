/**
 * Ex. 11
 */
BEGIN;

select * from lemonade;
select * from size;
select * from logging.t_history;

insert into size (lemonade_size, lemonade_price) values ('Small', '$1.00');
insert into size (lemonade_size, lemonade_price) values ('Medium', '$2.00');
insert into size (lemonade_size, lemonade_price) values ('Large', '$3.00');

insert into lemonade (lemonade_flavor) values ('Lemon');
insert into lemonade (lemonade_flavor) values ('Strawberry');

CREATE TABLE IF NOT EXISTS public.lemonade
(
    lemonade_id serial NOT NULL,
    lemonade_size_id integer,
    lemonade_flavors "char",
    PRIMARY KEY (lemonade_id)
);

CREATE TABLE IF NOT EXISTS public.size
(
    size_id serial NOT NULL,
    lemonade_size "char",
    lemonade_price money,
    PRIMARY KEY (size_id)
);

CREATE SCHEMA logging;
CREATE TABLE logging.t_history (
id   serial,
tstamp   timestamp DEFAULT now(),
schemaname   text,
tabname   text,
operation   text,
who   text   DEFAULT current_user,
new_val   json,
old_val json
);

CREATE FUNCTION change_trigger() RETURNS trigger AS $$
BEGIN
IF TG_OP = 'INSERT'
THEN
INSERT INTO logging.t_history (tabname, schemaname, operation, new_val)
VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(NEW));
RETURN NEW;
ELSIF TG_OP = 'UPDATE'
THEN
INSERT INTO logging.t_history (tabname, schemaname, operation, new_val, old_val)
VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP,
row_to_json(NEW), row_to_json(OLD));
RETURN NEW;
ELSIF TG_OP = 'DELETE'
THEN
INSERT INTO logging.t_history (tabname, schemaname, operation, old_val)
VALUES (TG_RELNAME, TG_TABLE_SCHEMA, TG_OP, row_to_json(OLD));
RETURN OLD;
END IF;
END;
$$ LANGUAGE 'plpgsql' SECURITY DEFINER;

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
