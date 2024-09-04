-- v zadání je penále po 14 dnech, ale tabulka neobsahuje záznamy s datem výpujčky větší jak 10 dní, takže jsem použila 7 dní
Select
    "film"."title",
    "customer"."first_name",
    "customer"."last_name",
    "address"."address",
    (DATE_PART('day', "rental"."return_date" - "rental"."rental_date") - 7) * ("payment"."amount" / 100) as "penale"
from "payment"
Inner Join "rental" On "payment"."rental_id" = "rental"."rental_id"
Inner Join "customer" On "customer"."customer_id" = "rental"."customer_id"
Inner JOin "address" On "customer"."address_id" = "address"."address_id"
Inner Join "inventory" On "rental"."inventory_id" = "inventory"."inventory_id"
Inner JOin "film" On "film"."film_id" = "inventory"."film_id"
Where DATE_PART('day', "rental"."return_date" - "rental"."rental_date") > 7