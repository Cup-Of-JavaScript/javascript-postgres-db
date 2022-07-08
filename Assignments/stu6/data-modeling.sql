/**
 BEGIN;


CREATE TABLE IF NOT EXISTS public.lemonade
(
    sales_count numeric NOT NULL,
    flavor character varying(30),
    size numeric,
    PRIMARY KEY (sales_count)
);

CREATE TABLE IF NOT EXISTS public."Sales"
(
    sales_count numeric NOT NULL,
    day serial,
    PRIMARY KEY (sales_count)
);

ALTER TABLE IF EXISTS public."Sales"
    ADD FOREIGN KEY (sales_count)
    REFERENCES public.lemonade (sales_count) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
 */

/**
 * Ex. 12
 */
