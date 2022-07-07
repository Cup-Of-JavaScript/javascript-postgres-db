/**
 * Ex. 11
 */
BEGIN;


CREATE TABLE IF NOT EXISTS public."Lemonade Stand"
(
    lemonade_id serial NOT NULL,
    lemonade_sizes text,
    lemonade_flavors "char",
    PRIMARY KEY (lemonade_id)
);

CREATE TABLE IF NOT EXISTS public."Lemonade sizes"
(
    size_id serial NOT NULL,
    lemonade_sizes "char",
    lemonade_prices money,
    PRIMARY KEY (size_id)
);

ALTER TABLE IF EXISTS public."Lemonade Stand"
    ADD FOREIGN KEY (lemonade_sizes)
    REFERENCES public."Lemonade Stand" (lemonade_sizes) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade Stand"
    ADD CONSTRAINT lemon FOREIGN KEY (lemonade_flavors)
    REFERENCES public."Lemonade Stand" (lemonade_flavors) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade Stand"
    ADD CONSTRAINT strawberry FOREIGN KEY (lemonade_flavors)
    REFERENCES public."Lemonade Stand" (lemonade_flavors) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade sizes"
    ADD CONSTRAINT small FOREIGN KEY (lemonade_sizes, lemonade_sizes)
    REFERENCES public."Lemonade Stand" (lemonade_sizes, lemonade_sizes) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade sizes"
    ADD CONSTRAINT medium FOREIGN KEY (lemonade_sizes, lemonade_sizes)
    REFERENCES public."Lemonade sizes" (lemonade_sizes, lemonade_sizes) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade sizes"
    ADD CONSTRAINT large FOREIGN KEY (lemonade_sizes, lemonade_sizes)
    REFERENCES public."Lemonade sizes" (lemonade_sizes, lemonade_sizes) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade sizes"
    ADD CONSTRAINT "$1.00" FOREIGN KEY (lemonade_prices)
    REFERENCES public."Lemonade sizes" (lemonade_prices) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade sizes"
    ADD CONSTRAINT "$2.00" FOREIGN KEY (lemonade_prices)
    REFERENCES public."Lemonade sizes" (lemonade_prices) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public."Lemonade sizes"
    ADD CONSTRAINT "$3.00" FOREIGN KEY (lemonade_prices)
    REFERENCES public."Lemonade sizes" (lemonade_prices) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
/**
 * Ex. 12
 */
