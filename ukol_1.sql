Select
    "customer"."first_name",
    "customer"."last_name",
    "address"."address"
From "customer"
Inner Join "address" On "customer"."address_id" = "address"."address_id"
Inner Join "rental" On "customer"."customer_id" = "rental"."customer_id"
Where extract(YEAR from "rental"."rental_date") = (Select extract(YEAR from max("rental_date")) From "rental");
