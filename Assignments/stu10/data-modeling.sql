/**
 * Ex. 11
 */
BEGIN;


CREATE TABLE IF NOT EXISTS public.lemonade
(
    lemonade_id serial NOT NULL,
    lemonade_size text,
    price integer,
    flavor_id integer,
    purchase_date date,
    number_drinks integer,
    PRIMARY KEY (lemonade_id)
);

CREATE TABLE IF NOT EXISTS public.flavors
(
    flavor_id serial NOT NULL,
    flavor_name text,
    PRIMARY KEY (flavor_id)
);

ALTER TABLE IF EXISTS public.lemonade
    ADD FOREIGN KEY (flavor_id)
    REFERENCES public.flavors (flavor_id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
/**
 * Ex. 12
 */
