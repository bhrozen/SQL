CREATE OR REPLACE FUNCTION insert_new_film(
    v_title varchar(255),
    v_description text,
    v_release_year integer,
    v_language_name char(20),
    v_original_language_name char(20),
    v_rental_duration integer,
    v_rental_rate integer,
    v_length integer,
    v_rating mpaa_rating,
    v_replacement_cost decimal(5,2)
) RETURNS integer LANGUAGE plpgsql As
$$
DECLARE
   new_film_id "film"."film_id"%type;
   v_language_id "language"."language_id"%type;
   v_original_language_id "language"."language_id"%type;
BEGIN
    select "language"."language_id"
    into v_language_id
    from "language"
    Where "name" = v_language_name;

    select "language"."language_id"
    into v_original_language_id
    from "language"
    Where "name" = v_original_language_name;

    INSERT INTO film (title,
                      description,
                      release_year,
                      language_id,
                      original_language_id,
                      rental_duration,
                      rental_rate,
                      length,
                      replacement_cost,
                      rating)
    VALUES (v_title,
            v_description,
            v_release_year,
            v_language_id,
            v_original_language_id,
            v_rental_duration,
            v_rental_rate,
            v_length,
            v_replacement_cost,
            v_rating) RETURNING "film_id" INTO new_film_id;
    RETURN new_film_id;
end
$$;


Select insert_new_film(
               v_title := 'Já padouch 4',
               v_description := 'Animovaný film pro děti',
               v_release_year := 2024,
               v_language_name := 'English',
               v_original_language_name := 'English',
               v_rental_duration := 14,
               v_rental_rate := 1,
               v_replacement_cost := 2.99,
               v_rating := 'PG'::mpaa_rating,
               v_length := 252
       )