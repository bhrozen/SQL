Select
    "address"."address",
    "staff"."first_name",
    "staff"."last_name",
    count("rental"."rental_id") As "count_rental",
    EXTRACT(YEAR from "rental"."rental_date") as "rental_year"
from "staff"
Inner Join "rental" On "staff"."staff_id" = "rental"."staff_id"
Inner Join "inventory" On "rental"."inventory_id" = "inventory"."inventory_id"
Inner Join "film" On "inventory"."film_id" = "film"."film_id"
Inner Join "store" On "inventory"."store_id" = "store"."store_id"
Inner Join "address" On "store"."address_id" = "address"."address_id"
Group By "address"."address",
    "staff"."first_name",
    "staff"."last_name",
    "rental_year"
Order By "rental_year";