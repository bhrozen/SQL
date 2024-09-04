Select
    "category"."name",
    count("film"."film_id") As "film_count"
From "film"
Inner join "film_category" On "film"."film_id" = "film_category"."film_id"
Inner join "category" On "film_category"."category_id" = "category"."category_id"
Group By "category"."name"